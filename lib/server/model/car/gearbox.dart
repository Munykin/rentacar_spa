import 'package:aqueduct/aqueduct.dart';
import 'package:rentacar_spa/interfaces/gearbox.dart';
import 'package:rentacar_spa/server/model/car/car.dart';

class Gearbox extends ManagedObject<_Gearbox> implements _Gearbox, IGearbox {}
class _Gearbox {
  @managedPrimaryKey
  int id;
  String title;

  ManagedSet<Car> car;
}