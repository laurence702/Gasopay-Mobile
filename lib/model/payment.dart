// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  final String id;
  final double amount;
  final String date;
  final String status;

  const Payment({
    required this.id,
    required this.amount,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'date': date,
      'status': status,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'] as String,
      amount: map['amount'] as double,
      date: map['date'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);
}
