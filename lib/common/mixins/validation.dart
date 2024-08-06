import 'package:intl/intl.dart';

mixin FieldsValidation {
  String? validateEmail(String? email) {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
    if (email.isEmpty) {
      return 'Required*';
    } else if (!emailValid) {
      return 'Invalid email adress';
    } else {
      return null;
    }
  }

  String? dateValidation(String startDateString, DateTime endDate) {
    final startDate = DateTime(
        int.parse(startDateString.split('-')[2]),
        int.parse(startDateString.split('-')[1]),
        int.parse(startDateString.split('-')[0]));
    if (endDate.isAfter(startDate)) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(endDate);
      return formattedDate;
    } else {
      return 'To date should be greater than or equal to from date.';
    }
  }

  String? dateReminderValidation(String? startDateString, DateTime? endDate) {
    final startDate = DateTime(
        int.parse(startDateString!.split('-')[2]),
        int.parse(startDateString.split('-')[1]),
        int.parse(startDateString.split('-')[0]));
    if (endDate!.isAfter(startDate)) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(endDate);
      return formattedDate;
    } else {
      return 'End date should be greater than start date';
    }
  }

  String? validateOnlyIntNumber(String? value) {
    final pattern = r'^([0-9])+$';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Required*';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Input';
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    final pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Required*';
    } else if (!regex.hasMatch(value)) {
      return 'Password must contain atleast one number and one letter.';
    } else {
      return null;
    }
  }

  String? emptyFieldValidation(String? value) {
    final text = value!.trim();
    if (text.startsWith(' ')) {
      return 'Required*';
    } else if (text.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  String? matchPass(String value, String value2) {
    if (value.isEmpty) {
      return 'Required*';
    } else if (value != value2) {
      return '*password does not match';
    } else {
      return null;
    }
  }

  String? validateNumberAndAlphabetsOnly(String? value) {
    final pattern = r'^([0-9])*([A-Za-z])\w+$';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Required*';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Input';
    } else {
      return null;
    }
  }
}
