import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends _User with _$User {
  String id, phone, email, country, profilePicture;

  @JsonKey(defaultValue: false)
  bool isSurveyFilled;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime accountCreationTime;

  @JsonKey(fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime birthdate;

  User({
    this.id,
    String firstName,
    String lastName,
    this.isSurveyFilled = false,
    this.country,
    this.phone,
    this.email,
    this.accountCreationTime,
    this.birthdate,
    this.profilePicture,
  }) : super(
          firstName: firstName,
          lastName: lastName,
        );

  factory User.createNewUser({
    String id,
    String firstName,
    String lastName,
    String profilePicture,
    String phone,
    String email,
    String country,
    DateTime birthdate,
  }) {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      profilePicture: '',
      accountCreationTime: DateTime.now().toUtc(),
      country: country,
      birthdate: birthdate,
      isSurveyFilled: false,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static DateTime _timeFromJson(ts) =>
      ts is DateTime ? ts : (ts as Timestamp)?.toDate();
  static DateTime _timeToJson(DateTime time) => time;

  String toString() {
    return '''
    id: ${this.id},
    firstName: ${this.firstName},
    lastName: ${this.lastName},
    username: ${this.username},
    phone: ${this.phone},
    email: ${this.email},
    country: ${this.country}, 
    profilePicture: ${this.profilePicture},
    isSurveyFilled: ${this.isSurveyFilled}
    ''';
  }
}

abstract class _User with Store {
  @observable
  String firstName;

  @observable
  String lastName;

  @computed
  String get username => '$firstName $lastName';

  _User({this.firstName, this.lastName});
}
