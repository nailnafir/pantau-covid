part of 'services.dart';

class NewsService {
  static Future<NewsModel> getNews() async {
    final client = http.Client();
    final host = ApiUrl.apiNewsURL;
    final apiKey = '09fc01937b3e4228ba276b655e0a3b67';
    final parameters = {
      'q': 'covid',
      'domains': 'detik.com',
      'apiKey': apiKey,
    };

    var url = Uri.https(host, '/v2/everything', parameters);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return NewsModel.fromJson(data);
    } else {
      throw Exception('Gagal menyambungkan ke server');
    }
  }
}
