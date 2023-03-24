import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
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
