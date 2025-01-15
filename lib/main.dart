import 'package:box_king_proj/bloc/train_cubit.dart';
import 'package:box_king_proj/bloc/trains_cubit.dart';
import 'package:box_king_proj/pages/menu_page.dart';
import 'package:box_king_proj/storages/isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIsarDatabase.init();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TrainsCubit()),
          BlocProvider(create: (context) => TrainCubit())
        ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TrainsCubit>().getTrains();
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MenuPage(),
      ),
    );
  }
}
