abstract class PhoneOtpStates {}

class PhoneOtpInitialStates extends PhoneOtpStates {}

class ChangePinCodeTextState extends PhoneOtpStates {}

class PhoneOtpGetCodeLoadingStates extends PhoneOtpStates {}

class PhoneOtpGetCodeSuccessStates extends PhoneOtpStates {}

class PhoneOtpGetCodeErrorStates extends PhoneOtpStates {
  String error;
  PhoneOtpGetCodeErrorStates(this.error);
}
