class OrderReport { // Changed class name to OrderReport
  final User user;
  final List<Report> reports;

  OrderReport({ // Updated constructor
    required this.user,
    required this.reports,
  });

  factory OrderReport.fromJson(Map<String, dynamic> json) { // Updated factory method
    return OrderReport( // Updated class reference
      user: User.fromJson(json['user']), // Parse the user data
      reports: (json['reports'] as List<dynamic>)
          .map((report) => Report.fromJson(report as Map<String, dynamic>))
          .toList(),
    );
  }
}

// User Model
class User {
  final int id;
  final String fName;
  final String lName;
  final String phone;
  final String email;
  final String? image;
  final bool isPhoneVerified;
  final String? emailVerifiedAt;
  final String? emailVerificationToken;
  final String cmFirebaseToken;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;
  final int orderCount;
  final String empId;
  final int departmentId;
  final bool isVeg;
  final bool isSatOpted;
  final String deviceId;
  final bool isInvalidDevice;
  final bool isBreakfast;
  final bool isLunch;
  final bool isDinner;

  User({
    required this.id,
    required this.fName,
    required this.lName,
    required this.phone,
    required this.email,
    this.image,
    required this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    required this.cmFirebaseToken,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.orderCount,
    required this.empId,
    required this.departmentId,
    required this.isVeg,
    required this.isSatOpted,
    required this.deviceId,
    required this.isInvalidDevice,
    required this.isBreakfast,
    required this.isLunch,
    required this.isDinner,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      fName: json['f_name'] ?? '',
      lName: json['l_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? 'assets/profile.png',
      isPhoneVerified: json['is_phone_verified'] == 1,
      emailVerifiedAt: json['email_verified_at'] ?? '',
      emailVerificationToken: json['email_verification_token'] ?? '',
      cmFirebaseToken: json['cm_firebase_token'] ?? '',
      createdAt: _parseDate(json['created_at']),
      updatedAt: _parseDate(json['updated_at']),
      status: json['status'] ?? 0,
      orderCount: json['order_count'] ?? 0,
      empId: json['emp_id'] ?? '',
      departmentId: json['department_id'] ?? 0,
      isVeg: json['is_veg'] == 1,
      isSatOpted: json['is_sat_opted'] == 1,
      deviceId: json['device_id'] ?? '',
      isInvalidDevice: json['is_invalid_device'] == 1,
      isBreakfast: json['is_breakfast'] == 1,
      isLunch: json['is_lunch'] == 1,
      isDinner: json['is_dinner'] == 1,
    );
  }

  // Custom date parsing method
  static DateTime _parseDate(String dateString) {
    List<String> parts = dateString.split('-');
    String year = parts[0];
    String month = parts[1].padLeft(2, '0');
    String day = parts[2].padLeft(2, '0');

    return DateTime.parse('$year-$month-$day');
  }
}

// OptIns Model
class OptIns {
  final String? breakfast;
  final String? lunch;
  final String? dinner;

  OptIns({this.breakfast, this.lunch, this.dinner});

  factory OptIns.fromJson(Map<String, dynamic> json) {
    return OptIns(
      breakfast: json['breakfast'],
      lunch: json['lunch'],
      dinner: json['dinner'],
    );
  }
}

// Report Model
class Report {
  final DateTime date;
  final OptIns optIns;

  Report({required this.date, required this.optIns});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      date: _parseDate(json['date']),
      optIns: json['opt_ins'] is Map<String, dynamic>
          ? OptIns.fromJson(json['opt_ins'])
          : OptIns(), // Empty OptIns if null
    );
  }

  // Custom date parsing method
  static DateTime _parseDate(String dateString) {
    List<String> parts = dateString.split('-');
    String year = parts[0];
    String month = parts[1].padLeft(2, '0');
    String day = parts[2].padLeft(2, '0');

    return DateTime.parse('$year-$month-$day');
  }
}
