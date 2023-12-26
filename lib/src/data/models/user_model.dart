import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanagement/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String uuid;
  @override
  final String email;
  @override
  final String? username;
  @override
  final String? profileUrl;

  const UserModel({
    required this.uuid,
    required this.email,
    this.username,
    this.profileUrl,
  }) : super(uuid: uuid, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uuid: json['id'],
        email: json['email'],
        username: json['username'] ?? "",
        profileUrl: json['profileUrl'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uuid,
      'email': email,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      uuid: snapshot['uid'],
      email: snapshot['email'],
      username: snapshot['username'],
      profileUrl: snapshot['profileUrl'],
    );
  }
}
