import 'package:flutter/material.dart';

class BankCustomerCheck extends StatelessWidget {
  const BankCustomerCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bank Customer Check")),
      body: Center(
        child: Text("Are you a customer of this bank?"),
      ),
    );
  }
}
