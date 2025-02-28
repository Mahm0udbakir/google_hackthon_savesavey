import 'package:flutter/material.dart';


class WorkingOn extends StatefulWidget {
  const WorkingOn({super.key});

  @override
  _WorkingOnState createState() => _WorkingOnState();
}

class _WorkingOnState extends State<WorkingOn> {
  int dotCount = 0;

  @override
  void initState() {
    super.initState();
    _startDotAnimation();
  }

  void _startDotAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          dotCount = (dotCount + 1) % 4;
        });
        _startDotAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CreditCardWidget(
              lastFourDigits: "1111",
              balance: "1111",
            ),
            SizedBox(height: 20),
            Text(
              "On Progress${'.' * dotCount}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String lastFourDigits;
  final String balance;

  const CreditCardWidget({
    Key? key,
    required this.lastFourDigits,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "**** **** **** $lastFourDigits",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "\$$balance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.circle, color: Colors.white60, size: 16),
          ),
        ],
      ),
    );
  }
}

