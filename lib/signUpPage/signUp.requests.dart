import 'package:http/http.dart' as http;

class SignUpRequests {
  Future signUP(body) async {
    const url = "https://invcom.herokuapp.com/create-user/";
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      return "success";
    } else {
      throw Exception("failed");
    }
  }
}
