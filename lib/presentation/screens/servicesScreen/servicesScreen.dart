import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class servicesScreen extends StatelessWidget {
  const servicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "Services",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                appOptions(
                    "Financial assistance", FontAwesomeIcons.handHoldingDollar, context),
                appOptions(
                    "Create Credit Card (CC)", FontAwesomeIcons.creditCard, context),
                appOptions(
                    "Create Debit Card (DC)", FontAwesomeIcons.creditCard, context),
                appOptions(
                    "Investments", FontAwesomeIcons.chartLine, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appOptions(String title, IconData icon, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        onTap: () {},
      ),
    ),
  );
}
}