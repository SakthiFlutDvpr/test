import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopBannerBackground extends StatelessWidget {
  const TopBannerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 237.h,
        width: 1.sw,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Mask Group.png'), fit: BoxFit.fill)),
        alignment: Alignment.topCenter,
        padding:
            EdgeInsets.only(left: 32.w, right: 32.w, top: 69.h, bottom: 32.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hi John,',
                        style: TextStyle(
                            fontFamily: "Poppins-SemiBold",
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Need some help today?',
                        style: TextStyle(
                            fontFamily: "Poppins-Regular",
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 47.h,
                  width: 47.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Rectangle 6.png'),
                          fit: BoxFit.fill)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24.w,
                        height: 3.h,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Container(
                        width: 16.w,
                        height: 3.h,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2.r),
                      topRight: Radius.circular(15.r),
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r))),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/line.svg',
                          ),
                          Positioned(
                            bottom: 3.r,
                            right: 3.r,
                            child: SvgPicture.asset(
                              'images/circle.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                    hintText: "Find it here",
                    hintStyle: TextStyle(
                        fontFamily: "Poppins-Regular",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff78789D))),
              ),
            )
          ],
        ));
  }
}
