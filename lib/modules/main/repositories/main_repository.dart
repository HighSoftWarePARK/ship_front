// part 'home.api.g.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sip_app/constants/path.dart';
import 'package:sip_app/modules/common/models/response_model.dart';
import 'package:sip_app/modules/main/models/main_model.dart';

part 'main_repository.g.dart';

@RestApi()
abstract class MainRepository {
  factory MainRepository(Dio dio, {String? baseUrl}) = _MainRepository;

  @GET('/main')
  Future<ResponseModel<MainModel>> getMainData();
}
