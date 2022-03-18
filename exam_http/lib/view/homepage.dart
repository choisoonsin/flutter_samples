import 'package:exam_http/api/fake_post_api.dart';
import 'package:exam_http/model/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.fakePostApi}) : super(key: key);

  final FakePostApi fakePostApi;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder'),
        centerTitle: true,
      ),
      body: _FetchAllPosts(context),
    );
  }

  Widget _FetchAllPosts(context) {
    return FutureBuilder(
        future: widget.fakePostApi.fetchAllPosts(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('No data found'),
            );
          }

          if (snapshot.hasData) {
            List<Post> _posts = snapshot.data as List<Post>;
            return ListView.separated(
                itemCount: _posts.length,
                itemBuilder: ((context, index) {
                  Post _post = _posts[index];
                  return ListTile(
                    title: Text(
                      _post.title,
                      maxLines: 1,
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                    subtitle: Text(_post.body, maxLines: 2),
                    trailing: _ShowBottomSheet(context, post: _post),
                  );
                }),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 0.3,
                    ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }

  Widget _ShowBottomSheet(context, {required Post post}) {
    return GestureDetector(
        onTap: () {
          Scaffold.of(context).showBottomSheet<void>((context) {
            return Card(
              color: Colors.amberAccent,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.close),
                          onTap: () => Navigator.pop(context),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Post id: ${post.id}'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Post Id: ${post.userId}')
                      ],
                    ),
                    ListTile(
                      title: Text(
                        post.title,
                        maxLines: 1,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                      subtitle: Text(post.body, maxLines: 2),
                    ),
                  ],
                ),
              ),
            );
          });
        },
        child: const Icon(Icons.search));
  }
}
