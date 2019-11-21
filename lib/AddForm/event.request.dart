import 'package:http/http.dart' as http;

class EventRequests {
  Future addForm(body) async {
    const url = "https://invcom.herokuapp.com/add-event/";
    final response = http.post(url, body: body);
    return response;
  }

  Future getEvents(token) async {
    const url = "https://invcom.herokuapp.com/get-all-events/";
    final response = await http.get(url, headers: {"authorization": token});
    return response;
  }
}
