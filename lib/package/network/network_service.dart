import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:go_india/package/common/common.dart';
import 'package:http/http.dart' as http;
import 'network_failure.dart';

class NetworkService {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling

  Future<Either<NetworkFailure, T>> get<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) return left(failure);

      var data = jsonDecode(response.body);

      final xFailure = _handleStatusCode(int.tryParse(data['status']) ?? 200);
      if (xFailure != null) return left(xFailure);
      return right(data);
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> put<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.put(uri); // TODO: add other parameter later;
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> post<T>(
    String url,
    Map<String, String> body,
  ) async {
    try {
      var uri = Uri.parse(url);
      uri.log();
      body.log();
      var response = await http.post(uri, body: body);
      log(response.body);

      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) return left(failure);

      var data = jsonDecode(response.body);

      final xFailure = _handleStatusCode(int.tryParse(data['status']) ?? 200);
      if (xFailure != null) return left(xFailure);

      return right(data);
    } catch (ex) {
      ex.log();
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> delete<T>(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.delete(uri);
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> getRequest<T>(
      String url, Map<String, String> header) async {
    Map<String, String> headers = header;
    try {
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) return left(failure);
      var data = await response.stream.bytesToString();
      return right(jsonDecode(data));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  Future<Either<NetworkFailure, T>> postRequest<T>(
      String uri, Map<String, String> data, Map<String, dynamic> images) async {
    var url = Uri.parse(uri);


    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(data);
    late Future<http.MultipartFile> image;
'${request.url} $data $images'.log();
    for (int i = 0; i < images.length; i++) {
      var key = images.keys.toList();
      var value = images.values.toList();
      image = http.MultipartFile.fromPath(key[i], value[i]);
      request.files.add(await image);
    }

    // images.forEach(
    //     (key, value) async => image = http.MultipartFile.fromPath(key, value));
    // request.files.add(await image);

    try {
      http.StreamedResponse response = await request.send();
      final failure = _handleStatusCode(response.statusCode);
      if (failure != null) return left(failure);
      var data = await response.stream.bytesToString();
      data.log();
      return right(jsonDecode(data));
    } catch (ex) {
      ex.log();
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  NetworkFailure? _handleStatusCode(int code) {
    switch (code) {
      case 400:
        return NetworkFailure(error: 'Bad Request');
      case 401:
        return NetworkFailure(error: 'Unauthorized');
      case 403:
        return NetworkFailure(error: 'Forbidden');
      case 404:
        return NetworkFailure(error: 'Not Found');
      case 500:
        return NetworkFailure(error: 'Internal Server Error');
      // Add more cases as needed
      default:
        return null;
    }
  }
}
