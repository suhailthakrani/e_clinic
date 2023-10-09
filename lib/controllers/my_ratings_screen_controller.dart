import '../ui/screens/ratings/components/ratings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<RatingCard> ratingsList = [
    RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
     RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
     RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
     RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
     RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    )
  ];
}
