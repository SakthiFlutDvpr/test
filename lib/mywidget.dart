import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/widgets/navbar_item.dart';
import 'package:test/widgets/top_banner.dart';
import 'package:test/widgets/vector_box_one.dart';
import 'package:test/widgets/vector_box_two.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List vectorBoxList = [
    {
      'title': 'All',
      'path': 'images/Icon-32x-home.svg',
      'index': 0,
    },
    {
      'title': 'Clean',
      'path': 'images/Icon-32x-clean.svg',
      'index': 1,
    },
    {
      'title': 'Repair',
      'path': 'images/Icon-32x-repair.svg',
      'index': 2,
    },
    {
      'title': 'Pest Control',
      'path': 'images/Icon-32x-pest.svg',
      'index': 3,
    },
    {
      'title': 'Food',
      'path': 'images/Icon-32x-food.svg',
      'index': 4,
    },
    {
      'title': 'Laundry',
      'path': 'images/Icon-32x-laundry.svg',
      'index': 5,
    },
  ];

  List navItems = [
    {'icon': 'images/home.svg', 'label': 'Home', 'index': 0},
    {'icon': 'images/booking.svg', 'label': 'Bookings', 'index': 1},
    {'icon': 'images/chat.svg', 'label': 'Chat', 'index': 2},
    {'icon': 'images/notificaton.svg', 'label': 'Notification', 'index': 3},
  ];

  int current = 0;
  int navBar = 0;
  int carousel = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffFFFFFF),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TopBannerBackground(),
                  Container(
                    width: 1.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.w,
                                  //childAspectRatio: 0.6,
                                  mainAxisSpacing: 15),
                          itemBuilder: (c, i) {
                            var map = vectorBoxList[i];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = i;
                                });
                              },
                              child: VectorBoxOne(
                                iconPath: map['path'],
                                title: map['title'],
                                index: map['index'],
                                current: current,
                              ),
                            );
                          },
                          itemCount: vectorBoxList.length,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          'Top Pick',
                          style: TextStyle(
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 18.sp,
                              color: const Color(0xff1F126B),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                  height: 274.h,
                                  child: Image.asset("images/top pick 1.png")),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 127.h,
                                      child:
                                          Image.asset("images/top pick 2.png")),
                                  SizedBox(
                                      height: 127.h,
                                      child:
                                          Image.asset("images/top pick 3.png"))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 1.sw,
                                height: 165.h,
                                child: CarouselSlider(
                                  items: [
                                    Image.asset(
                                      "images/Banner.png",
                                      fit: BoxFit.fill,
                                    ),
                                    Image.asset(
                                      "images/Banner.png",
                                      fit: BoxFit.fill,
                                    ),
                                    Image.asset(
                                      "images/Banner.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      disableCenter: true,
                                      viewportFraction: 1,
                                      onPageChanged: (i, r) {
                                        setState(() {
                                          carousel = i;
                                        });
                                      },
                                      padEnds: true),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              DotsIndicator(
                                dotsCount: 3,
                                position: carousel,
                                decorator: const DotsDecorator(
                                    activeColor: Color(0xff651fff),
                                    activeSize: Size.square(11)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          'Explore',
                          style: TextStyle(
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 18.sp,
                              color: const Color(0xff1F126B),
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 160.h,
                          width: 1.sw,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              VectorBoxTwo(
                                  iconPath: 'images/Rectangle 15.png',
                                  title: 'Bathroom'),
                              VectorBoxTwo(
                                  iconPath: 'images/Rectangle 16.png',
                                  title: 'Groceries'),
                              VectorBoxTwo(
                                  iconPath: 'images/Rectangle 17.png',
                                  title: 'Bathroom')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          height: 50.h,
                          width: 1.sw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: const Color(0xff651fff),
                                        )),
                                    child: Icon(
                                      Icons.add,
                                      color: const Color(0xff651fff),
                                      size: 14.sp,
                                    ),
                                  ),
                                  label: Text(
                                    "Need more service?",
                                    style: TextStyle(
                                        fontFamily: "Poppins-SemiBold",
                                        fontSize: 14.sp,
                                        color: const Color(0xff651fff),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
