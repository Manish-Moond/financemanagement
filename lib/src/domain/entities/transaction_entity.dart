import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String note;
  final String date;
  final String time;
  final String price;
  final String type;

  const TransactionEntity(
      {required this.id,
      required this.note,
      required this.date,
      required this.time,
      required this.price,
      required this.type
      });

  @override
  List<Object?> get props => [id, note, date, time, price, type];
}
