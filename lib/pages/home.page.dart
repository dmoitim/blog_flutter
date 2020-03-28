import 'package:blog_flutter/models/post.model.dart';
import 'package:blog_flutter/pages/details.page.dart';
import 'package:blog_flutter/repositories/post.repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var repository = new PostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog",
        ),
      ),
      body: FutureBuilder(
          future: repository.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].author.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(tag: posts[index].meta.url),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
