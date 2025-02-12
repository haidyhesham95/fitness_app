import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/networking/error/error_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/response/forget_password_response_entity.dart';

part 'forget_password_view_model_state.dart';

class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {
  ForgetPasswordViewModelCubit() : super(ForgetPasswordViewModelInitial());
}
