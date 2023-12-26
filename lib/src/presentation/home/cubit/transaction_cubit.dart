import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:financemanagement/src/domain/entities/transaction_entity.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  var uuid = const Uuid();
  TransactionCubit() : super(const TransactionState(transactionList: []));

  Future<void> add(
      {required String note,
      required String date,
      required String time,
      required String price,
      required String type}) async {
    var newTransaction = TransactionEntity(
        id: uuid.v4(),
        note: note,
        date: date,
        time: time,
        price: price,
        type: type);
    print(state.transactionList);
    emit(state.addTransaction(newTransaction));
  }
}
