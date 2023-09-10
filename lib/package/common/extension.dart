import 'dart:developer' as dev show log;
import 'package:flutter/material.dart';
 import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import '../../routes/route_path.dart';
import '../../screens/driver_initial_details/export.dart';
import '../../utility/utility/utility.dart';

extension StringConvert on String {
  void log() => dev.log(this);
  String get phoneNumberHide {
    if (length == 10) {
      final maskedLength = length - 2;
      final maskedCharacters = 'x' * maskedLength;
      final maskedPhoneNo = replaceRange(1, maskedLength, maskedCharacters);
      return maskedPhoneNo;
    } else {
      trim();
      final hideLength = length - 4;
      final hideCharacters = 'x' * hideLength;
      final maskedPhoneNo = replaceRange(2, hideLength + 2, hideCharacters);
      final countryCode = substring(0, 2);
      return '+$countryCode $maskedPhoneNo';
    }
  }

  String get removeCountryCode {
    String digitsOnly = replaceAll(RegExp(r'\D'), '');

    if (length == 10) return this;

    if (digitsOnly.startsWith('91')) {
      return digitsOnly.substring(2);
    }

    return digitsOnly;
  }

  Gender get stringToGender {
    return Gender.values.firstWhere((element) => element.name == this,
        orElse: () => Gender.unknown);
  } Screen get stringToScreen {
    return Screen.values.firstWhere((element) => element.name == this,
        orElse: () => Screen.splash);
  }

  IdDoc get stringToIdDoc {
    switch (this) {
      case 'Driving License':
        return IdDoc.dl;
      case 'Aadhaar Card':
        return IdDoc.aadhaar;
      case 'Others':
        return IdDoc.others;
      default:
        return IdDoc.others;
    }
  }

  ThemeMode get themeMode {
    return ThemeMode.values.firstWhere((element) => element.name == this,
        orElse: () => ThemeMode.system);
  }

  AuthStatus? get stringToAuthStatus {
    return isEmpty
        ? null
        : AuthStatus.values.firstWhere((element) => element.name == this,
            orElse: () => AuthStatus.unauthenticated);
  }

  FormzSubmissionStatus? get stringToFormzStatus {
    return isEmpty
        ? null
        : FormzSubmissionStatus.values.firstWhere(
            (element) => element.name == this,
            orElse: () => FormzSubmissionStatus.initial);
  }

  ThemeMode get theme {
    return ThemeMode.values.firstWhere((element) => element.name == this,
        orElse: () => ThemeMode.system);
  }

  DriverVehicleDetailsStatus get toDriverVehicleDetailsStatus {
    return DriverVehicleDetailsStatus.values.firstWhere(
        (element) => element.name == this,
        orElse: () => DriverVehicleDetailsStatus.Uncomplete);
  }

  bool get toBool {
    switch (this) {
      case 'true':
        return true;
      case 'false':
        return false;
      default:
        return false;
    }
  }

  String get dmyStr =>
      DateFormat('dd-MM-yyyy').format(DateFormat('dd-MM-yyyy').parse(this));

  DriverVehicleDetailsStatus get stringToDriverVehicleDetailsStatus {
    switch (this) {
      case '0':
        return DriverVehicleDetailsStatus.Uncomplete;
      case '1':
        return DriverVehicleDetailsStatus.Half;
      case '2':
        return DriverVehicleDetailsStatus.Complete;
      default:
        return DriverVehicleDetailsStatus.Uncomplete;
    }
  }




}

extension Str on String? {}

extension ToString on Object {
  void log() => dev.log(toString());
  String get string => toString();
}

extension ToStringNullable on Object? {
  void log() => dev.log(toString());
  DateTime get stringToDate => this is String && this != null
      ? DateTime.parse(this as String)
      : DateTime.now();
  String get str => this is String
      ? this as String
      : this == null
          ? ''
          : toString();
}

extension DMY on DateTime {
  DateTime get dmy =>
      DateFormat('dd-MM-yyyy').parse(DateFormat('dd-MM-yyyy').format(this));

  String get dmyString => DateFormat('dd-MM-yyyy').format(this);
}

extension YesNoTo on YesNo {
  bool get asBool {
    switch (this) {
      case YesNo.yes:
        return true;
      case YesNo.no:
        return false;
    }
  }
}

extension YesNoIn on bool {
  YesNo get boolToYesNo => this ? YesNo.yes : YesNo.no;
}

extension Id on IdDoc {
  String get toName {
    switch (this) {
      case IdDoc.dl:
        return 'Driving License';
      case IdDoc.aadhaar:
        return 'Aadhaar Card';
      case IdDoc.others:
        return 'Others';
      default:
        return 'Others';
    }
  }
}
