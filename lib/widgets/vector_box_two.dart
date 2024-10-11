import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VectorBoxTwo extends StatelessWidget {
  const VectorBoxTwo({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 122.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.r),
              topRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r)),
          border: Border.all(color: const Color(0xffEAEAFF), width: 1.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 64.w,
            width: 64.h,
            child: Image.asset(
              iconPath,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: 14.sp,
                color: const Color(0xff38385E),
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
