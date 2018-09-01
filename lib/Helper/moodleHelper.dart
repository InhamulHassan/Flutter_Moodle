import 'package:http/http.dart' show get;

class MoodleHelper {
  final String moodleHost = "http://109.169.41.112/webservice.php";

  login(String username, String password) {
    String url =
        moodleHost + "?method=login&user_name=$username&password=$password";
    fetchData(url);
  }

  fetchData(String url) async {
    var result = await get(url);
    print(result);
  }
}
