import 'package:email_validator/email_validator.dart';

class Validate {
  //Email validation
  static validateEmail(value) {
    if (value != null && !EmailValidator.validate(value)) {
      return "Enter a valid email";
    }
  }

  //Password Validation
  static validatePassword(value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }
  }

  //Name validation
  static validateName(value) {
    if (value.isEmpty) {
      return "This field cannot be empty";
    }
  }

  //Phone Number Validation
  static validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return "Please Enter a Phone Number";
    } else if (!RegExp(
            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
        .hasMatch(value)) {
      return "Please Enter a Valid Phone Number";
    }
  }
}
