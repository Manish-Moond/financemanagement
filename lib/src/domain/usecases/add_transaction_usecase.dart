import 'package:dartz/dartz.dart';
import 'package:financemanagement/core/errors/failure.dart';
import 'package:financemanagement/src/domain/entities/transaction_entity.dart';
import 'package:financemanagement/src/domain/repository/firebase_repository.dart';

class AddTransactionUseCase {
  final FirebaseRepository firebaseRepository;

  AddTransactionUseCase({required this.firebaseRepository});

  Future<Either<Failure, String>> call(
      TransactionEntity transaction) {
    return firebaseRepository.addTransaction(transaction);
  }
}
