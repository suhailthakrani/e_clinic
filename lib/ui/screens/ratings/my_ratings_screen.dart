import '../../../ui/screens/ratings/components/ratings_card.dart';
import '../../../ui/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/my_ratings_screen_controller.dart';

class RatingsScreen extends GetView<RatingsController> {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      screenName: 'My Ratings',
      className: runtimeType.toString(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (int i = 0; i < controller.ratingsList.length; i++)
              RatingCard(
                name: controller.ratingsList[i].name,
                title: controller.ratingsList[i].title,
                description: controller.ratingsList[i].description,
                ratings: controller.ratingsList[i].ratings,
                reviewTime: controller.ratingsList[i].reviewTime,
                reviewerImageUrl: controller.ratingsList[i].reviewerImageUrl,
              ),
          ],
        ),
      ),
    );
  }
}
