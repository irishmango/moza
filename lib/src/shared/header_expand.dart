import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class HeaderExpand extends StatelessWidget {
  final Widget? path;
  final String title;
  final bool isExpanded;
  final VoidCallback? toggleExpand; // Optional
  

  const HeaderExpand({
    this.path,
    required this.title,
    this.isExpanded = false,
    this.toggleExpand,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: toggleExpand ?? () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => path!),
            );
          },
          child: Row(
            children: [
              Text(
                isExpanded ? "See Less" : "See All",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appGreen,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_outward,
                color: AppColors.appGreen,
                size: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}