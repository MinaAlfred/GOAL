import 'package:goal/Data_access_layer/base_url.dart';
import 'package:http/http.dart' as http;

class GetMatchesApi {
  /// get all matches of english premier league from api function:
  Future<String> getMatches() async {
    http.Response response = await http.get(
      Uri.parse(ApiUrl.apiUrl + 'competitions/PL/matches'),
      headers: {
        "Accept": "application/json",
        "X-Auth-Token": '79fda176dd744ec9bc3019df7bd95b23'
      },
    );
    return response.body;
  }
}
