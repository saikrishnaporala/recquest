class MyProfileModel {
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _emailVerifiedAt;
  String? _password;
  String? _twoFactorSecret;
  String? _twoFactorRecoveryCodes;
  String? _twoFactorConfirmedAt;
  String? _rememberToken;
  String? _providerId;
  String? _profilePhotoPath;
  String? _createdAt;
  String? _updatedAt;
  String? _fbId;
  String? _verificationStatus;
  String? _dob;
  String? _gender;
  String? _about;
  String? _mobile;
  String? _uid;
  String? _token;
  String? _emailVerified;
  double? _latitude;
  double? _longitude;

  MyProfileModel(
      {int? id,
      String? firstname,
      String? lastname,
      String? email,
      String? emailVerifiedAt,
      String? password,
      String? twoFactorSecret,
      String? twoFactorRecoveryCodes,
      String? twoFactorConfirmedAt,
      String? rememberToken,
      String? providerId,
      String? profilePhotoPath,
      String? createdAt,
      String? updatedAt,
      String? fbId,
      String? verificationStatus,
      String? dob,
      String? gender,
      String? about,
      String? mobile,
      String? uid,
      String? token,
      String? emailVerified,
      double? latitude,
      double? longitude}) {
    if (id != null) {
      this._id = id;
    }
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
    if (email != null) {
      this._email = email;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (password != null) {
      this._password = password;
    }
    if (twoFactorSecret != null) {
      this._twoFactorSecret = twoFactorSecret;
    }
    if (twoFactorRecoveryCodes != null) {
      this._twoFactorRecoveryCodes = twoFactorRecoveryCodes;
    }
    if (twoFactorConfirmedAt != null) {
      this._twoFactorConfirmedAt = twoFactorConfirmedAt;
    }
    if (rememberToken != null) {
      this._rememberToken = rememberToken;
    }
    if (providerId != null) {
      this._providerId = providerId;
    }
    if (profilePhotoPath != null) {
      this._profilePhotoPath = profilePhotoPath;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (fbId != null) {
      this._fbId = fbId;
    }
    if (verificationStatus != null) {
      this._verificationStatus = verificationStatus;
    }
    if (dob != null) {
      this._dob = dob;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (about != null) {
      this._about = about;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (uid != null) {
      this._uid = uid;
    }
    if (token != null) {
      this._token = token;
    }
    if (emailVerified != null) {
      this._emailVerified = emailVerified;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get twoFactorSecret => _twoFactorSecret;
  set twoFactorSecret(String? twoFactorSecret) =>
      _twoFactorSecret = twoFactorSecret;
  String? get twoFactorRecoveryCodes => _twoFactorRecoveryCodes;
  set twoFactorRecoveryCodes(String? twoFactorRecoveryCodes) =>
      _twoFactorRecoveryCodes = twoFactorRecoveryCodes;
  String? get twoFactorConfirmedAt => _twoFactorConfirmedAt;
  set twoFactorConfirmedAt(String? twoFactorConfirmedAt) =>
      _twoFactorConfirmedAt = twoFactorConfirmedAt;
  String? get rememberToken => _rememberToken;
  set rememberToken(String? rememberToken) => _rememberToken = rememberToken;
  String? get providerId => _providerId;
  set providerId(String? providerId) => _providerId = providerId;
  String? get profilePhotoPath => _profilePhotoPath;
  set profilePhotoPath(String? profilePhotoPath) =>
      _profilePhotoPath = profilePhotoPath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get fbId => _fbId;
  set fbId(String? fbId) => _fbId = fbId;
  String? get verificationStatus => _verificationStatus;
  set verificationStatus(String? verificationStatus) =>
      _verificationStatus = verificationStatus;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get about => _about;
  set about(String? about) => _about = about;
  String? get mobile => _mobile;
  set mobile(String? mobile) => _mobile = mobile;
  String? get uid => _uid;
  set uid(String? uid) => _uid = uid;
  String? get token => _token;
  set token(String? token) => _token = token;
  String? get emailVerified => _emailVerified;
  set emailVerified(String? emailVerified) => _emailVerified = emailVerified;
  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _twoFactorSecret = json['two_factor_secret'];
    _twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    _twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    _rememberToken = json['remember_token'];
    _providerId = json['providerId'];
    _profilePhotoPath = json['profile_photo_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _fbId = json['fb_id'];
    _verificationStatus = json['verificationStatus'];
    _dob = json['dob'];
    _gender = json['gender'];
    _about = json['about'];
    _mobile = json['mobile'];
    _uid = json['uid'];
    _token = json['token'];
    _emailVerified = json['emailVerified'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['password'] = this._password;
    data['two_factor_secret'] = this._twoFactorSecret;
    data['two_factor_recovery_codes'] = this._twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this._twoFactorConfirmedAt;
    data['remember_token'] = this._rememberToken;
    data['providerId'] = this._providerId;
    data['profile_photo_path'] = this._profilePhotoPath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['fb_id'] = this._fbId;
    data['verificationStatus'] = this._verificationStatus;
    data['dob'] = this._dob;
    data['gender'] = this._gender;
    data['about'] = this._about;
    data['mobile'] = this._mobile;
    data['uid'] = this._uid;
    data['token'] = this._token;
    data['emailVerified'] = this._emailVerified;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    return data;
  }
}
