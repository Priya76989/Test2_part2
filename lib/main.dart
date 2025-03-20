import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Banking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        backgroundColor: Colors.teal,  // Changed AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.tealAccent],  // Added background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_balance, size: 120, color: Colors.white), // Increased icon size
              SizedBox(height: 20),
              Text(
                'Welcome to Mobile Banking!',
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold), // Increased font size, bold, white color
              ),
              SizedBox(height: 10),
              Text("Today's Date: $today", style: TextStyle(fontSize: 18, color: Colors.white70)), // Lighter text color
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Added padding to button
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Rounded corners
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountListScreen()),
                  );
                },
                child: Text('View Accounts', style: TextStyle(fontSize: 18)), // Font size of the button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountListScreen extends StatelessWidget {
  final String accountData = '''
  {
    "accounts": [
      {"type": "Chequing", "account_number": "CHQ123456789", "balance": 2500.00},
      {"type": "Savings", "account_number": "SAV987654321", "balance": 5000.00}
    ]
  }
  '''; // Account data

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = json.decode(accountData);
    List accounts = data['accounts'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
        backgroundColor: Colors.teal, // Changed AppBar color
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          var account = accounts[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5, // Added shadow to the card
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text('${account['type']} Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Account No: ${account['account_number']}\nBalance: \$${account['balance']}', style: TextStyle(fontSize: 16)),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionsScreen(accountType: account['type']),
                    ),
                  );
                },
                child: Text('View Transactions', style: TextStyle(fontSize: 16)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TransactionsScreen extends StatelessWidget {
  final String accountType;
  TransactionsScreen({required this.accountType});

  final String transactionData = '''
  {
    "transactions": {
      "Chequing": [
        {"date": "2024-04-14", "description": "Utility Bill Payment", "amount": -120.00},
        {"date": "2024-04-16", "description": "ATM Withdrawal", "amount": -75.00},
        {"date": "2024-04-17", "description": "Deposit", "amount": 100.00},
        {"date": "2024-04-18", "description": "Withdrawal", "amount": -50.00}
      ],
      "Savings": [
        {"date": "2024-04-12", "description": "Withdrawal", "amount": -300.00},
        {"date": "2024-04-15", "description": "Interest", "amount": 10.00},
        {"date": "2024-04-16", "description": "Deposit", "amount": 200.00},
        {"date": "2024-04-18", "description": "Transfer to Chequing", "amount": -500.00}
      ]
    }
  }
  '''; // Transaction data

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = json.decode(transactionData);
    List transactions = data['transactions'][accountType] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$accountType Transactions'),
        backgroundColor: Colors.teal, // AppBar color
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          var transaction = transactions[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text(transaction['description'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Date: ${transaction['date']}\nAmount: \$${transaction['amount']}', style: TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
