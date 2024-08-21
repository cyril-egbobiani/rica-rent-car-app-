import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reca/data/model/car.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff212020),
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(0, 8))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  Text(
                    '> ${car.distance.toString()} km',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '> ${car.fuelCapacity.toString()} km',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
