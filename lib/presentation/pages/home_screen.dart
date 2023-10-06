import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/models/blogs_model.dart';
import 'package:news_app/services/api_call.dart';

import '../widgets/bottom_app_bar.dart';
import '../widgets/news_blog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<BlogsModel>> getNews() async {
    return await APICall.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: FutureBuilder<List<BlogsModel>>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: [
                  Container(
                    color: Colors.transparent,
                  ),
                  Center(
                    child: SpinKitFadingCube(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No blogs available.'));
            } else {
              // Use snapshot.data to access the list of blogs
              final blogsList = snapshot.data;

              return ListView.builder(
                itemCount: blogsList!.length,
                itemBuilder: (context, index) {
                  return NewsBlogWidget(
                    imageUrl: blogsList[index].imageUrl.toString(),
                    title: blogsList[index].title.toString(),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 0,
      ),
    );
  }
}
