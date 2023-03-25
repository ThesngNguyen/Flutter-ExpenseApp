import 'dart:math';

import 'package:expense_app/datetime/date_time_helper.dart';
import 'package:expense_app/models/expense_item.dart';

class ExpenseData {
  List<ExpenseItem> overallExpenseList = [];
  // List of ALL expenses

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }
  // get expense list

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }
  // add

  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }
  // delete

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
        break;
      default:
        return '';
    }
  }

  DateTime startOfWeekDate() {
    DateTime? startofWeek;

    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sunday') {
        startofWeek = today.subtract(Duration(days: i));
      }
    }

    return startofWeek!;
  }

  // get timedata
  //get the date start of the week
  /*

  overallExpense 

  DailyExpenseSummary 
  */
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseList) {
      String date = convertDateTimetoString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
