import 'package:flutter/material.dart';
import 'package:payment/fictive/data.dart';
import 'package:payment/ui/model/graphist.dart';
import 'package:payment/ui/model/header.dart';
import 'package:payment/ui/model/transaction_list.dart';

class Statistique extends StatefulWidget {
  final List<Transaction> transactionData;

  const Statistique({Key? key, required this.transactionData})
      : super(key: key);

  @override
  _StatistiqueState createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  final categories = categoriesData;
  final viewMode = ValueNotifier<String>("list");

  @override
  void initState() {
    super.initState();
    viewMode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/h.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                // Category Header Section
                Expanded(
                  flex: 2,
                  child: HeaderSection(viewMode: viewMode),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.white,
                    child: viewMode.value == "list"
                        ? TransactionList(transactions: transactionData)
                        : Column(
                            children: [
                              Flexible(
                                child: StepChart(transactions: transactionData),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Transaction',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Icon(categories[index].icon),
                                          SizedBox(width: 10),
                                          Text(categories[index].name),
                                          SizedBox(width: 10),
                                          Text(categories[index]
                                              .expenses
                                              .toString()),
                                          Spacer(),
                                          Icon(Icons
                                              .arrow_circle_right_outlined),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
