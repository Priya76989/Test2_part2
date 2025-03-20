# test_part2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:
  

  This Flutter app simulates a mobile banking interface with three screens: Welcome Screen, Account List Screen, and Transactions Screen.

Features:
## Welcome Screen:

1.Displays the current date and a "Welcome to Mobile Banking!" message.
2.Includes a button that navigates to the Account List Screen.

## Account List Screen:

Displays a list of accounts (Chequing and Savings) with account numbers and balances.
Each account has a button that navigates to the Transactions Screen to view recent transactions.

## Transactions Screen:

Displays a list of transactions for the selected account (Chequing or Savings).
Transactions show the date, description, and amount.
Includes a back button to return to the previous screen.

## JSON Data:
Account Data: Contains the type, account number, and balance for each account.
Transaction Data: Contains a list of transactions categorized by account type (Chequing or Savings). Each transaction has a date, description, and amount.

## Code Summary:
DateFormat: Used to format the current date for the Welcome Screen.
JSON Parsing: Used to parse account and transaction data.
Navigation: Uses Navigator.push to transition between screens and Navigator.pop to go back.
pubspec.yaml:
The app uses intl for date formatting and other dependencies like cupertino_icons and flutter_test.
