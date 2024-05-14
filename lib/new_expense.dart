import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

        const SizedBox(height: 10,),

        TextField(
          // onChanged: _saveTitleInput,
          controller: _amountController,
          // maxLength: 50,
          keyboardType: TextInputType.number,
          // this for add title for text field 
          decoration: const InputDecoration(
            label: Text('Amount'),
          ),
        ),

        Row(children: [
          
          TextButton(
            onPressed: () {},
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