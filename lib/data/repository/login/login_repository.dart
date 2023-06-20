import 'package:login_test/data/model/user_model.dart';
import 'package:login_test/data/provider/login/i_login_provider.dart';
import 'package:multiple_result/multiple_result.dart';

import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  ILoginProvider iLoginProvider;
  LoginRepository({required this.iLoginProvider});
  @override
  Future<Result<User, Exception>> login(
      {required String username, required String password}) async {
    final result =
        await iLoginProvider.login(username: username, password: password);
    if (result.data['d']['Status'] == 200) {
      if (result.statusCode == 200) {
        return Success(UserModel.fromMap(result.data).d.user);
      } else {
        return Error(Exception("Error"));
      }
    } else {
      return Error(Exception("Error"));
    }
  }
}
