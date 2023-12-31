import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/rendering.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function (Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}



class _NewExpenseState extends State<NewExpense> {
final _titleController = TextEditingController();
final _amountController = TextEditingController();
 DateTime? _selectedDate;
 Category _selectedCategory = Category.leisure;

void _datePicker() async {
  final now = DateTime.now();
  final firstDate = DateTime(now.year -1, now.month , now.day);

final pickedDate = await showDatePicker(
context: context,
firstDate : firstDate ,
 initialDate: now,
   lastDate: now
   );
   setState(() {
     _selectedDate = pickedDate;
   });
}

void _submitData(){
final enteredAmount = double.tryParse(_amountController.text);
final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
  if (_titleController.text.trim().isEmpty ||
   amountIsInvalid ||
    _selectedDate == null){
    showDialog(
      context: context,
     builder: (ctx)=>  AlertDialog(
      title:  const Text('Invalid Input') ,
      content: const Text('Please Enter a Valid Title , Amount, Date And Category'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, 
        child: const Text('Okay')
        )
      ],
      )
     );
     return;
  }
  widget.onAddExpense(
    Expense(
      title: _titleController.text
    , amount: enteredAmount,
     date: _selectedDate!
     , category: _selectedCategory
     ));
     Navigator.pop(context);
}


@override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints){

       return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.fromLTRB(16,48,16,keyboardSpace +16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              )
            ),
            const SizedBox(height: 10),
          
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: 'L.E ',
                      label: Text('Amount')
                    )
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(
                         _selectedDate == null ?
                          'No Date Selected' 
                          : formatter.format(
                            _selectedDate!
                            )
                            ),
                      IconButton(
                        onPressed: (){
                          _datePicker();
                        },
                         icon: const Icon(Icons.calendar_month)
                        )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map(
                    (category) => DropdownMenuItem(
                      value: category,
                    child: Text(
                      category.name.toUpperCase(),
          
                      )
                    )
                    ).toList(),
                 onChanged: (value){
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                 }
                ),
                const Spacer(),
                 TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                   child: const Text(
                    'Cancel',
                      style: TextStyle(
          
                     ),
                    )
                   ),
                   ElevatedButton(
                    onPressed: _submitData,
                       style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
              ),
                                      ),
            ),
            child: const Text(
        'SAVE',
            style: TextStyle(
          
        ),
            ),
            ),
          
              ],
            ),
            const SizedBox(height: 15),
          ],
        ) ,
        ),
    );
    });

       
  }
}