import 'package:flutter/material.dart';
import '../home_screen.dart'; // Ensure correct path

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  List<Transaction> transactions = [
    Transaction('Television & LED Service', -1500, DateTime.now().subtract(Duration(days: 1)), 'Service'),
    Transaction('Air Conditioner Cleaning', -2500, DateTime.now().subtract(Duration(days: 2)), 'Service'),
    Transaction('CCTV Service Installation', -5000, DateTime.now().subtract(Duration(days: 3)), 'Service'),
    Transaction('Deposit from ABC', 3000, DateTime.now().subtract(Duration(days: 4)), 'Deposit'),
  ];

  Color _getTransactionColor(String category) {
    switch (category) {
      case 'Service':
        return Colors.orange;
      case 'Deposit':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Transaction History"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Account Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account Holder: Salim Rahaman Dipu", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Account Number: 1234-5678-9101", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Account Type: Savings", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text("Branch: Dhaka RayerBag", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.where((transaction) => transaction.category != 'Deposit').length,
                itemBuilder: (context, index) {
                  var filteredTransactions = transactions.where((transaction) => transaction.category != 'Deposit').toList();
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      leading: Icon(Icons.attach_money, color: _getTransactionColor(filteredTransactions[index].category)),
                      title: Text(filteredTransactions[index].description),
                      subtitle: Text("Date: ${filteredTransactions[index].date.toLocal()}"),
                      trailing: Text(
                        '${filteredTransactions[index].amount > 0 ? "+" : "-"} BDT ${filteredTransactions[index].amount.abs()}',
                        style: TextStyle(
                          color: filteredTransactions[index].amount < 0 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String description;
  final double amount;
  final DateTime date;
  final String category;

  Transaction(this.description, this.amount, this.date, this.category);
}