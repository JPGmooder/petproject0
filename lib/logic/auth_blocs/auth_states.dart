abstract class CheckEmailStates {}

class UniqueEmailState extends CheckEmailStates {
  final bool isUnique;
  UniqueEmailState(this.isUnique);
}

class IntialEmailState extends CheckEmailStates {

}

class ErrorEmailState extends CheckEmailStates {
  final Error error;
  ErrorEmailState(this.error);
}
