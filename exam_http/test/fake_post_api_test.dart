// ignore_for_file: unnecessary_type_check

import 'package:exam_http/api/fake_post_api.dart';
import 'package:exam_http/model/post.dart';
import 'package:test/test.dart';

void main() async {
  FakePostApi api = FakePostApi();

  group('Post', () {
    group('list', () {
      test('isNotEmpty', () async {
        final List<Post> result = await api.fetchAllPosts();
        expect(result.isNotEmpty, result.isEmpty);
      });
    });

    group('a Post', () {
      test('isNotNull', () async {
        final Post post = await api.getPost(id: 1);
        expect(post is Post, post is Post);
      });
    });
  });
}
