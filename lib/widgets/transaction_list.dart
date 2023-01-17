import '../models/transaction.dart';
import '../widgets/transaction_item.dart';
import 'package:flutter/material.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions Added Yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/image/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView(
          children: 
            transactions.map((tx){
              return TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx,
                 deleteTx: deleteTx);
            } ).toList()
          ,
          );
  }
}
