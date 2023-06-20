import 'package:login_test/data/model/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepository {
  Future<Result<User, Exception>> login(
      {required String username, required String password});
}
