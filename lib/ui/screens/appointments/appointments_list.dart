
import '../../../utils/app_enum.dart';
import 'components/appointment_card.dart';
import 'components/previous_appointment_card.dart';
import 'components/upcoming_appointment_card.dart';

List<AppointmentCard> upComingAppointments = [
  AppointmentCard(
    drName: "Mary Freund",
    category: "General Checkup",
    image: "assets/images/doctor.png",
    status: AppointmentStatus.pending,
  ),
  AppointmentCard(
    drName: "Kathy Pacheco",
    category: "Pyscology",
    image: "assets/images/doctor.png",
    status: AppointmentStatus.pending,
  ),
];
List<AppointmentCard> previousAppointments = [
  AppointmentCard(
    drName: "Rhonda Rhodes",
    category: "Emergency",
    image: "assets/images/doctor.png",
    status: AppointmentStatus.completed,
  ),
  AppointmentCard(
    drName: "Rodger Struck",
    category: "Diet Plan",
    image: "assets/images/doctor.png",
    status: AppointmentStatus.cancelled,
  ),
  AppointmentCard(
    drName: "Rodger Struck",
    category: "Carminology",
    image: "assets/images/doctor.png",
    status: AppointmentStatus.completed,
  ),
];
