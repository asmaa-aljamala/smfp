
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/text_utils.dart';

final _firestore=FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  static const String screenRoute = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController =TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  //  void getMessage() async{
  // final messages= await  _firestore.collection('messages').get();
  // for(var message in messages.docs){
  //   print(message.data());
  //
  // }
  //  }
//   void messagesStream() async{
//   await for ( var snapshot in _firestore.collection('messages').snapshots()){
// for (var message in snapshot.docs){
// print(message.data());
// }}}

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          elevation: 0,
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  child: Image.asset('assets/images/user.png')),
                  SizedBox(width: 20),
               Text('أسماء يونس الجملة',style: TextStyle(fontSize: 20,color: Colors.black,
               ),)

            ],
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       _auth.signOut();
          //       Navigator.pop(context);
          //       // messagesStream();
          //
          //     },
          //     icon: Icon(Icons.close),
          //   ),
          //
          //
          // ],

        ),
        body:
        SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageStreamBuilder(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical:  2,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 32,
                        color: Color(0xFF087949).withOpacity(0.08),
                      ),
                    ],
                  ),


                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:  10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.sentiment_satisfied_alt_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.64),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: messageTextController,
                                  onChanged: (value) {
                                    messageText=value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "اكتب هنا",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              // Icon(
                              //   Icons.attach_file,
                              //   color: Theme.of(context)
                              //       .textTheme
                              //       .bodyText1
                              //       ?.color
                              //       ?.withOpacity(0.64),
                              // ),
                              // SizedBox(width: 4),
                              // Icon(
                              //   Icons.camera_alt_outlined,
                              //   color: Theme.of(context)
                              //       .textTheme
                              //       .bodyText1
                              //       ?.color
                              //       ?.withOpacity(0.64),
                              // ),
                              // TextButton(
                              //   onPressed: () {
                              //     messageTextController.clear();
                              //     _firestore.collection('messages').add({
                              //       'text':messageText,
                              //       'sender':signedInUser.email,
                              //       'time' :FieldValue.serverTimestamp(),
                              //     });
                              //   },
                              //   child: Text(
                              //     'send',
                              //     style: TextStyle(
                              //       color: Colors.blue[800],
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 18,
                              //     ),
                              //   ),
                              // )
                              IconButton(
                                  onPressed: () {
                                    messageTextController.clear();
                                    _firestore.collection('messages').add({
                                      'text':messageText,
                                      'sender':signedInUser.email,
                                      'time' :FieldValue.serverTimestamp(),
                                    });
                                  },
                                  icon: Icon(Icons.send))
                            ],
                          ),
                        ),
                      )],
                  ),
                ),

              ]),
        )
    );
  }
}
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context ,snapshot){
          List<MessageLine>messagewidgets=[];
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),);
            //add here a spinner
          }
          final messages =snapshot.data!.docs.reversed;
          for(var message in messages ){
            final messageText=message.get('text');
            final messageSender=message.get('sender');
            final messageTime=message.get('time');
            final currentUser =signedInUser.email;
            final messagewidget=MessageLine(sender:messageSender ,text:messageText ,isMe: currentUser==messageSender,time:messageTime ,);

            messagewidgets.add(messagewidget);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              children: messagewidgets,
            ),
          );

        });
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({this.text, this.sender,required this.isMe, this.time, Key? key}) : super(key: key);
  final String? sender;
  final String? text;
  final Timestamp? time;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender',style: TextStyle(fontSize: 12,color: Colors.yellow[900]),),
          Material(
            elevation: 5,
            borderRadius:isMe? BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)):
            BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: isMe ? Colors.brown:Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text ('$text ',
                style: TextStyle(fontSize: 15,
                    color: isMe?Colors.white:Colors.black87),),

            ),

          ),


        ],
      ),
    );
  }
}
