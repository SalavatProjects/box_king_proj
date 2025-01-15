import 'package:bloc/bloc.dart';
import 'package:box_king_proj/bloc/train_cubit.dart';
import 'package:box_king_proj/storages/isar.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:box_king_proj/storages/models/train.dart';

part 'trains_state.dart';

class TrainsCubit extends Cubit<TrainsState> {
  TrainsCubit() : super(const TrainsState());

  Future<void> getTrains() async {
    final trains = await AppIsarDatabase.getTrains();
    emit(state.copyWith(
      trains: trains.map((e) => TrainState.fromIsarModel(e)).toList()
    ));
  }

  Future<void> addTrain(TrainState train) async {
    await AppIsarDatabase.addTrain(train.toIsarModel());
    await getTrains();
  }
}
