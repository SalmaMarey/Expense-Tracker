import 'package:fees_app/widgets/new_expenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ThemePage.dart';
import '../models/button_theme.dart';
import '../models/expense.dart';
import 'chart/chart.dart';
import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // ignore: unused_field
  final List<Expense> _registerExpenses = [
    Expense(
      category: Category.leisure,
      title: 'Cinema',
      amount: 9.71555,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.work,
      title: 'flutter Course',
      amount: 29.988888,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'Breakfast',
      amount: 31.311111111,
      date: DateTime.now(),
    )
  ];
  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registerExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          const Icon(Icons.dark_mode),
          ChangeThemeButtonWidget(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (c) => NewExpense(onAddExpense: _addExpense),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(
              expenses: _registerExpenses,
            ),
            Expanded(
              child: ExpensesList(
                  onRemoveExpense: _removeExpense, expenses: _registerExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
