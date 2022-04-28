import 'package:flutter/material.dart';
import 'package:smfp/utiles/theme.dart';
import 'package:smfp/view/widgets/custom_button.dart';
import 'package:smfp/view/widgets/scroll_text.dart';
import 'package:smfp/view/widgets/text_utils.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      width: double.infinity,
                      height: 60,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      text: "تقرير عن سلوك الطالب",
                      color: Colors.black,
                      underLine: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const ScrollText(
                      text: 'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث'
                              'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث' +
                          'حيث ال حياة بدوف عمؿ وحيث أف الفرد يقضي ثمث حياتو في العمؿ والثمثيف اآلخريف مرتبطاف بالثمث',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
