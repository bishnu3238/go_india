import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

GetIt get = GetIt.instance;
SmartAuth smartAuth = SmartAuth();
ImagePicker picker = ImagePicker();
SmsAutoFill autoFill = SmsAutoFill();
Connectivity connectivity = Connectivity();
