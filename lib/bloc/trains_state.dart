part of 'trains_cubit.dart';

class TrainsState extends Equatable{

  const TrainsState({
    this.trains = const [],
  });

  final List<TrainState> trains;

  @override
  // TODO: implement props
  List<Object?> get props => [trains];

  TrainsState copyWith({
    List<TrainState>? trains,
  }) {
    return TrainsState(
      trains: trains ?? this.trains
    );
  }

}
