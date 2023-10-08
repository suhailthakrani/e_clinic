
const String kBaseURL = "https://api.eclinic.live/api/"; // BASE URL

const String drId = 'acaba9ed-e9cd-4eef-9fbe-8fe1afd46c40';


const String kLoginURL = "${kBaseURL}auth/signin/";
const String kRegisterURL = "${kBaseURL}doctors/register/";

//Availability
const String kAddScheduleURL = "${kBaseURL}doctors/schedule/";
const String kUpdateScheduleURL = "${kBaseURL}doctors/schedule/";

// Charges/Payment
const String kAddChargesURL = "${kBaseURL}doctors/charges/";
const String kUpdateChargesURL = "${kBaseURL}doctors/charges/";

// About Doctors

const String kGetDoctorsURL = "${kBaseURL}doctors/";
const String kGetDoctorByIdURL = "${kBaseURL}doctors/";
const String kDoctorsSpeializationURL = "${kBaseURL}doctors/specializations/";
const String kGetDoctorScheduleURL = "${kBaseURL}doctors/$drId/schedule/"; 
const String kGetDoctorTimeSlotURL = "${kBaseURL}doctors/$drId/timeSlots/";

//Appointments
const String kGetAppointmentsURL = "${kBaseURL}appointments/";
const String kGetAppointmentRequestsURL = "${kBaseURL}appointments/requests";
const String kGetCompletedAppointmentsURL = "${kBaseURL}appointments/completed/";

const String kAcceptAppointmentURL = "${kBaseURL}appointments/requests/accept";
const String kRejectAppointmentURL = "${kBaseURL}appointments/requests/reject";

const String kAddPrescriptionURL = "${kBaseURL}prescription/";



