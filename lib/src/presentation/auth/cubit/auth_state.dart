// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String error;
  final UserEntity? user;
  // final User? googleUser;

  const AuthState({
    required this.isLoading,
    required this.isSuccess,
    required this.error,
    this.user,
    // this.googleUser,
  });

  AuthState copyWith(
      {bool? isLoading,
      bool? isSuccess,
      String? error,
      UserEntity? user,
      // User? googleUser
      }) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        error: error ?? this.error,
        user: user ?? this.user,
        // googleUser: googleUser ?? this.googleUser
        );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, error, user, 
  // googleUser
  ];
}
