import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_hackthon_savesavey/presentation/screens/workingOn/workingOn.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/components.dart';

class CreateCCScreen extends StatelessWidget {
  const CreateCCScreen({super.key});

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
            "Required docs",
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
                CreateCardOptions("National ID Face", FontAwesomeIcons.idCard,
                    context, "success"),
                CreateCardOptions("National ID Back",
                    FontAwesomeIcons.idCardClip, context, "success"),
                CreateCardOptions("Birth Certificate",
                    FontAwesomeIcons.fileSignature, context, "validation"),
                CreateCardOptions("Military Recruitment Status",
                    FontAwesomeIcons.userShield, context, "not_scanned"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Status Criteria:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 10),
                    const Text("Success - Document approved")
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.yellow),
                    const SizedBox(width: 10),
                    const Text("Validation - Under review")
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.cancel, color: Colors.red),
                    const SizedBox(width: 10),
                    const Text("Not Scanned - Requires submission")
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget CreateCardOptions(
      String title, IconData icon, BuildContext context, String status) {
    IconData statusIcon;
    Color statusColor;

    switch (status) {
      case "success":
        statusIcon = Icons.check_circle;
        statusColor = Colors.green;
        break;
      case "validation":
        statusIcon = Icons.check_circle;
        statusColor = Colors.yellow;
        break;
      case "not_scanned":
      default:
        statusIcon = Icons.cancel;
        statusColor = Colors.red;
        break;
    }

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
          trailing: Icon(statusIcon, color: statusColor),
          onTap: () {
            navigateAndFinish(context, WorkingOn());
          },
        ),
      ),
    );
  }
}
