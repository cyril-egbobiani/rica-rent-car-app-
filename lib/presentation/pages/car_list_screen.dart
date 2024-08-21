import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reca/presentation/bloc/car_bloc.dart';
import 'package:reca/presentation/bloc/car_state.dart';
import 'package:reca/widgets/car_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose your car',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,  // Adjust the text size using ScreenUtil
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        toolbarHeight: 56.h,  // Adjust the height of the AppBar
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.w,  // Adjust the width of the progress indicator
              ),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: CarCard(car: state.cars[index]),
                );
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: TextStyle(fontSize: 16.sp),  // Adjust the error message text size
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
