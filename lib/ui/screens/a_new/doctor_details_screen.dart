import 'package:e_clinic/controllers/a_new/doctor_list_controller.dart';
import 'package:e_clinic/ui/widgets/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../widgets/ratings_card.dart';

class DoctorDetailsScreen extends GetView<DoctorsListController> {
  // final int doctorIndex;

  const DoctorDetailsScreen({
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
        child: Column(
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
                        image: const DecorationImage(
                          image: AssetImage('assets/images/personal_info.png'),
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
                  const Text(
                    'Dr. Beckett Calger',
                    style: TextStyle(
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
                const Text(
                  'Rheumatologist',
                  style: TextStyle(
                    color: Color(0xFF166FFF),
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
                    for (int i = 0; i < 5; i++)
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFE606),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0.80,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      '(155+)',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Poppins',
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
            const Row(
              children: [
                Icon(Icons.call),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '+ (123) 1800-567',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Icon(Icons.mail),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'mediinfo-tlprt@eclinic.com',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience:',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '6+ years',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Working Time:',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Monday- Friday : 8:00 a.m - 7:00 p.m',
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GeneralButton(
              onPressed: () {},
              text: 'Book Appointment',
              color: kPrimaryColor,
              margin: 0,
            ),
            const SizedBox(height: 20),
            const Text(
              'About Dr. Beckett Calger ',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dr. Backett Calger is a skilled and compassionate rheumatologist who has been providing exceptional care to patients for many years. With extensive experience in the diagnosis and treatment of rheumatic diseases, Dr. Calger is committed to helping patients manage their conditions and improve their quality of life.',
              style: TextStyle(
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
                color: Color(0xFF333333),
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
                height: 0.07,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.star_border),
                Text(
                  'Rheumatologist',
                  style: TextStyle(
                    color: Color(0xFF166FFF),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                )
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
              title: Text('8016 Rocky River Avenue Vernon Rockville, CT 06066'),
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
              title: Text(
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
                  color: Color(0xFF166FFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              trailing: Text(
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
            Row(
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
