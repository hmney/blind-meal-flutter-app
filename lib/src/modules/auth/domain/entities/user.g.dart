// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    country: json['country'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    accountCreationTime: User._timeFromJson(json['accountCreationTime']),
    birthdate: User._timeFromJson(json['birthdate']),
    profilePicture: json['profilePicture'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'id': instance.id,
      'phone': instance.phone,
      'email': instance.email,
      'country': instance.country,
      'profilePicture': instance.profilePicture,
      'accountCreationTime': User._timeToJson(instance.accountCreationTime),
      'birthdate': User._timeToJson(instance.birthdate),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _User, Store {
  Computed<String> _$usernameComputed;

  @override
  String get username => (_$usernameComputed ??=
          Computed<String>(() => super.username, name: '_User.username'))
      .value;

  final _$firstNameAtom = Atom(name: '_User.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_User.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
username: ${username}
    ''';
  }
}
