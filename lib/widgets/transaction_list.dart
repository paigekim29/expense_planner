import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList());
  }
}

// ListView(children: [])
// column with SingleChildScrollView around so it's able to have more items
// than we have space on the screen bc it has infinite height and width
// passing a children argument to its constructor and then you have a list of 
// child widgets

// ListView.builder()
// no wrapping SingleChildScrollView
// only renders the widgets that are visible

// Unlike UniqueKey(), ValueKey() does not (re-)calculate a random value 
// but simply wraps a non-changing identifier provided by you
// Only needs for stateful widget that manages its own data internally
// and that data can change