import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  LogoText({super.key, this.fontSize = 20});

  double? fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: "Writopia ",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              )),
          TextSpan(
              text: "Expert writers",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize!,
              ))
        ],
      ),
    );
  }
}
