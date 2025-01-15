import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:box_king_proj/storages/models/train.dart';

abstract class AppIsarDatabase {
  static late final Isar _instance;

  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return _instance = await Isar.open(
        [TrainSchema],
        directory: dir.path,
    );
  }

  static Future<List<Train>> getTrains() async {
    return await _instance.writeTxn(
        () async => await _instance.trains.where().findAll()
    );
  }

  static Future<void> addTrain(Train train) async {
    await _instance.writeTxn(() async => await _instance.trains.put(train));
  }
}