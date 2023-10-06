import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsBlogWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const NewsBlogWidget(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {},
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
                imageUrl: imageUrl,
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
                    title,
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
    );
  }
}
