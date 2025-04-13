import 'package:flutter/material.dart';
import 'package:google_hackthon_savesavey/helpers/color_manager.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/app_segment_button.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/status_button.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/subscription_home_list.dart';
import 'package:google_hackthon_savesavey/presentation/widgets/upcoming_bills_home_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSubscription = true;
  List subscriptionArr = [
    {
      "name": "Spotify",
      "icon": "assets/images/spotifyLogo.png",
      "price": "6.99"
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/images/youtubeLogo.png",
      "price": "8.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/images/oneDriveLogo.png",
      "price": "5.50"
    },
    {
      "name": "NetFlix",
      "icon": "assets/images/netflixLogo.png",
      "price": "11.99"
    },
  ];
  List upcomingBillsArr = [
    {"name": "Spotify", "date": DateTime(2025, 6, 1), "price": "6.99"},
    {"name": "Youtube Premium", "date": DateTime(2025, 6, 1), "price": "8.99"},
    {
      "name": "Microsoft OneDrive",
      "date": DateTime(2025, 6, 1),
      "price": "5.50"
    },
    {"name": "NetFlix", "date": DateTime(2025, 6, 1), "price": "11.99"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Container(
                height: media.width * 1.1,
                decoration: BoxDecoration(
                  color: ColorManager.gray70.withValues(alpha: 0.5),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('assets/images/homeCircle.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/appLogo.png',
                              width: 15,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'SAVESAVEY',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\$1,240",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "This month bills",
                          style: TextStyle(
                              color: ColorManager.gray40,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 32,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    ColorManager.border.withValues(alpha: 0.15),
                              ),
                              color: ColorManager.gray50.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'See your budget',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: StatusButton(
                                title: "Active subs",
                                value: '4',
                                statusColor: ColorManager.secondary),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: StatusButton(
                                title: "Highest subs",
                                value: '18.99',
                                statusColor: ColorManager.primary),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: StatusButton(
                                title: "Lowest subs",
                                value: '5.99',
                                statusColor: ColorManager.secondaryGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Expanded(
                    child: AppSegmentButton(
                        title: 'Your subscription',
                        onTap: () {
                          setState(() {
                            isSubscription = !isSubscription;
                          });
                        },
                        isActive: isSubscription),
                  ),
                  Expanded(
                    child: AppSegmentButton(
                      title: 'Upcoming bills',
                      isActive: !isSubscription,
                      onTap: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var subscriptionObject = subscriptionArr[index] as Map? ?? {};
                  return SubscriptionHomeList(
                    subsObj: subscriptionObject,
                    onPressed: () {},
                  );
                },
                itemCount: subscriptionArr.length,
              ),
            if (!isSubscription)
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var upcomingBillsObject =
                      upcomingBillsArr[index] as Map? ?? {};
                  return UpcomingBillsHomeList(
                    billsObj: upcomingBillsObject,
                    onPressed: () {},
                  );
                },
                itemCount: upcomingBillsArr.length,
              ),
            const SizedBox(
              height: 150,
            )
          ],
        ),
      );
    // );
  }
}
