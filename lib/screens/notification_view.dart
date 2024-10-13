import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/networking/htpp_call.dart';
import 'package:test/screens/detail_screen.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18.sp),
        ),
        backgroundColor: const Color(0xff651fff),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.h),
        child: FutureBuilder(
            future: ApiCalls.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error in Fetching',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ));
              }

              List data = snapshot.data as List;
              if (data.isEmpty || data == null) {
                return Center(
                    child: Text(
                  'No data',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ));
              }

              return ListView.separated(
                itemBuilder: (c, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(data: data[i])));
                    },
                    child: Card(
                      elevation: 3,
                      color: Colors.grey.shade100,
                      child: ListTile(
                        leading: Text(
                          data[i]['id'].toString(),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          data[i]['title'].toString(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (c, i) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: data.length,
              );
            }),
      ),
    );
  }
}
