import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanagement/src/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  @override
  final String id;
  @override
  final String note;
  @override
  final String date;
  @override
  final String time;
  @override
  final String price;
  @override
  final String type;

  const TransactionModel({
    required this.id,
    required this.note,
    required this.date,
    required this.time,
    required this.price,
    required this.type,
  }) : super(
            id: id,
            note: note,
            date: date,
            time: time,
            price: price,
            type: type);

  factory TransactionModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return TransactionModel(
        id: snapshot['id'],
        note: snapshot['note'],
        date: snapshot['date'],
        time: snapshot['time'],
        price: snapshot['price'],
        type: snapshot['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'date': date,
      'time': time,
      'price': price,
      'type': type
    };
  }
}
