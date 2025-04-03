import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_hackthon_savesavey/presentation/screens/chatBotScreen/chatBotScreen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/createCCScreen/createCC.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/components.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
                  "Financial assistance",
                  FontAwesomeIcons.handHoldingDollar,
                  context,
                      () {
                    navigateTo(context, ChatBotScreen());
                    debugPrint("Financial assistance clicked");
                    // Add navigation or action
                  },/**/
                ),
                appOptions(
                  "Create Credit Card (CC)",
                  FontAwesomeIcons.creditCard,
                  context,
                      () {
                    navigateTo(context, CreateCCScreen());
                    debugPrint("Create Credit Card clicked");
                    // Add navigation or action
                  },
                ),
                appOptions(
                  "Create Debit Card (DC)",
                  FontAwesomeIcons.creditCard,
                  context,
                      () {
                        navigateTo(context, CreateCCScreen());
                        debugPrint("Create Debit Card clicked");
                    // Add navigation or action
                  },
                ),
                appOptions(
                  "Investments",
                  FontAwesomeIcons.chartLine,
                  context,
                      () {
                        debugPrint("Investments clicked");
                    // Add navigation or action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appOptions(String title, IconData icon, BuildContext context, VoidCallback onTap) {
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
