import 'package:flutter/material.dart';

class BadgesGrid extends StatelessWidget {
  const BadgesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,  
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BadgeTile extends StatelessWidget {
  final String? imagePath;

  const BadgeTile({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: imagePath != null
            ? Image.asset(
                imagePath!,
                fit: BoxFit.contain,
              )
            : Center(
                child: Icon(
                  Icons.lock,
                  size: 32,
                  color: Colors.grey.withAlpha(127),
                ),
              ),
      ),
    );
  }
}