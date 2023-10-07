import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/blogs_model.dart';

class BlogDetailsScreen extends StatelessWidget {
  final BlogsModel blog;

  const BlogDetailsScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Blog Details',
          style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.onSecondary),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.bookmark_add_outlined,
              color: Theme.of(context).colorScheme.onSecondary),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.share,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FancyShimmerImage(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              imageUrl: blog.imageUrl!,
            ),
            const SizedBox(height: 10),
            Text(
              blog.title!,
              style: GoogleFonts.poppins(
                  color: Colors.red, fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
