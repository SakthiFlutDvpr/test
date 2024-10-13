import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VectorBoxOne extends StatelessWidget {
  const VectorBoxOne(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.index,
      required this.current});

  final String iconPath;
  final String title;
  final int index;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97.h,
      // width: 102.w,
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.r),
              topRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r)),
          border: Border.all(
              color: index != current
                  ? const Color(0xffEAEAFF)
                  : const Color(0xff6E6BE8),
              width: 1.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 28.w,
            width: 28.h,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: 12.sp,
                color: const Color(0xffB8B8D2),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
