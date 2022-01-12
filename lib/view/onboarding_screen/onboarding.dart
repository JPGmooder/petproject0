import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petproject0/constants/colors.dart';
import 'package:petproject0/constants/strings.dart';
import 'package:petproject0/constants/styles.dart';
import 'package:petproject0/view/standalone_widgets/onBoardingButton.dart';
import 'package:petproject0/view/onboarding_screen/switcher.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => constraints.maxWidth > 400
              ? Container()
              : Stack(children: [
                  Image.asset(onBoardBackground),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SwitcherWidget(
                        itemsList: onBoardingSwitcherList
                            .map((e) => Image.asset(e))
                            .toList(),
                        dotWidth: 10,
                        sizeBetween: constraints.maxHeight * 0.08,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.13),
                        child: Column(
                          children: [
                            Text(onBoardingWelcomeMessage, style: title1),
                            SizedBox(
                              height: constraints.maxHeight * 0.03,
                            ),
                            Text(
                              onBoardingWelcomeMessageSub,
                              style: subtitle1,
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.85,
                        height: 50,
                        child: onBoardingMainButton(
                          onPress: () => Navigator.of(context)
                              .pushReplacementNamed(authorizationScreenRoute),
                          child: Stack(
                            children: const [
                              Center(
                                child: Text(onBoardingWelcomeStart),
                              ),
                              Align(
                                child: Icon(Icons.arrow_right_alt),
                                alignment: Alignment.centerRight,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
        ),
      ),
    );
  }
}
