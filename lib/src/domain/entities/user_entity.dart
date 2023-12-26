// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uuid;
  final String email;
  final String? username;
  final String? profileUrl;

  const UserEntity({
    required this.uuid,
    required this.email,
    this.username,
    this.profileUrl,
  });
  @override
  List<Object?> get props => [uuid, username, email, profileUrl];
}
