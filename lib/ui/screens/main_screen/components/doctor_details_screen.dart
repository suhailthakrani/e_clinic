import 'dart:convert';
import 'dart:math';

import 'package:e_clinic/controllers/new/doctor_details_screen_controller.dart';
import 'package:e_clinic/controllers/new/main_screen_controller.dart';
import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/ui/screens/messages/chat_screen.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/ratings_card.dart';

class DoctorDetailsScreen extends GetView<DoctorDetailsScreenController> {
  // final int doctorIndex;

  DoctorDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Doctor Details',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.28,
                child: Stack(
                  children: [
                    Align(
                      // alignment: Alignment.topRight-const Alignment(30, 0),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        width: Get.width * 0.6,
                        height: Get.height * 0.28,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, -0.04),
                            end: Alignment(-1, 0.04),
                            colors: [Color(0xFF166EFF), Color(0xFF76AEFA)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.68),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 40,
                      bottom: 0,
                      child: Container(
                        width: Get.width * 0.58,
                        height: Get.height * 0.24,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller.doctor.value.image),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.68),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      "Dr. ${controller.doctor.value.firstName} ${controller.doctor.value.lastName}",
                      style: const TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 16,
                      height: 16,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF09CD09),
                        shape: OvalBorder(),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/images/icons8-verified-48.png'),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    controller.doctor.value.specialization,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating:
                            double.tryParse(controller.doctor.value.rating) ??
                                3.7,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        "  (${controller.doctor.value.reviewsCount}+)",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Chip(
                    avatar: Icon(
                      Icons.call,
                      color: kPrimaryColor,
                    ),
                    label: const Text('Try Call'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(ChatScreen(
                          message: MessageSend(
                            id: controller.doctor.value.id, 
                            participant: Participant(
                              id: '', 
                              firstName: controller.doctor.value.firstName, 
                              lastName: controller.doctor.value.lastName
                              ), 
                            message: ''
                          )
                        )
                      );
                    },
                    child: Chip(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      avatar: Icon(
                        Icons.message_outlined,
                        color: kPrimaryColor,
                      ),
                      label: const Text('Message'),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.call,
              //       color: kPrimaryColor,
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     const Text(
              //       '+44 20 5555 5555',
              //       style: TextStyle(
              //         color: Color(0xFF333333),
              //         fontSize: 16,
              //         fontFamily: 'Poppins',
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),

              Chip(
                avatar: Icon(
                  Icons.mail_outline,
                  color: kPrimaryColor,
                ),
                label: const Text(
                  'mediinfo-tlprt@eclinic.com',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Experience: ',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${Random().nextInt(10) + 1}+ years',
                    style: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
             Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Working Time: ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Monday- Friday : ${controller.doctor.value.workingHours.startTime} - ${controller.doctor.value.workingHours.endTime}',
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
             Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Charges: ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Physical : ${controller.doctor.value.charges.physical} & Online : ${controller.doctor.value.charges.virtual}',
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              GeneralButton(
                onPressed: () {
                  Get.toNamed(kBookAppointmentScreenRoute,
                      arguments: {'dr': controller.doctor.value});
                },
                text: 'Book Appointment',
                color: kPrimaryColor,
                radius: 12,
                margin: 0,
              ),
              const SizedBox(height: 20),
              Text(
                'About Dr. ${controller.doctor.value.firstName} ${controller.doctor.value.lastName} ',
                style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                (controller.doctor.value.about != null &&
                        controller.doctor.value.about!.isNotEmpty)
                    ? "${controller.doctor.value.about}"
                    : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac diam in nisl euismod tempor. Quisque auctor, orci non accumsan volutpat, nisi tellus commodo urna, vel lobortis dui risus vel mauris. Aliquam erat volutpat. Maecenas eu sapien nec felis scelerisque tincidunt ut id nulla. Curabitur nec dolor eu urna congue venenatis. Proin tincidunt ut felis ac fermentum. Vestibulum rhoncus justo nec justo pulvinar, et tincidunt mi facilisis. Integer eget ipsum felis. Fusce vitae feugiat mi, et tristique ipsum. In pellentesque posuere sem, a aliquet ligula cursus nec. Morbi ut quam non urna commodo vulputate vitae a orci. Nam vitae laoreet arcu. Fusce volutpat risus sed massa feugiat, vel tristique urna tristique.",
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Professional Details',
                style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Speciality',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    color: kPrimaryColor,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.doctor.value.specialization,
                        style: const TextStyle(
                          color: Color(0xFF166FFF),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                ' Services',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < 2; i++)
                const Text(
                  'Physical therapy referral for improved mobility and strength',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'Location',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const ListTile(
                leading: Icon(Icons.location_on_outlined),
                title:
                    Text('8016 Rocky River Avenue Vernon Rockville, CT 06066'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Education & Skills',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF166FFF).withAlpha(50),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Color(0xFF166FFF),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                ),
                title: const Text(
                    '8016 Rocky River Avenue Vernon Rockville, CT 06066'),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text(
                  'Client Satisfaction',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Container(
                  width: 270,
                  height: 10,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF166FFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                trailing: const Text(
                  '85%',
                  style: TextStyle(
                    color: Color(0xFF09CD09),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Awards & Certifications',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(CupertinoIcons.archivebox),
                  Text(
                    'Top Doctor Award from Castle Connolly - 2021',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Rating & Reviews',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < ratingsList.length; i++)
                RatingCard(
                  name: ratingsList[i].name,
                  title: ratingsList[i].title,
                  description: ratingsList[i].description,
                  ratings: ratingsList[i].ratings,
                  reviewTime: ratingsList[i].reviewTime,
                  reviewerImageUrl: ratingsList[i].reviewerImageUrl,
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<RatingCard> ratingsList = [
    const RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
    const RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
    const RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
    const RatingCard(
      name: 'Mark R',
      title: 'Excellent care and communication',
      description:
          'Dr. Calger was extremely knowledgeable about my condition and took the time to explain everything to me in a way that I could understand. He was also very patient and empathetic, which made me feel at ease during my appointment. The only downside was that the wait time was a bit long, but the quality of care made up for it.',
      ratings: '4.5',
      reviewTime: 'September 2, 2022, 3:45 pm',
      reviewerImageUrl: "assets/images/commenter.png",
    ),
    const RatingCard(
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
