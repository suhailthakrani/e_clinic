import '../../utils/colors.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final String ratings;
  final String reviewTime;
  final String reviewerImageUrl;
  const RatingCard(
      {super.key,
      required this.name,
      required this.title,
      required this.description,
      required this.ratings,
      required this.reviewTime,
      required this.reviewerImageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          reviewerImageUrl,
          width: 64,
          height: 64,
        ),
        Column(
          children: [
            SizedBox(height: 4),
            Text(
              '"$title"',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text("by $name.",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(reviewTime,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(height: 4),
            Text("'$description'",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                " Reply",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
