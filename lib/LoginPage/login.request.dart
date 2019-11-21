import 'package:http/http.dart' as http;

class LoginRequest {
  Future login(body) async {
    const url = "https://invcom.herokuapp.com/log-in/";
    final response = http.post(url, body: body);
    return response;
  }
}
