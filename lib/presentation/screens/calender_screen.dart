import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';

import '../../helpers/color_manager.dart';
import '../widgets/subscription_cell.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key});

  final CalendarAgendaController _calendarController = CalendarAgendaController();

  @override
  Widget build(BuildContext context) {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Container(
              height: 480,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.gray70.withValues(alpha: 0.5),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Calendar',
                          style: TextStyle(
                            color: ColorManager.gray30,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
      
                      const SizedBox(height: 40),
      

                      Text(
                        'Subs\nSchedule',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          color: ColorManager.white,
                        ),
                      ),
      
                      const SizedBox(height: 20),
      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '3 subscriptions for today',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.gray30,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _calendarController.goToDay(DateTime.now());
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              backgroundColor:
                              ColorManager.gray60.withValues(alpha: 0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: ColorManager.gray30.withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
      
                      const SizedBox(height: 16),
      
                      Expanded(
                        child: CalendarAgenda(
                          calendarBackground: ColorManager.white,
                          calendarEventColor: ColorManager.white,

                          calendarEventSelectedColor: ColorManager.secondary,
                          calendarLogo: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: ColorManager.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          controller: _calendarController,
                          backgroundColor: Colors.transparent,
                          fullCalendarScroll: FullCalendarScroll.horizontal,
                          fullCalendarDay: WeekDay.long,
                          weekDay: WeekDay.long,
                          selectedDateColor: ColorManager.secondary,
                          dateColor: ColorManager.gray30,
                          locale: 'en',
                          initialDate: DateTime.now(),
                          firstDate:
                          DateTime.now().subtract(const Duration(days: 140)),
                          lastDate: DateTime.now().add(const Duration(days: 60)),
                          onDateSelected: (selectedDate) {
                            // TODO: handle selected date
                          },
                        ),
                      ),
      
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "January",
                      style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$24.98",
                      style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "01.08.2023",
                      style: TextStyle(
                          color: ColorManager.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "in upcoming bills",
                      style: TextStyle(
                          color: ColorManager.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1),
              itemCount: subscriptionArr.length,
              itemBuilder: (context, index) {
                var sObj = subscriptionArr[index] as Map? ?? {};
      
                return SubscriptionCell(
                  sObj: sObj,
                  onPressed: () {},
                );
              }),
          const SizedBox(
            height: 130,
          ),
        ],
      
      ),
    );
  }
}
