import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_5_expense_tracker_with_firebase/utils/expense_model.dart';
import 'package:task_5_expense_tracker_with_firebase/utils/item.dart';
import 'package:task_5_expense_tracker_with_firebase/widgets/fund_condition_widget.dart';
import 'package:intl/intl.dart';
import 'package:task_5_expense_tracker_with_firebase/screens/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List options = ["expense", "income"];
List<ExpenseModel> expenses = [];

class _HomePageState extends State<HomePage> {

  var isLogoutLoading = false;

  logout() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    // );

    setState(() {
      isLogoutLoading = false;
    });
  }

  // Controllers
  final itemController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  // Variables
  int amount = 0;
  int totalMoney = 0;
  int spentMoney = 0;
  int income = 0;

  DateTime? pickedDate;
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: SizedBox(
        height: 67,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff252634),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: AlertDialog(
                      title: const Padding(
                        padding: EdgeInsets.only(left: 1.6),
                        child: Text("ADD TRANSICTION"),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            amount = int.parse(amountController.text);
                            // adding a new item
                            final expense = ExpenseModel(
                              item: itemController.text,
                              amount: amount,
                              isIncome: currentOption == "income" ? true : false,
                              date: pickedDate!,
                            );
                            expenses.add(expense);
                            if (expense.isIncome) {
                              income += expense.amount;
                              totalMoney += expense.amount;
                              setState(() {});
                            } else if (!expense.isIncome) {
                              spentMoney += expense.amount;
                              totalMoney -= expense.amount;
                              setState(() {});
                            }
                    
                            itemController.clear();
                            amountController.clear();
                            dateController.clear();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "ADD",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "CANCEL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                      content: SizedBox(
                        height: 340,
                        width: 400,
                        child: Column(
                          children: [
                            TextField(
                              controller: itemController,
                              decoration: const InputDecoration(
                                hintText: "Enter the Item",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "Enter the Amount",
                                hintStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                onTap: () async {
                                  // user can pick date
                                  pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  String date =
                                      DateFormat.yMMMMd().format(pickedDate!);
                                  dateController.text = date;
                                  setState(() {});
                                },
                                controller: dateController,
                                decoration: const InputDecoration(
                                  labelText: "DATE",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  filled: true,
                                  prefixIcon: Icon(Icons.calendar_today),
                                  prefixIconColor: Colors.blue,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                            const SizedBox(height: 15),
                            RadioMenuButton(
                              value: options[0],
                              groupValue: currentOption,
                              onChanged: (expense) {
                                currentOption = expense.toString();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "Expense",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.4,
                                  ),
                                ),
                              ),
                            ),
                            RadioMenuButton(
                              style: ButtonStyle(
                                iconSize: WidgetStateProperty.all(20),
                              ),
                              value: options[1],
                              groupValue: currentOption,
                              onChanged: (income) {
                                currentOption = income.toString();
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.4,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add, size: 26),
        ),
      ),
      appBar: AppBar(
        title: const Text("Expense Tracker",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xff252634),
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.white,
              onPressed: () {
                logout();
              },
              icon: isLogoutLoading
                  ? CircularProgressIndicator()
                  : Icon(Icons.exit_to_app)),
        ],
      ),
      body: Container(
        color: Color(0xff252634),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: MoneyCondition(
                      type: "DEPOSIT",
                      amount: "$totalMoney",
                      icon: "rupee-silver",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: MoneyCondition(
                      type: "EXPENSE",
                      amount: "$spentMoney",
                      icon: "rupee-used",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 8),
                    child: MoneyCondition(
                      type: "INCOME",
                      amount: "$income",
                      icon: "rupee-gold",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "Confirm to Delete the Item ?",
                                style: TextStyle(
                                  fontSize: 19.0,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    final myExpense = expenses[index];
                                    if (myExpense.isIncome) {
                                      income -= myExpense.amount;
                                      totalMoney -= myExpense.amount;
                                      setState(() {});
                                    } else if (!myExpense.isIncome) {
                                      spentMoney -= myExpense.amount;
                                      totalMoney += myExpense.amount;
                                      setState(() {});
                                    }
                                    expenses.remove(myExpense);
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "DELETE",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Item(
                        expense: ExpenseModel(
                          item: expenses[index].item,
                          amount: expenses[index].amount,
                          isIncome: expenses[index].isIncome,
                          date: expenses[index].date,
                        ),
                        onDelete: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
