class APIEndpoint {
  // static String get baseUrl => 'localhost:7084';
  static String get baseUrl => '192.168.0.110:7084';
  // ---------------- Authorization --------------------
  //+++++++++++LOGIN++++++++++++++++++++
  static const loginUrl = '/api/Auth/Login';
  static const signup = '/api/Auth/SignupUser';
  static const signupAdmin = '/api/Auth/SignupAdmin';
  static const forgotPassword = '/api/Auth/Forgot-Password';

  //+++++++++++STUDENT++++++++++++++++++

  static const getAllStudents = '/api/Student/GetAll';
  static const getStudentById = '/api/Student/GetById';
  static const addStudent = '/api/Student/add';
  static const updateStudent = '/api/Student/UpdateStudent';
  static const deleteStudent = '/api/Student/Delete';
  static const searchByName = '/api/Student/SearchByName';
  static const searchByFatherName = '/api/Student/SearchByFatherName';
  static const searchByGRNum = '/api/Student/SearchByGrNum';
  static const toggleFreezeStatus = '/api/Student/ToggleStatus';
  static const toggleCountUrl = '/api/Student/ToggleStatusCount';

  //+++++++++++TEACHER++++++++++++++++++

  static const getAllTeacher = '/api/Teacher/GetAll';
  static const getTeacherById = '/api/Teacher/GetById';
  static const addTeacher = '/api/Teacher/add';
  static const deleteTeacher = '/api/Teacher/Delete';
  static const updateTeacher = '/api/Teacher/Add';
  static const searchTeacherUrl = '/api/Teacher/SearchByName';

//+++++++++++FEES++++++++++++++++++
  static const getFeesById = '/api/Fees/GetById';
  static const createFeesChallan = '/api/Fees/Create/Update';

//+++++++++++CLASS++++++++++++++++++
  static const getClassListUrl = '/api/Class/GetAll';
  static const addClassUrl = '/api/Class/Add';
  static const deleteClassUrl = '/api/Class/Delete';
}
