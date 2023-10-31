import 'package:e_clinic/models/doctor_model.dart';
import 'package:e_clinic/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSearchDelegate extends SearchDelegate {
  final List<Doctor> doctorsList;
  final String value;

  DoctorSearchDelegate(this.doctorsList, this.value);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Doctor> filteredDoctors = doctorsList
        .where((doctor) =>
            doctor.firstName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          minLeadingWidth: 70,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(54),
            child: Image.network(
              filteredDoctors[index].image,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (context, child, loadingProgress) =>const CircleAvatar(radius: 36),
            ),
          ),
          title: Text("Dr. ${filteredDoctors[index].firstName}"),
          subtitle: Text(filteredDoctors[index].specialization),
          onTap: () {
            Get.toNamed(kDoctorsDetailsScreenRoute, arguments: {
              "dotor": filteredDoctors[index],
            });
          },
        );
      },
    );
  }
}
