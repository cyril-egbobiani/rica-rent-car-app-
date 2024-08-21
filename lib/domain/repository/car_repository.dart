import 'package:reca/data/model/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}
