import 'package:exam_http/model/post.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class FakePostApi {
  static const String baseUri = 'jsonplaceholder.typicode.com';

  List<Post> success({required http.Response res}) {
    if (res.statusCode == 200) {
      return (convert.jsonDecode(res.body) as List<dynamic>)
          .map((e) => Post.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<Post>> fetchAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));

    var reqUri = Uri.https(baseUri, '/posts');

    return await http.get(reqUri).then((res) => success(res: res)).onError(
        (error, stackTrace) =>
            throw Exception('error fetchAllPosts ${error.toString()}'));
  }

  Future<List<Post>> fetchPosts({int? start = 0, int? limit = 10}) async {
    var reqUri = Uri.https(baseUri, '/posts',
        <String, String>{'_start': '$start', '_limit': '$limit'});

    return await http.get(reqUri).then((res) => success(res: res)).onError(
        (error, stackTrace) => throw Exception('error fetchAllPosts4Dynamic'));
  }

  Future<Post> getPost({required int id}) async {
    var reqUri = Uri.https(baseUri, '/posts/$id');

    var res = await http.get(reqUri);

    if (res.statusCode == 200) {
      return Post.fromJson(convert.jsonDecode(res.body));
    } else {
      throw Exception('error fetchAllPosts4Dynamic');
    }
  }
}
