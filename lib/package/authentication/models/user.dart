
import 'package:equatable/equatable.dart';
 import '../../../data/model/model.dart';
import '../../../domain/entity/entity.dart';
import '../../package/package.dart';
import '../../../utility/utility/utility.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String image;
  final String phone;
  final String email;
  final Driver driver;
  final Gender gender;
  final AuthStatus status;
  final DateTime? date;

  const User({
    required this.uid,
    this.name = '',
    this.image = '',
    this.phone = '',
    this.email = '',
    this.driver = Driver.empty,
    this.gender = Gender.unknown,
    this.status = AuthStatus.unknown,
    this.date,
  });

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'name': name,
        'image': image,
        'phone': phone,
        'email': email,
        'gender': gender.name,
        'driver': driver.toMap(),
        'date': date.toString()
      };

  factory User.formJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String? ?? '1',
      name: json['name'] as String? ?? 'User name',
      image: json['image'] as String? ?? placeHolder,
      phone: json['phone'] as String? ?? '+xx xxxxxxxxxx',
      email: json['email'] as String? ?? 'example@gmail.com',
      gender: (json['gender'] as String? ?? Gender.unknown.name).stringToGender,
      driver: DriverJson.fromMap(json['driver']).toDomain(),
      date: json['date'] is DateTime
          ? json['date'] as DateTime? ?? DateTime.now()
          : DateTime.tryParse(json['date']) ?? DateTime.now(),
    );
  }

  User copyWith({
    String? uid,
    String? name,
    String? image,
    String? phone,
    String? email,
    Driver? driver,
    Gender? gender,
    AuthStatus? status,
    DateTime? date,
  }) =>
      User(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        image: image ?? this.image,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        driver: driver?? this.driver,
        status: status ?? this.status,

        date: date ?? this.date,
      );

  static const empty = User(uid: '', status: AuthStatus.unauthenticated);

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  String toString() {
    return 'User{id: $uid, name: $name, image: $image, phone: $phone, email: $email, gender: $gender, status: $status, date: $date}';
  }

  @override
  List<Object?> get props => [uid, name, phone, email, image, date];
}
