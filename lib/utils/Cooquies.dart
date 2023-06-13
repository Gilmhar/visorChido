// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class Sesion {
  Map<String, String> headers = {};
  Map<String, String> rheaders = {};
  var statuscod = '';

  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    rheaders = response.headers;
    statuscod = response.statusCode.toString();
    updateCookie(response);
    return response.body;
  }

  Future<dynamic> post(String url, dynamic data) async {
    List<int> bodyBytes = utf8.encode(data);
    headers.addAll({
      'accept': '/',
      'accept-encoding': 'deflate',
      'accept-language': 'es-ES,es;q=0.9,en;q=0.8',
      'cache-control': 'no-cache',
      'content-length': bodyBytes.length.toString(),
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'cookie':
          '_ga=GA1.3.866964031.1640712798; ASP.NET_SessionId=jkdljcdmjx2aqilqi4mhexaz',
      'referer': 'https://verificacfdi.facturaelectronica.sat.gob.mx/',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'
    });
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: headers);
    statuscod = response.statusCode.toString();
    updateCookie(response);
    rheaders = response.headers;
    return response.body;
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'].toString();
    int index = rawCookie.indexOf(';');
    headers['cookie'] =
        (index == -1) ? rawCookie : rawCookie.substring(0, index);
  }
}

class ValidarS {
  Map<String, String> headers = {};
  Map<String, String> rheaders = {};
  var statuscod = '';

  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    rheaders = response.headers;
    statuscod = response.statusCode.toString();
    updateCookie(response);
    return response.body;
  }

  Future<dynamic> post(String url, dynamic post, context) async {
    List<int> bodyBytes = utf8.encode(post);
    headers.addAll({
      'accept': '/',
      'accept-encoding': 'deflate',
      'accept-language': 'es-ES,es;q=0.9,en;q=0.8',
      'cache-control': 'no-cache',
      'content-length': bodyBytes.length.toString(),
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'cookie':
          '_ga=GA1.3.866964031.1640712798; ASP.NET_SessionId=jkdljcdmjx2aqilqi4mhexaz',
      'referer': 'https://verificacfdi.facturaelectronica.sat.gob.mx/',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36'
    });

    http.Response response =
        await http.post(Uri.parse(url), body: post, headers: headers);
    statuscod = response.statusCode.toString();
    updateCookie(response);
    rheaders = response.headers;

    final con = WebViewController()
      ..loadRequest(response.request!.url,
          method: LoadRequestMethod.post,
          headers: response.headers,
          body: response.bodyBytes);

    // final con = WebViewController()
    //   ..loadRequest(
    //     Uri.parse(url),
    //     method: LoadRequestMethod.post,
    //     headers: headers,
    //     body: Uint8List.fromList(utf8.encode(data)));

    return WebViewWidget(controller: con);
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'].toString();
    int index = rawCookie.indexOf(';');
    headers['cookie'] =
        (index == -1) ? rawCookie : rawCookie.substring(0, index);
  }
}
