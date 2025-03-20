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

1.Displays a list of accounts (Chequing and Savings) with account numbers and balances.
2.Each account has a button that navigates to the Transactions Screen to view recent transactions.

## Transactions Screen:

1.Displays a list of transactions for the selected account (Chequing or Savings).
2.Transactions show the date, description, and amount.
3.Includes a back button to return to the previous screen.

## JSON Data:
1.Account Data: Contains the type, account number, and balance for each account.
2.Transaction Data: Contains a list of transactions categorized by account type (Chequing or Savings). Each transaction has a date, description, and amount.

## Code Summary:
1.DateFormat: Used to format the current date for the Welcome Screen.
2.JSON Parsing: Used to parse account and transaction data.
3.Navigation: Uses Navigator.push to transition between screens and Navigator.pop to go back.
pubspec.yaml:
The app uses intl for date formatting and other dependencies like cupertino_icons and flutter_test.
