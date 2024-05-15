import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackerapp/models/expense.dart';  

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  
  @override
  State<NewExpense> createState() {
    // TODO: implement createState
    return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense> {
  
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; 

  void _presentDatePicker() async {
    final now = DateTime.now(); 
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    // fututer type (we use in future )
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now
    );
    print(pickedDate);

    setState(() {
      _selectedDate = pickedDate; 
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // we have alternative 
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {

  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        // text field for writting text 
        TextField(
          // onChanged: _saveTitleInput,
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.name,
          // this for add title for text field 
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),

        Row(
          children: [
            Expanded(
              child: TextField(
                        // onChanged: _saveTitleInput,
                        controller: _amountController,
                        // maxLength: 50,
                        keyboardType: TextInputType.number,
                        // this for add title for text field 
                        decoration: const InputDecoration(
              prefixText: '\$', 
              label: Text('Amount'),
                        ),
                      ),
            ),
        const SizedBox(height: 16,),
        Expanded(
          child: Row(
            // this put element to end 
            mainAxisAlignment: MainAxisAlignment.end,
            //  (center context verticaly)
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _selectedDate == null 
                ? 'No date selected'
                : formatter.format(_selectedDate!)
              ),
              
              IconButton(
                onPressed: _presentDatePicker, 
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
        )
          ],
        ),

        const SizedBox(height: 10,),

        Row(children: [
          
          TextButton(
            onPressed: () {
              // this command remore this overlate
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),

          ElevatedButton(onPressed: () {
            print(_titleController.text);
            print(_amountController.text);
          }, child: const Text('Save Expense')),
          // const SizedBox(width: 10,),


        ],)
      ],
      ),  
    );
    // TODO: implement build


  }
}