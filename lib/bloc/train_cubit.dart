import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:box_king_proj/storages/models/train.dart';

part 'train_state.dart';

class TrainCubit extends Cubit<TrainState> {
  TrainCubit({TrainState? train}) : super(train ?? const TrainState());

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }

  void updateType(String value) {
    emit(state.copyWith(type: value));
  }

  void updateDate(DateTime value) {
    emit(state.copyWith(date: value));
  }

  void updateDuration(DateTime value) {
    emit(state.copyWith(duration: value));
  }

  void clearData() {
    emit(const TrainState(
      id: null,
      name: '',
      type: '',
      date: null,
      duration: null,
    ));
  }
}
