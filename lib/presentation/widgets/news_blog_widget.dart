import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/blogs_model.dart';
import 'package:provider/provider.dart';

import '../pages/blog_details.dart';

class NewsBlogWidget extends StatelessWidget {
  const NewsBlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsModel blogsModelProvider = Provider.of<BlogsModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailsScreen(blog: blogsModelProvider),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FancyShimmerImage(
                  imageUrl: blogsModelProvider.imageUrl!,
                  boxFit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.transparent,
                    child: Text(
                      blogsModelProvider.title.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
