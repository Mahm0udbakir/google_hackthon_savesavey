import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/data/models/user_model.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Good Morning, Anas!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _balanceCard(),
            const SizedBox(height: 20),
            _quickActions(),
            const SizedBox(height: 20),
            _recentTransactions(),
            const SizedBox(height: 20),
            _spendingInsights(),
            const SizedBox(height: 20),
            _offersSection(),
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Total Balance", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          const Text("\$5,230.45", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _quickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionButton("Send", LucideIcons.send),
        _actionButton("Pay", LucideIcons.creditCard),
        _actionButton("Scan", LucideIcons.scanLine),
        _actionButton("More", LucideIcons.grid),
      ],
    );
  }

  Widget _actionButton(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 25,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _recentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recent Transactions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _transactionTile("Amazon", "Shopping", "-\$50.99", Colors.red),
        _transactionTile("Uber", "Transport", "-\$12.75", Colors.red),
        _transactionTile("Spotify", "Subscription", "-\$9.99", Colors.red),
      ],
    );
  }

  Widget _transactionTile(String title, String subtitle, String amount, Color color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color, child: Icon(LucideIcons.shoppingBag, color: Colors.white)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
    );
  }

  Widget _spendingInsights() {
    List<Map<String, dynamic>> transactions = [
      {"category": "Shopping", "amount": 50.99},
      {"category": "Transport", "amount": 12.75},
      {"category": "Subscription", "amount": 9.99},
      {"category": "Food", "amount": 15.50},
      {"category": "Subscription", "amount": 12.99},
      {"category": "Shopping", "amount": 120.00},
    ];

    Map<String, double> categoryTotals = {};
    double totalSpending = 0;

    for (var transaction in transactions) {
      String category = transaction["category"];
      double amount = transaction["amount"];
      totalSpending += amount;

      categoryTotals[category] = (categoryTotals[category] ?? 0) + amount;
    }

    List<PieChartSectionData> sections = categoryTotals.entries.map((entry) {
      String category = entry.key;
      double amount = entry.value;
      double percentage = (amount / totalSpending) * 100;

      return PieChartSectionData(
        color: _getCategoryColor(category),
        value: percentage,
        title: "${percentage.toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Spending Insights", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        // Constrain the PieChart's size using a Container or SizedBox
        Container(
          height: 250, // Set the height for the PieChart
          width: double.infinity, // Set width to be full-width
          child: PieChart(
            PieChartData(
              sections: sections,
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 40,
              sectionsSpace: 0,
            ),
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case "Shopping":
        return Colors.orange;
      case "Transport":
        return Colors.blue;
      case "Subscription":
        return Colors.green;
      case "Food":
        return Colors.red;
      default:
        return Colors.purple;
    }
  }

  Widget _offersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Offers & Rewards", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _offerCard("5% Cashback on Fuel", "Valid till March 30"),
        _offerCard("No-Fee International Transfers", "Available for premium users"),
      ],
    );
  }

  Widget _offerCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
