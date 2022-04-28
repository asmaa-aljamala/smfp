import 'package:flutter/material.dart';


class PepoleChat extends StatelessWidget {
   // PepoleChat({ required this.names,required this.image,required this.text,Key? key}) : super(key: key);
  List names = ['Raghdaa', 'Said', 'Ahmad', 'Sami','Raghdaa', 'Said'];
  List text = ['12345', '5452', '8954', '6363','12345', '5452', ];
  List image =['assets/images/user.png' ,'assets/images/user.png'
              , 'assets/images/user.png','assets/images/user.png'
               , 'assets/images/user.png', 'assets/images/user.png'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('الرسائل', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        // foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(image[index]),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(names[index]),
                    Text(text[index]),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}