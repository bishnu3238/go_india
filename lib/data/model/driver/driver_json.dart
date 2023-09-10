import 'package:go_india/data/model/driver/driver_details_json.dart';
import 'package:go_india/package/package/package.dart';

import '../../../domain/entity/entity.dart';
import '../../../utility/utility/utility.dart';

class DriverJson {
  String id,
      uid,
      name,
      mobile,
      email,
      image,
      gender,
      status,
      activeStatus,
      referralCode,
      joiningBonusApproved,
      authStatus;

  String? rating, date, time;

  DriverJson({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.image,
    required this.gender,
    required this.status,
    required this.authStatus,
    required this.referralCode,
    required this.activeStatus,
    required this.joiningBonusApproved,
    this.rating,
    this.date,
    this.time,
    this.uid = '',
  });

  DriverJson copyWith({
    String? id,
    String? uid,
    String? name,
    String? mobile,
    String? email,
    String? image,
    String? gender,
    String? status,
    String? authStatus,
    String? referralCode,
    String? rating,
    String? activeStatus,
    DriverDetailsJson? driverDetailsJson,
    String? joiningBonusApproved,
    String? date,
    String? time,
  }) {
    return DriverJson(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      authStatus: authStatus ?? this.authStatus,
      activeStatus: activeStatus ?? this.activeStatus,
      joiningBonusApproved: joiningBonusApproved ?? this.joiningBonusApproved,
      time: time ?? this.time,
      date: date ?? this.date,
      rating: rating ?? this.rating,
      referralCode: referralCode ?? this.referralCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'status': status,
      'profile_photo': image,
      'authStatus': authStatus,
      'refer_code': referralCode,
      'active_status': activeStatus,
      'joining_bonus_approved': joiningBonusApproved,
    };
  }

  factory DriverJson.fromMap(Map<String, dynamic> json) {
    return DriverJson(
      id: (json['id'] as Object).str,
      uid: (json['uid'] as Object?).str,
      name: json['name'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      status: (json['status'] as Object).str,
      rating: json['rating'] as String? ?? '',
      gender: json['gender'] as String? ?? Gender.unknown.name,
      authStatus: json['authStatus'] as String? ??
          (json['status'].toString() == '1' || json['status'].toString() == '2'
              ? AuthStatus.authenticated.name
              : AuthStatus.unauthenticated.name),
      image: json['profile_photo'] as String? ?? '',
      referralCode: json['refer_code'] as String? ?? '',
      activeStatus: json['active_status '] as String? ?? '',
      joiningBonusApproved: (json['joining_bonus_approved'] as Object?).str,
    );
  }

  Driver toDomain() {
    // if (id == '0') return Driver.empty;
    return Driver(
      id: id,
      name: name,
      mobile: mobile,
      email: email,
      image: '$driverImgFld/$image',
      rating: rating,
      authStatus: authStatus.stringToAuthStatus ?? AuthStatus.unauthenticated,
      referralCode: referralCode,
      activeStatus: activeStatus,
      gender: gender.stringToGender,
      status: int.tryParse(status) ?? 0,
      joiningBonusApproved: joiningBonusApproved,
      date: DateTime.tryParse(date!) ?? DateTime.now(),
      time: DateTime.tryParse(time!) ?? DateTime.now(),
    );
  }
}
