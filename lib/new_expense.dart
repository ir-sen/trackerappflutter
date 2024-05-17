import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:trackerapp/models/expense.dart';  

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;


  
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
  Category _selectedCategory = Category.leisure;

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


  void _submitExpenseData() {
    // tryParse('Hello') => null, tryParse('1.12') => 1.12
    final enterdAmount = double.tryParse(_amountController.text);
    final amoutIsInvalid = enterdAmount == null || enterdAmount <= 0;

    if (_titleController.text.trim().isEmpty || amoutIsInvalid || _selectedDate == null) {
  
      // show error
      showDialog(context: context, builder: (ctx) =>
        AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              }, child: const Text('Okey'),
            )
          ]
        )
        );
        return;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text,
      anount: enterdAmount,
      date: _selectedDate!,
      category: _selectedCategory,
      ));

      
    Navigator.pop(context);
    
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

      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
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

        const SizedBox(height: 16,),

        Row(children: [
          
          DropdownButton(
            value: _selectedCategory,
            items: Category.values.map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(
                category.name.toUpperCase(),
                ),
              ) 
            ).toList(),

            onChanged: (value) {
              
              if (value == null) {
                return;
              }

              setState(() {
                _selectedCategory = value;
              });
  
            }
          ),

          TextButton(
            onPressed: () {
              // this command remore this overlate
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: _submitExpenseData,
            child: const Text('Save Expense')
            ),
          // const SizedBox(width: 10,),


        ],)
      ],
      ),  
    );
    // TODO: implement build


  }
}