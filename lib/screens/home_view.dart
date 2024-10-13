import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/utils/top_banner.dart';
import 'package:test/utils/vector_box_one.dart';
import 'package:test/utils/vector_box_two.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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

  int carousel = 0;
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const TopBannerBackground(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        //childAspectRatio: 0.6,
                        mainAxisSpacing: 15.h),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 127.h,
                                child: Image.asset("images/top pick 2.png")),
                            SizedBox(
                                height: 127.h,
                                child: Image.asset("images/top pick 3.png"))
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
