import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/presentation/pages/home_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomAppBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(10)),
      child: BottomAppBar(
        height: 70,
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //! Home Tab
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    IconlyBold.home,
                    color: selectedIndex == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.tertiary,
                    size: 30.0,
                  ),
                  onPressed: () {
                    if (selectedIndex != 0) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                ),
                if (selectedIndex == 0)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),

            //! Bookmark Tab
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    IconlyLight.bookmark,
                    color: selectedIndex == 2
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.tertiary,
                    size: 30.0,
                  ),
                  onPressed: () {
                    if (selectedIndex != 2) {}
                  },
                ),
                if (selectedIndex == 2)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),

            //! Profile Tab
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    IconlyLight.profile,
                    color: selectedIndex == 3
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.tertiary,
                    size: 30.0,
                  ),
                  onPressed: () {
                    if (selectedIndex != 3) {}
                  },
                ),
                if (selectedIndex == 3)
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
