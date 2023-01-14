import 'dart:io';
import 'package:first_app/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                onSubmitted: (_) => _submitData(),
                controller: _titleController,
                //   onChanged: (val) {
                //    titleInput = val;
                //  },
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                onSubmitted: (_) => _submitData(),
                keyboardType: TextInputType.number,
                controller: _amountController,
                //   onChanged: (val) {
                //     amountInput = val;
                //    },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No Date Chosen'
                            : 'picked Date ${DateFormat.yMd().format(_selectedDate!)}')),
                   AdaptiveFlatButon('Chose Date', _presentDatePicker)
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: _submitData,
                  child: const Text(
                    'Add Transaction',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
