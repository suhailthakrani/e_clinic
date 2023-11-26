
const String kBaseURL = "http://api.eclinic.live/api/"; // BASE URL

const String drId = 'acaba9ed-e9cd-4eef-9fbe-8fe1afd46c40';


const String kLoginURL = "${kBaseURL}auth/signin/";
const String kRegisterURL = "${kBaseURL}patients/register/";

// Charges/Payment
const String kAddChargesURL = "${kBaseURL}doctors/charges/";
const String kUpdateChargesURL = "${kBaseURL}doctors/charges/";

// About Doctors

const String kGetDoctorsURL = "${kBaseURL}doctors";
const String kGetDoctorByIdURL = "${kBaseURL}doctors/";
const String kDoctorsSpeializationURL = "${kBaseURL}doctors/specializations/";
const String kGetDoctorScheduleURL = "${kBaseURL}doctors/$drId/schedule/"; 
const String kGetDoctorTimeSlotURL = "${kBaseURL}doctors/$drId/timeSlots/";

//Appointments
const String kGetAppointmentsURL = "${kBaseURL}appointments/patient";
// const String kGetAppointmentRequestsURL = "${kBaseURL}appointments/requests";
// const String kGetCompletedAppointmentsURL = "${kBaseURL}appointments/completed/";

const String kAcceptAppointmentURL = "${kBaseURL}appointments/requests/accept";
const String kRejectAppointmentURL = "${kBaseURL}appointments/requests/reject";

const String kBookAppointmentURL = "${kBaseURL}appointments/create/";


const String kAddPrescriptionURL = "${kBaseURL}prescription/";

//Patient

const String kGetTestsURL = "${kBaseURL}patients/tests/"; 
const String kGetReportsURL = "${kBaseURL}patients/reports/";
const String kBookTestURL = "${kBaseURL}lab/test/"; 
const String kGetMeURL = "${kBaseURL}auth/me/";

//Lab

const String kLabGetTestsURL = "${kBaseURL}lab/tests/"; 
const String kLabGetReportsURL = "${kBaseURL}lab/reports/";
const String kLabGetLabURL = "${kBaseURL}lab/"; // Paameters= lab?q=sah
const String kAddReportToLabURL = "${kBaseURL}lab/report"; //lab/report/c2079050-66b6-4efe-9c9e-ab397b110d0b