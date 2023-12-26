import 'package:dartz/dartz.dart';
import 'package:financemanagement/core/errors/failure.dart';
import 'package:financemanagement/src/data/datasource/firebase_data_source.dart';
import 'package:financemanagement/src/data/models/user_model.dart';
import 'package:financemanagement/src/domain/entities/transaction_entity.dart';
import 'package:financemanagement/src/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseDataSource firebaseDataSource;

  FirebaseRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<Either<Failure, UserModel>> loginUser(
          String email, String password) async =>
      await firebaseDataSource.login(email: email, password: password);

  @override
  Future<Either<Failure, UserModel>> signupUser(
          String email, String password) async =>
      await firebaseDataSource.signup(email: email, password: password);

  @override
  Future<Either<Failure, String>> addTransaction(TransactionEntity tran) async {
    return await firebaseDataSource.addTransaction(tran);
  }
}
