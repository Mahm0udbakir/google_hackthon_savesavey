import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/presentation/screens/budget_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/calender_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/credit_card_screen.dart';
import 'package:google_hackthon_savesavey/presentation/screens/home_screen.dart';
import '../../helpers/color_manager.dart';
import '../../router/routes.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with SingleTickerProviderStateMixin {
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  int selectedTap = 0;

  final List<Widget> pages = [
    HomeScreen(),
    BudgetScreen(),
    CalenderScreen(),
    CreditCardScreen(),
  ];

  late final AnimationController _fabController;
  Animation<double>? _fabScale;

  @override
  void initState() {
    super.initState();
    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fabScale = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeOutBack))
        .animate(_fabController);

    _fabController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fabController.reverse();
        Navigator.pushNamed(context, Routes.chatBotScreen);
      }
    });
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.gray80,
      body: Stack(
        children: [
          PageStorage(
            bucket: pageStorageBucket,
            child: IndexedStack(
              index: selectedTap,
              children: pages,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildCustomBottomNav(),
          ),
        ],
      ),
    );
  }

  Widget buildCustomBottomNav() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/bottomNavBackground.png'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => onTabTapped(0),
                      icon: Image.asset(
                        'assets/images/homeIcon.png',
                        width: 20,
                        height: 20,
                        color: selectedTap == 0 ? ColorManager.white : ColorManager.gray40,
                      ),
                    ),
                    IconButton(
                      onPressed: () => onTabTapped(1),
                      icon: Image.asset(
                        'assets/images/budgetsIcon.png',
                        width: 20,
                        height: 20,
                        color: selectedTap == 1 ? ColorManager.white : ColorManager.gray40,
                      ),
                    ),
                    const SizedBox(height: 50, width: 50),
                    IconButton(
                      onPressed: () => onTabTapped(2),
                      icon: Image.asset(
                        'assets/images/calenderIcon.png',
                        width: 20,
                        height: 20,
                        color: selectedTap == 2 ? ColorManager.white : ColorManager.gray40,
                      ),
                    ),
                    IconButton(
                      onPressed: () => onTabTapped(3),
                      icon: Image.asset(
                        'assets/images/creditCardIcon.png',
                        width: 20,
                        height: 20,
                        color: selectedTap == 3 ? ColorManager.white : ColorManager.gray40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

            Padding(
              padding: const EdgeInsets.only(bottom: 35 , right: 1),
              child:  _fabScale == null
                  ? FloatingActionButton.small(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.chatBotScreen);
                },
                backgroundColor: ColorManager.gray30,
                child: const Icon(
                  Icons.smart_toy_rounded,
                ),
              )
                  : ScaleTransition(
                scale: _fabScale!,
                child: FloatingActionButton(
                  onPressed: () {
                    _fabController.forward();
                  },
                  backgroundColor: ColorManager.secondary,
                  child: const Icon(Icons.smart_toy_rounded),
                ),
              ),
            ),

        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      selectedTap = index;
    });
  }
}
