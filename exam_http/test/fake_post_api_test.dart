// ignore_for_file: unnecessary_type_check

import 'package:exam_http/api/fake_post_api.dart';
import 'package:exam_http/model/post.dart';
import 'package:test/test.dart';

void main() async {
  FakePostApi api = FakePostApi();

  group('Post', () {
    group('list', () {
      test('isNotEmpty', () {
        Future<List<Post>> future = api.fetchAllPosts();
        future.then((value) {
          expect(value.length, 100);
        });
      });

      test('get lists from the given param', () async {
        Future<List<Post>> future = api.fetchPosts(start: 0, limit: 10);
        future.then((value) {
          expect(value.length, 10);
        });
      });
    });

    group('a Post', () {
      test('isNotNull', () async {
        Future<Post> future = api.getPost(id: 1);
        future.then((value) {
          expect(value.id, 1);
          expect(value.title.length, greaterThan(10));
        });
      });
    });
  });
}
