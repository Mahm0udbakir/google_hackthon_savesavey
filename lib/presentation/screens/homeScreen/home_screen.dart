import 'package:flutter/material.dart';

import '../../../helpers/text_styles.dart';
import '../../widgets/components.dart';
import 'bank_customer_check.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment', style: TextStyles.font30BLackSemiBold),
            const SizedBox(height: 10),
            Text('Connect with Bank Account',
                style: TextStyles.font18BlackRegular),
            const SizedBox(height: 5),
            _searchTextField(),
            const SizedBox(height: 20),
            Text('All Banks', style: TextStyles.font20BlackSemiBold),
            const SizedBox(height: 10),
            Expanded(child: BankListView(searchController: searchController)),
          ],
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search Bank',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
      ),
    );
  }
}

class BankListView extends StatefulWidget {
  final TextEditingController searchController;
  const BankListView({super.key, required this.searchController});

  @override
  State<BankListView> createState() => _BankListViewState();
}

class _BankListViewState extends State<BankListView> {
  final List<Map<String, dynamic>> allBanks = const [
    {'name': 'CIB', 'assetPath': 'assets/images/cib.png', 'borderColor': Colors.green},
    {'name': 'BANQUE MISR', 'assetPath': 'assets/images/bankMasr.png', 'borderColor': Colors.orange},
    {'name': 'HSBC', 'assetPath': 'assets/images/hsbc.png', 'borderColor': Colors.blue},
    {'name': 'EG BANK', 'assetPath': 'assets/images/egBank.png', 'borderColor': Colors.green},
    {'name': 'SAIB', 'assetPath': 'assets/images/saibBank.jpg', 'borderColor': Colors.orange},
    {'name': 'NBE', 'assetPath': 'assets/images/nbe.png', 'borderColor': Colors.blue},
    {'name': 'E BANK', 'assetPath': 'assets/images/eBank.jpg', 'borderColor': Colors.blue},
  ];

  List<Map<String, dynamic>> get filteredBanks {
    String searchQuery = widget.searchController.text.toLowerCase();
    return allBanks.where((bank) => bank['name'].toLowerCase().startsWith(searchQuery)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredBanks.length,
      itemBuilder: (context, index) {
        final bank = filteredBanks[index];
        return _bankListTile(bank['name'], bank['assetPath'], bank['borderColor']);
      },
    );
  }

  Widget _bankListTile(String name, String assetPath, Color borderColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(assetPath, width: 30),
        title: Text(name, style: TextStyles.font18BlackRegular),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          navigateTo(context, BankCustomerCheck());
        },
      ),
    );
  }
}
