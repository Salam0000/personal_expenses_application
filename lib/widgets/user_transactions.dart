// import 'package:flutter/material.dart';
// import 'package:personal_expenses/widgets/new_transaction.dart';
// import 'package:personal_expenses/widgets/transaction_list.dart';
// import 'package:personal_expenses/models/transaction.dart';

// class UserTransaction extends StatefulWidget {
//   const UserTransaction({Key? key}) : super(key: key);

//   @override
//   State<UserTransaction> createState() => _UserTransactionState();
// }

// class _UserTransactionState extends State<UserTransaction> {
//   void _addNewTransaction(String title, double amount) {
//     final newTX = Tranaction(
//         id: DateTime.now().toString(),
//         title: title,
//         amount: amount,
//         date: DateTime.now());

//     @override
//     Widget build(BuildContext context) {
//       return Column(
//         children: [
//           NewTransaction(_addNewTransaction),
//         ],
//       );
//     }
//   }
// }
