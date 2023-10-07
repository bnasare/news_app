import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/blogs_model.dart';
import 'package:news_app/services/api_call.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          children: [
            ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    radius: 22.0,
                    child: Icon(Icons.person_2),
                  ),
                ),
                trailing: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Theme.of(context).colorScheme.secondary,
                  ),
                  badgeContent: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  position: badges.BadgePosition.topEnd(top: 0, end: 0),
                  child: Icon(
                    Icons.notifications_active,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 30,
                  ),
                ),
                title: Text(
                  'Hello Natasha',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                subtitle: Text(
                  'Welcome back',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                )),
            FutureBuilder<List<BlogsModel>>(
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
                  final blogsList = snapshot.data;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: blogsList!.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: blogsList[index],
                          child: const NewsBlogWidget(),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(
        selectedIndex: 0,
      ),
    );
  }
}
