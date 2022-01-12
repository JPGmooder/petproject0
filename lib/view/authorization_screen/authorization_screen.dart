import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petproject0/constants/strings.dart';
import 'package:petproject0/constants/styles.dart';
import 'package:petproject0/logic/auth_blocs/auth_blocs.dart';
import 'package:petproject0/logic/auth_blocs/auth_events.dart';
import 'package:petproject0/view/standalone_widgets/connect_via_google_btn.dart';
import 'package:petproject0/view/standalone_widgets/location_picker.dart';
import 'package:petproject0/view/standalone_widgets/onBoardingButton.dart';
import 'package:rxdart/rxdart.dart';

class AuthorizationScreen extends StatefulWidget {
  AuthorizationScreen({Key? key}) : super(key: key);
  bool isSignUp = false;
  var formKey = GlobalKey<FormState>();
  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController controller;
  late Animation<double> _animation;
  late Animation<double> _animationcontroller;
  late StreamController<String> textString = StreamController<String>();

  @override
  void initState() {
    _animationcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationcontroller);
    textString.stream
        .distinct()
        .debounceTime(Duration(seconds: 2))
        .listen((event) {
      print(event);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (ctx, constraints) => SingleChildScrollView(
        child: Stack(children: [
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: widget.key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocationPicker(),
                    SizedBox(
                      height: constraints.maxWidth * 0.15,
                    ),
                    Text(
                      authorizationSignInTitle,
                      style: title1,
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.03,
                    ),
                    Text(
                      authorizationSignInSubTitle,
                      style: subtitle1,
                    ),
                    SizedBox(
                      height: constraints.maxWidth * 0.15,
                    ),
                    TextFormField(
                      onChanged: (txt) {
                        print("aboba: " + txt);
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(widget.isSignUp
                              ? Icons.email
                              : Icons.person_outline),
                          label: Text(
                            widget.isSignUp
                                ? authorizationEmail
                                : authorizationUsernameOrEmail,
                            style: subtitle1,
                          )),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.04,
                    ),
                    if (widget.isSignUp)
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            label: Text(
                              authorizationUsername,
                              style: subtitle1,
                            )),
                      ),
                    if (widget.isSignUp)
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                    PasswordField(),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       prefixIcon: Icon(Icons.person_outline),
                    //       label: Text(
                    //         authorizationUsernameOrEmail,
                    //         style: subtitle1,
                    //       )),
                    SizedBox(
                      height: widget.isSignUp
                          ? constraints.maxHeight * 0.1
                          : constraints.maxHeight * 0.2,
                    ),
                    Center(
                      child: onBoardingMainButton(
                          onPress: () => null,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    widget.isSignUp
                                        ? authorizationSignUpButton
                                        : authorizationSignInButton,
                                    style: body1,
                                  ),
                                ),
                                const Align(
                                  child: Icon(Icons.subdirectory_arrow_right),
                                  alignment: Alignment.centerRight,
                                )
                              ],
                            ),
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.isSignUp
                                ? authorizationAlreadyHaveAccount
                                : authorizationDontHaveAccount,
                            style: subtitle1,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              widget.isSignUp = !widget.isSignUp;
                            }), //todo : тут меняем на сингап
                            child: Text(widget.isSignUp ? "Sign in" : "Sign up",
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    ConnectViaGoogleButton(
                      onPress: () => BlocProvider.of<CheckingEmailBloc>(context)
                          .add(CheckEmailEvent("jpgmooder@gmail.com")),
                    ),
                  ]),
            ),
          ))
        ]),
      ),
    ));
  }
}

class PasswordField extends StatefulWidget {
  PasswordField({Key? key}) : super(key: key);
  bool isUnVisiblePassword = true;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isUnVisiblePassword,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              widget.isUnVisiblePassword = !widget.isUnVisiblePassword;
            }),
            child: Icon(widget.isUnVisiblePassword
                ? Icons.remove_red_eye_outlined
                : Icons.remove_red_eye),
          ),
          prefixIcon: Icon(Icons.lock_outlined),
          label: Text(
            authorizationPassword,
            style: subtitle1,
          )),
    );
  }
}
