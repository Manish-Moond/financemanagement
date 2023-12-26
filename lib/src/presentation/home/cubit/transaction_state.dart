part of 'transaction_cubit.dart';

class TransactionState extends Equatable {
  final List<TransactionEntity> transactionList;
  const TransactionState({
    required this.transactionList,
  });
  TransactionState copyWith({List<TransactionEntity>? transactionList}) {
    return TransactionState(
        transactionList: transactionList ?? this.transactionList);
  }

  TransactionState addTransaction(TransactionEntity newTransaction) {
    List<TransactionEntity> updatedList = List.from(transactionList);
    updatedList.add(newTransaction);

    return TransactionState(
      transactionList: updatedList,
    );
  }

  @override
  List<Object> get props => [transactionList];
}
