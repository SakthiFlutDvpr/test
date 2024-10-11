import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.current,
      required this.index});

  final String iconPath;
  final String label;
  final int current;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 0.25.sw,
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   height: 3.h,
          //   width: 40.w,
          //   color: current != index ? Colors.transparent : Colors.black,
          //
          // ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: current != index ? 0 : 40,
            height: current != index ? 0 : 3,
            color: const Color(0xff651fff),
            margin: EdgeInsets.only(bottom: 5.h),
          ),
          SizedBox(
              height: 18.h,
              width: 20.w,
              child: index != 3
                  ? SvgPicture.asset(
                      iconPath,
                      colorFilter: current != index
                          ? const ColorFilter.mode(
                              Color(0xffB8B8D2), BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Color(0xff651fff), BlendMode.srcIn),
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SvgPicture.asset(
                          iconPath,
                          colorFilter: current != index
                              ? const ColorFilter.mode(
                                  Color(0xffB8B8D2), BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Color(0xff651fff), BlendMode.srcIn),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        )
                      ],
                    )),
          Text(
            label,
            style: TextStyle(
                fontFamily: "Poppins-SemiBold",
                fontSize: 12.sp,
                color: current != index
                    ? const Color(0xffB8B8D2)
                    : const Color(0xff651fff),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
