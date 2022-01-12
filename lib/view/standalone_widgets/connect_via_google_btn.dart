import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:petproject0/constants/strings.dart';
import 'package:petproject0/view/standalone_widgets/onBoardingButton.dart';

class ConnectViaGoogleButton extends StatelessWidget {

  const ConnectViaGoogleButton({Key? key, required this.onPress}) : super(key: key);
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return onBoardingMainButton(
        buttonColor: Colors.red[100],
        onPress: onPress,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: size.width * 0.1,
              child: Image.asset(
                googleAuthIconRoute,
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Connect via Google",
              style: TextStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(colors: [
                      Colors.red,
                      Colors.deepOrange,
                      Colors.green,
                      Colors.blue
                    ]).createShader(Rect.fromLTWH(
                        size.width * 0.2, 0, size.width / 2, size.height))),
            ),
          )
        ]));
  }
}
