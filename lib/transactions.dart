import 'package:flutter/material.dart';
import 'card.dart';
import 'transactionhistory.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  BankCard? _selectedBankCard;
  double? _transactionAmount;

  void _sendMoney() {
    if (_selectedBankCard == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a bank card.')),
      );
      return;
    }

    if (_transactionAmount == null || _transactionAmount! <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid transaction amount.')),
      );
      return;
    }

    // TODO: Send money using the selected bank card and transaction amount.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Money sent successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bankCards = BankCardList().bankCards;

    if (bankCards.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Send Money'),
        ),
        body: const Center(
          child: Text('No bank cards available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionHistoryPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<BankCard>(
              value: _selectedBankCard,
              items: BankCardList().bankCards.map((bankCard) {
                return DropdownMenuItem<BankCard>(
                  value: bankCard,
                  child: Text(bankCard.bankName),
                  key: ValueKey<String>(bankCard.bankName),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Bank Card',
              ),
              onChanged: (value) {
                setState(() {
                  _selectedBankCard = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Transaction Amount',
              ),
              onChanged: (value) {
                setState(() {
                  _transactionAmount = double.tryParse(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendMoney,
              child: const Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }
}
