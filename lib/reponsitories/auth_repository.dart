import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';
import '../providers/api_provider.dart';

class AuthRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  final GetStorage _storage = GetStorage();

  Future<User?> login(String username, String password) async {
    try {
      print('Attempting login for username: $username');
      final response = await _apiProvider.post('login', {
        'username': username,
        'password': password,
      });

      print('Response received: $response');

      if (response != null && response['access_token'] != null) {
        print('Token received: ${response['access_token']}');

        // Lưu token
        _storage.write('access_token', response['access_token']);

        print('User data: ${response['user']}');

        // Kiểm tra cấu trúc dữ liệu
        if (response['user'] is! Map<String, dynamic>) {
          print(
              'ERROR: User data is not a Map: ${response['user'].runtimeType}');
          return null;
        }

        // Tạo đối tượng user
        var users = User.fromJson(response['user']);

        // Xử lý roles
        if (response['roles'] != null) {
          print('Roles data: ${response['roles']}');
          if (response['roles'] is List) {
            users.roles = List<String>.from(response['roles']);
          } else {
            print(
                'WARNING: Roles is not a List: ${response['roles'].runtimeType}');
            users.roles = [];
          }
        }

        // Convert to JSON
        var userJson = users.toJson();
        print('User JSON to save: $userJson');

        // Lưu thông tin user
        _storage.write('user', userJson);

        return users;
      }
      print('Login failed: token not found in response');
      return null;
    } catch (e) {
      print('Login error: $e');
      print('Stack trace: ${StackTrace.current}');
      return null;
    }
  }

  Future<bool> logout() async {
    try {
      await _apiProvider.post('logout', {});
      // Xóa token và thông tin người dùng
      _storage.remove('access_token');
      _storage.remove('user');
      return true;
    } catch (e) {
      print('Logout error: $e');
      // Xóa token và thông tin người dùng ngay cả khi API lỗi
      _storage.remove('access_token');
      _storage.remove('user');
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    // Kiểm tra xem có token không
    String? token = _storage.read('access_token');
    if (token == null) {
      return null;
    }

    // Kiểm tra thông tin user trong storage
    try {
      var userData = _storage.read('user');
      if (userData != null) {
        if (userData is Map<String, dynamic>) {
          return User.fromJson(userData);
        } else {
          print('ERROR: userData is not a Map: ${userData.runtimeType}');
        }
      }
    } catch (e) {
      print('Error reading user from storage: $e');
    }

    // Nếu không có trong storage, thử lấy từ API
    try {
      final response = await _apiProvider.get('user');
      if (response != null && response['user'] != null) {
        var users = User.fromJson(response['user']);
        if (response['roles'] != null) {
          users.roles = List<String>.from(response['roles']);
        }

        _storage.write('user', users.toJson());
        return users;
      }
      return null;
    } catch (e) {
      print('Get current user error: $e');
      return null;
    }
  }

  bool isLoggedIn() {
    return _storage.read('access_token') != null;
  }
}
