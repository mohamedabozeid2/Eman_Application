import 'package:eman_application/core/api/eman_dio_helper.dart';
import 'package:eman_application/core/api/end_points.dart';
import 'package:eman_application/core/error/exception.dart';
import 'package:eman_application/core/network/eman_error_message_model.dart';
import 'package:eman_application/features/data/models/quran_model.dart';

abstract class BaseEmanRemoteDataSource {
  Future<QuranModel> getQuran();
}

class EmanRemoteDataSource extends BaseEmanRemoteDataSource {
  @override
  Future<QuranModel> getQuran() async {
    final response = await EmanDioHelper.getData(url: EndPoints.quran);
    if (response.statusCode == 200) {
      return QuranModel.fromJson(response.data);
    } else {
      throw EmanServerException(
        emanErrorMessageModel: EmanErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
