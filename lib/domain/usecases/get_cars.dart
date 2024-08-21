import 'package:reca/data/model/car.dart';
import 'package:reca/domain/repository/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
