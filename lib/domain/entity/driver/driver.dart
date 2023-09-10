import 'package:equatable/equatable.dart';
import 'package:go_india/domain/entity/driver/driver_details.dart';

import '../../../utility/utility/utility.dart';

class Driver extends Equatable {
  final String id, uid, name, mobile, image, activeStatus, joiningBonusApproved;
  final String? email, referralCode, rating;
  final Gender gender;
  final AuthStatus authStatus;
  final int status;
  final DriverDetails driverDetails;
  final DateTime? date, time;

  static const Driver empty = Driver(
    id: '0',
    name: 'Your Name',
    mobile: '+xx xxxxxxxxxx',
    authStatus: AuthStatus.unknown,
    status: 0,
  );

  const Driver({
    required this.id,
    required this.name,
    required this.mobile,
    this.uid = '',
    this.email,
    this.activeStatus = '0',
    this.gender = Gender.unknown,
    this.joiningBonusApproved = '0',
    this.image = profilePictureImage,
    this.authStatus = AuthStatus.unknown,
    this.driverDetails = DriverDetails.empty,
    this.referralCode,
    this.status = 0,
    this.rating,
    this.date,
    this.time,
  });


  @override
  String toString() {
    return 'Driver{id: $id, uid: $uid, name: $name, mobile: $mobile, image: $image, activeStatus: $activeStatus, joiningBonusApproved: $joiningBonusApproved, email: $email, referralCode: $referralCode, rating: $rating, gender: $gender, authStatus: $authStatus, status: $status, driverDetails: $driverDetails, date: $date, time: $time}';
  }

  Driver copyWith({
    String? id,
    String? uid,
    String? name,
    String? mobile,
    String? email,
    String? image,
    String? rating,
    String? activeStatus,
    String? joiningBonusApproved,
    DriverDetails? driverDetails,
    AuthStatus? authStatus,
    String? referralCode,
    Gender? gender,
    int? status,
    DateTime? date,
    DateTime? time,
  }) {
    return Driver(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      driverDetails: driverDetails ?? this.driverDetails,
      authStatus: authStatus ?? this.authStatus,
      activeStatus: activeStatus ?? this.activeStatus,
      referralCode: referralCode ?? this.referralCode,
      joiningBonusApproved: joiningBonusApproved ?? this.joiningBonusApproved,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  bool get isEmpty => this == Driver.empty || id == '0';
  bool get isNotEmpty => this != Driver.empty;

  @override
  List<Object?> get props => [
        id,
        uid,
        name,
        mobile,
        email,
        image,
        rating,
        gender,
        activeStatus,
        referralCode,
        joiningBonusApproved,
        authStatus,
        status,
        date,
        time,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'uid': uid.toString(),
      'name': name.toString(),
      'mobile': mobile.toString(),
      'email': email.toString(),
      'profile_photo': image.toString(),
      'gender': gender.name,
      'refer_code': referralCode.toString(),
      'driverDetails': driverDetails.toMap(),
      'status': status.toString(),
      'authStatus': authStatus.name,
      'rating': rating.toString(),
      'joining_bonus_approved': joiningBonusApproved.toString(),
      'active_status': activeStatus.toString(),
      'date': date.toString(),
      'time': time.toString(),
    };
  }

  // factory Driver.fromMap(Map<String, dynamic> map) {
  //   return Driver(
  //     id: map['id'] as String? ?? "0",
  //     uid: map['uid'] as String? ?? "",
  //     name: map['name'] as String? ?? "",
  //     mobile: map['mobile'] as String? ?? "",
  //     image: map['image'] as String? ?? "",
  //     activeStatus: map['activeStatus'] as String? ?? "",
  //     joiningBonusApproved: map['joiningBonusApproved'] as String? ?? "",
  //     email: map['email'] as String? ?? "",
  //     referralCode: map['refer_code'] as String? ?? "",
  //     rating: map['rating'] as String? ?? "",
  //     gender: map['gender'] == ''
  //         ? Gender.unknown
  //         : (map['gender'] as String).stringToGender,
  //     authStatus: (map['authStatus'] as String).stringToAuthStatus ??
  //         AuthStatus.unknown,
  //     status: int.tryParse(map['status']) ?? 0,
  //     driverDetails: DriverDetails.fromMap(map['driverDetails']),
  //     date: DateTime.tryParse(map['date']) ?? DateTime.now(),
  //     time: DateTime.tryParse(map['time']) ?? DateTime.now(),
  //   );
  // }
}
