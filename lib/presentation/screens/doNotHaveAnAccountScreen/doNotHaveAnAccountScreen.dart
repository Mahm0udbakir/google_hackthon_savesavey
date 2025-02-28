import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_hackthon_savesavey/business_logic/home_cubit.dart';
import 'package:google_hackthon_savesavey/business_logic/home_states.dart';

class DoNotHaveAnAccountScreen extends StatelessWidget {
  const DoNotHaveAnAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Required data",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                /// PROFILE IMAGE WITH CAMERA ICON
                Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 4, color: Colors.transparent),
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('assets/bankMasr.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            print("Profile image camera clicked");
                            // Implement camera functionality if needed
                          },
                          child: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.camera_alt,
                                color: Colors.black, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// OPTIONS LIST
                BlocConsumer<HomeCubit, HomeStates>(
                  listener: (context, state) {
                    if (state is SuccessHomeState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("Extracted Text: ${state.extractedText}")),
                      );
                    } else if (state is ErrorHomeState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${state.error}")),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        profileOption(
                          "National ID Face",
                          FontAwesomeIcons.idCard,
                          context,
                          () {
                            HomeCubit.get(context).fetchTextFromImage();
                          },
                        ),
                        profileOption(
                          "National ID Back",
                          FontAwesomeIcons.idCard,
                          context,
                          () {
                            HomeCubit.get(context).fetchTextFromImage();
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),

            /// IMAGE AT THE BOTTOM
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'assets/images/Demoid.jpeg',
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// OPTIONS LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  profileOption(
                      "National ID Face", FontAwesomeIcons.idCard, context, () {
                    print("National ID Face clicked");
                    // Add action to open camera or navigate to another screen
                  }),
                  profileOption(
                      "National ID Back", FontAwesomeIcons.idCard, context, () {
                    print("National ID Back clicked");
                    // Add action to open camera or navigate to another screen
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileOption(
      String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
          trailing: const Icon(Icons.camera_alt_rounded, color: Colors.black),
          onTap: onTap,
        ),
      ),
    );
  }
}
