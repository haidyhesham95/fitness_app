import 'package:fitness_app/fitness_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/abb_bloc_observer.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper().instantiatePreferences();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(
    FitnessApp(),
  );
}
