import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String title;
  final double amount;
  final String date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}

class Expense {
  final int id;
  final String title;
  final String description;
  final String location;
  final double total;
  final String status;
  final String date;

  Expense({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.total,
    required this.status,
    required this.date,
  });
}

class Category {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  final List<Expense> expenses;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.expenses,
  });
}

final List<Transaction> transactionData = [
  Transaction(id: 1, title: 'Achat de café', amount: 200, date: '2023-01-01'),
  Transaction(
      id: 2, title: 'Facture electricité', amount: 0, date: '2023-01-02'),
  Transaction(
      id: 3,
      title: 'Remboursement de prêt',
      amount: -200.00,
      date: '2023-01-03'),
  Transaction(
      id: 4, title: 'Achat de vêtements', amount: 49.99, date: '2023-02-05'),
  Transaction(id: 5, title: 'transfert', amount: 200.00, date: '2023-02-22'),
  Transaction(id: 6, title: 'transfert', amount: 200.00, date: '2023-02-30'),
  Transaction(id: 7, title: 'transfert', amount: 500.00, date: '2023-02-31'),
];

const String confirmStatus = "C";
const String pendingStatus = "P";

final List<Category> categoriesData = [
  Category(
    id: 1,
    name: "Education",
    icon: Icons.school,
    color: Colors.yellow,
    expenses: [
      Expense(
        id: 1,
        title: "Tuition Fee",
        description: "Tuition fee",
        location: "ByProgrammers' tuition center",
        total: 100.00,
        status: pendingStatus,
        date: '2023-01-01',
      ),
      // ... Ajoutez les autres dépenses pour cette catégorie
    ],
  ),
  Category(
    id: 2,
    name: "Nutrition",
    icon: Icons.fastfood,
    color: Colors.lightBlue,
    expenses: [
      Expense(
        id: 5,
        title: "Vitamins",
        description: "Vitamin",
        location: "ByProgrammers' Pharmacy",
        total: 25.00,
        status: pendingStatus,
        date: '2023-02-02',
      ),
    ],
  ),
];
