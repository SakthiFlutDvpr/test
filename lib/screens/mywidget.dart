import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/networking/htpp_call.dart';
import 'package:test/screens/home_view.dart';
import 'package:test/screens/notification_view.dart';
import 'package:test/utils/navbar_item.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List navItems = [
    {'icon': 'images/home.svg', 'label': 'Home', 'index': 0},
    {'icon': 'images/booking.svg', 'label': 'Bookings', 'index': 1},
    {'icon': 'images/chat.svg', 'label': 'Chat', 'index': 2},
    {'icon': 'images/notificaton.svg', 'label': 'Notification', 'index': 3},
  ];

  int navBar = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffFFFFFF),
        body: IndexedStack(
          index: navBar,
          children: [
            const HomeContent(),
            Container(
              color: Colors.grey,
            ),
            Container(
              color: Colors.teal,
            ),
            const NotificationContent()
          ],
        ),
        bottomNavigationBar: Container(
          width: 1.sw,
          height: 65.h,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-2, 0),
                    blurRadius: 2,
                    spreadRadius: 3,
                    color: Colors.grey.shade50)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r))),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(navItems.length, (i) {
              var data = navItems[i];
              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      navBar = i;
                    });
                  },
                  child: NavbarItem(
                      iconPath: data['icon'],
                      label: data['label'],
                      current: navBar,
                      index: data['index']),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
