import 'package:http/http.dart' as http;

abstract class IClient {
    String url = 'https://l0me52wcld.execute-api.us-east-1.amazonaws.com/dev';

    http.Client client = http.Client();

    Uri resolveUrl(String path) => Uri.parse('$url/$path');
}
