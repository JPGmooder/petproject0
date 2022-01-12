import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:petproject0/logic/auth_blocs/auth_events.dart';
import 'package:petproject0/logic/auth_blocs/auth_states.dart';
import 'package:petproject0/logic/auth_blocs/checking_email_repo_provider.dart';

class CheckingEmailBloc extends Bloc<CheckEmailEvent, CheckEmailStates> {
  CheckingEmailBloc() : super(IntialEmailState()) {
    on<CheckEmailEvent>((event, emit) {
      CheckEmailProvider.checkContaints(event.email);
      // TODO: implement event handler
    });
  }
}
