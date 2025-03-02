import 'dart:io';

import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/smart_coach_chat/data/data_sources/online_data_source/contract/smart_chat_online_data_source.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/entities/smart_chat_response_entity.dart';
import 'package:fitness_app/features/smart_coach_chat/domain/repositories/smart_chat_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SmartChatRepo)
class SmartChatRepoImpl implements SmartChatRepo {
  final SmartChatOnlineDataSource _dataSource;

  SmartChatRepoImpl(this._dataSource);

  @override
  Stream<DataResult<List<SmartChatResponseEntity>>> fetchSmartChatResponse(
      String prompt, String userImageUrl, File? imageFile) {
    return _dataSource.fetchSmartChatResponse(prompt, userImageUrl, imageFile);
  }
}
