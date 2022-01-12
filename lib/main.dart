import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petproject0/constants/strings.dart';
import 'package:petproject0/logic/auth_blocs/auth_blocs.dart';
import 'package:petproject0/view/authorization_screen/authorization_screen.dart';
import 'package:petproject0/view/onboarding_screen/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Stream.fromFuture(() async => null).

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      title: 'Material App',
      home: OnBoardingScreen(),
      routes: {
        authorizationScreenRoute: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<CheckingEmailBloc>(
                  create: (context) => CheckingEmailBloc(),
                )
              ],
              child: AuthorizationScreen(),
            )
      },
    );
  }
}
