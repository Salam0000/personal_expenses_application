import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;

  NewTransaction(this.addTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String titleInput;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTX(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presenDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              // onChanged: (value) => titleInput = value,
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              // onChanged: (value) => amountInput = value,
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen'
                          : 'Picked Date ${DateFormat.yMd().format(_selectedDate as DateTime)}',
                    ),
                  ),
                  TextButton(
                    // textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      _presenDatePicker();
                    },
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              // color: Theme.of(context).primaryColor,
              onPressed: () => _submitData,
              child: const Text("Add Transaction"),
              // textColor: Colors.white,
              // Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
