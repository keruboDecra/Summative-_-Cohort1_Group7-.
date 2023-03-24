import 'package:flutter/material.dart';

class notificationsPage extends StatefulWidget {
  const notificationsPage({Key? key}) : super(key: key);

  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
  List<TransactionData> _transactionData = [
    TransactionData(
      bankCardName: 'Card 1',
      transactionAmount: 100.0,
      transactionDate: DateTime.now(),
    ),
    TransactionData(
      bankCardName: 'Card 2',
      transactionAmount: 200.0,
      transactionDate: DateTime.now(),
    ),
    TransactionData(
      bankCardName: 'You perfomed a transaction to David, 40789743 bank account of \$ ',
      transactionAmount: 300.0,
      transactionDate: DateTime.now(),
    ),
    TransactionData(
      bankCardName: 'You profile picture was changed at ',
      transactionAmount: 01.30,
      transactionDate: DateTime.now(),
    ),
    TransactionData(
      bankCardName: 'You perfomed a transaction to Mary, 407847788 bank account of \$ ',
      transactionAmount: 300.0,
      transactionDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _transactionData.length,
        itemBuilder: (context, index) {
          final transaction = _transactionData[index];
          return ListTile(
            title: Text(transaction.bankCardName),
            subtitle: Text(
                '${transaction.transactionAmount.toStringAsFixed(2)} - ${transaction.transactionDate.toString()}'),
          );
        },
      ),
    );
  }
}

class TransactionData {
  final String bankCardName;
  final double transactionAmount;
  final DateTime transactionDate;

  TransactionData({
    required this.bankCardName,
    required this.transactionAmount,
    required this.transactionDate,
  });


}
