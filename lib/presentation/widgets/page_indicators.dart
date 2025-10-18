import 'package:flutter/material.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color activeColor;
  final Color inactiveColor;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.activeColor = Colors.pinkAccent,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: currentPage == index ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
