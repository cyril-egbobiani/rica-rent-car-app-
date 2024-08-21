import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:reca/data/model/car.dart';
import 'package:reca/widgets/book_now_button.dart';

class MapsDetailsPage extends StatelessWidget {
  final Car car;
  const MapsDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(51, -0.09),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                subdomains: const ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car: car),
          )
        ],
      ),
    );
  }

  Widget carDetailsCard({required Car car}) {
    return SizedBox(
      height: 400.h, // Adjust height using ScreenUtil
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r), // Adjust corner radius
                topRight: Radius.circular(30.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10.r, // Adjust blur radius
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h), // Adjust spacing
                Text(
                  car.model,
                  style: TextStyle(
                    fontSize: 24.sp, // Adjust font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.h), // Adjust spacing
                Row(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      color: Colors.white,
                      size: 16, // Adjust icon size
                    ),
                    SizedBox(width: 5.w), // Adjust spacing
                    Text(
                      '${car.distance} km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp, // Adjust font size
                      ),
                    ),
                    SizedBox(width: 10.w), // Adjust spacing
                    const Icon(
                      Icons.battery_full,
                      color: Colors.white,
                      size: 16, // Adjust icon size
                    ),
                    SizedBox(width: 5.w), // Adjust spacing
                    Text(
                      '${car.fuelCapacity} km',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp, // Adjust font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20.w), // Adjust padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r), // Adjust corner radius
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 24.sp, // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h), // Add some spacing
                  feautureIcons(),
                  SizedBox(height: 20.h), // Adjust spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${car.pricePerHour}/day',
                        style: TextStyle(
                          fontSize: 22.sp, // Adjust font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const BookNowButton()
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65.h, // Adjust position using ScreenUtil
            right: 0,
            child: Image.asset(
              'assets/white_car.png',
              height: 150.h, // Adjust image size using ScreenUtil
            ),
          ),
        ],
      ),
    );
  }

  Widget feautureIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
        featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
        featureIcon(Icons.ac_unit, 'Cold', 'Temperature Control'),
      ],
    );
  }

  Widget featureIcon(IconData icon, String title, String subtitle) {
    return Container(
      width: 110.w, // Adjust width using ScreenUtil
      height: 110.h, // Adjust height using ScreenUtil
      padding: EdgeInsets.all(5.w), // Adjust padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r), // Adjust border radius
        border:
            Border.all(color: Colors.grey, width: 1.w), // Adjust border width
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          Icon(
            icon,
            size: 28.sp, // Adjust icon size
          ),
          SizedBox(height: 5.h), // Adjust spacing
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp, // Adjust title text size
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.sp, // Adjust subtitle text size
            ),
          ),
        ],
      ),
    );
  }
}
