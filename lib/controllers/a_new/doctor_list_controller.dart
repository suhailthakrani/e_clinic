import 'package:get/get.dart';

import '../../ui/widgets/ratings_card.dart';

class DoctorsListController extends GetxController {
  final doctors = <Doctor>[
    Doctor(name: 'Dr. John Doe', specialization: 'Cardiologist'),
    Doctor(name: 'Dr. Jane Smith', specialization: 'Dermatologist'),
    // Add more doctors as needed
  ].obs;

  RxInt selectedIndex = 0.obs;
  List<Doctor> get getDoctors => doctors;


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

class Doctor {
  final String name;
  final String specialization;

  Doctor({required this.name, required this.specialization});

  
}