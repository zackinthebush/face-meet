import 'package:email_validator/email_validator.dart';


validationEmail(String value) {
  if (value.isEmpty) {
    return 'Please enter email';
  } else if (!EmailValidator.validate(value)) {
    return 'Please enter valid email';
  }
  return null;}

validationPassword(String value, int min){
  if (value.isEmpty) {
    return 'Please enter password';
  }else if (value.length <= min) {
    return "password must have more than 8 characters";
  }
  return null;
}
validationName(String value){
  if (value.isEmpty) {
    return "Please enter name.";
  }
  return null;
}
validationSamePassword(String value , String password){
  if (value != password) {
    return 'Password is not matching';
  }
  return null;
}

