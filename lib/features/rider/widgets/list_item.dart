import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {
  final String amount;
  final String date;
  final String status;
  const PaymentListItem({
    required this.amount,
    required this.date,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: Text(
            '₦$amount',
            style: const TextStyle(
              fontSize: 8 * 2.25,
              fontWeight: FontWeight.w600,
            ),
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: (status.toLowerCase() == 'paid')
                      ? Colors.green.withOpacity(.2)
                      : Colors.red.withOpacity(.2),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: (status.toLowerCase() == 'paid')
                          ? Colors.green
                          : Colors.red,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
