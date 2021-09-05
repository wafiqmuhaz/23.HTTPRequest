import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class postResult {
  late String id;
  late String name;
  late String job;
  late String created;

  postResult(
      {required this.id,
      required this.name,
      required this.job,
      required this.created});

  factory postResult.createpostResult(Map<String, dynamic> object) {
    return postResult(
      id: object["id"],
      name: object["name"],
      job: object["job"],
      created: object["createdAt"],
    );
  }

  static Future<postResult> connectKeAPI(String name, String job) async {
    String apiURL = "https://reqres.in/";

    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);

    return postResult.createpostResult(jsonObject);
  }
}
