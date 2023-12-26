import 'package:dartz/dartz.dart';
import 'package:financemanagement/core/errors/failure.dart';
import 'package:financemanagement/src/domain/entities/transaction_entity.dart';
import 'package:financemanagement/src/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<Either<Failure, UserEntity>> loginUser(String email, String password);
  Future<Either<Failure, UserEntity>> signupUser(String email, String password);
  Future<Either<Failure, String>> addTransaction(TransactionEntity tran);
}
