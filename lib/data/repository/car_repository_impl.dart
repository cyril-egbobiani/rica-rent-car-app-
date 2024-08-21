import 'package:reca/data/datasources/firebase_car_data_source.dart';
import 'package:reca/data/model/car.dart';
import 'package:reca/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
