part of 'train_cubit.dart';

class TrainState extends Equatable{

  const TrainState({
    this.id,
    this.name = '',
    this.type = '',
    this.date,
    this.duration,
  });

  final int? id;
  final String name;
  final String type;
  final DateTime? date;
  final DateTime? duration;

  factory TrainState.fromIsarModel(Train train) {
    return TrainState(
      id: train.id,
      name: train.name ?? '',
      type: train.type ?? '',
      date: train.date,
      duration: train.duration,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, type, date, duration];

  TrainState copyWith({
    int? id,
    String? name,
    String? type,
    DateTime? date,
    DateTime? duration
  }) {
    return TrainState(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      date: date ?? this.date,
      duration: duration ?? this.duration,
    );
  }

  Train toIsarModel() {
    return Train()
        ..name = name
        ..type = type
        ..date = date
        ..duration = duration;
  }
}

