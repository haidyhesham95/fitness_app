import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_view_model_state.dart';

class ActivityViewModelCubit extends Cubit<ActivityViewModelState> {
  ActivityViewModelCubit() : super(ActivityViewModelInitial());
}
