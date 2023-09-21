import 'package:flutter/material.dart';
import 'package:payment/fictive/data.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final item = transactions[index];

        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFC1D0E4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    item.date,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              ),
              Text(
                item.amount < 0
                    ? '-\$${item.amount.abs().toStringAsFixed(2)}'
                    : '\$${item.amount.abs().toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: item.amount < 0
                        ? Colors.red
                        : Colors.green),
              ),
            ],
          ),
        );
      },
    );
  }
}
