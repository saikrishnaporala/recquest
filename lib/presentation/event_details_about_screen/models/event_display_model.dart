class EventDisplayModel {
  int? _id;
  String? _title;
  String? _content;
  int? _createdById;
  String? _date;
  String? _status;
  String? _isRead;
  String? _slug;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  double? _longitude;
  double? _latitude;
  String? _venue;
  int? _categoryId;
  String? _categoryName;
  Organizer? _organizer;
  List<Users>? _users;

  eventDsiplayModel(
      {int? id,
      String? title,
      String? content,
      int? createdById,
      String? date,
      String? status,
      String? isRead,
      String? slug,
      String? image,
      String? createdAt,
      String? updatedAt,
      double? longitude,
      double? latitude,
      String? venue,
      int? categoryId,
      String? categoryName,
      Organizer? organizer,
      List<Users>? users}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (content != null) {
      this._content = content;
    }
    if (createdById != null) {
      this._createdById = createdById;
    }
    if (date != null) {
      this._date = date;
    }
    if (status != null) {
      this._status = status;
    }
    if (isRead != null) {
      this._isRead = isRead;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (image != null) {
      this._image = image;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (longitude != null) {
      this._longitude = longitude;
    }
    if (latitude != null) {
      this._latitude = latitude;
    }
    if (venue != null) {
      this._venue = venue;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (categoryName != null) {
      this._categoryName = categoryName;
    }
    if (organizer != null) {
      this._organizer = organizer;
    }
    if (users != null) {
      this._users = users;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get content => _content;
  set content(String? content) => _content = content;
  int? get createdById => _createdById;
  set createdById(int? createdById) => _createdById = createdById;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get isRead => _isRead;
  set isRead(String? isRead) => _isRead = isRead;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  double? get longitude => _longitude;
  set longitude(double? longitude) => _longitude = longitude;
  double? get latitude => _latitude;
  set latitude(double? latitude) => _latitude = latitude;
  String? get venue => _venue;
  set venue(String? venue) => _venue = venue;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get category_name => _categoryName;
  set categoryName(int? categoryId) => _categoryName = category_name;
  Organizer? get organizer => _organizer;
  set organizer(Organizer? organizer) => _organizer = organizer;
  List<Users>? get users => _users;
  set users(List<Users>? users) => _users = users;

  EventDisplayModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _content = json['content'];
    _createdById = json['created_by_id'];
    _date = json['date'];
    _status = json['status'];
    _isRead = json['is_read'];
    _slug = json['slug'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _venue = json['venue'];
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
    _organizer = json['organizer'] != null
        ? new Organizer.fromJson(json['organizer'])
        : null;
    if (json['Users'] != null) {
      _users = <Users>[];
      json['Users'].forEach((v) {
        _users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['content'] = this._content;
    data['created_by_id'] = this._createdById;
    data['date'] = this._date;
    data['status'] = this._status;
    data['is_read'] = this._isRead;
    data['slug'] = this._slug;
    data['image'] = this._image;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    data['venue'] = this._venue;
    data['category_id'] = this._categoryId;
    data['category_name'] = this._categoryName;
    if (this._organizer != null) {
      data['organizer'] = this._organizer!.toJson();
    }
    if (this._users != null) {
      data['Users'] = this._users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizer {
  int? _id;
  String? _firstname;
  String? _lastname;
  String? _email;
  Null? _emailVerifiedAt;
  Null? _twoFactorSecret;
  Null? _twoFactorRecoveryCodes;
  Null? _twoFactorConfirmedAt;
  Null? _currentTeamId;
  Null? _profilePhotoPath;
  String? _createdAt;
  String? _updatedAt;
  Null? _fbId;
  String? _verificationStatus;
  String? _dob;
  String? _gender;
  String? _about;

  Organizer(
      {int? id,
      String? firstname,
      String? lastname,
      String? email,
      Null? emailVerifiedAt,
      Null? twoFactorSecret,
      Null? twoFactorRecoveryCodes,
      Null? twoFactorConfirmedAt,
      Null? currentTeamId,
      Null? profilePhotoPath,
      String? createdAt,
      String? updatedAt,
      Null? fbId,
      String? verificationStatus,
      String? dob,
      String? gender,
      String? about}) {
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
    if (twoFactorSecret != null) {
      this._twoFactorSecret = twoFactorSecret;
    }
    if (twoFactorRecoveryCodes != null) {
      this._twoFactorRecoveryCodes = twoFactorRecoveryCodes;
    }
    if (twoFactorConfirmedAt != null) {
      this._twoFactorConfirmedAt = twoFactorConfirmedAt;
    }
    if (currentTeamId != null) {
      this._currentTeamId = currentTeamId;
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
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get email => _email;
  set email(String? email) => _email = email;
  Null? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(Null? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  Null? get twoFactorSecret => _twoFactorSecret;
  set twoFactorSecret(Null? twoFactorSecret) =>
      _twoFactorSecret = twoFactorSecret;
  Null? get twoFactorRecoveryCodes => _twoFactorRecoveryCodes;
  set twoFactorRecoveryCodes(Null? twoFactorRecoveryCodes) =>
      _twoFactorRecoveryCodes = twoFactorRecoveryCodes;
  Null? get twoFactorConfirmedAt => _twoFactorConfirmedAt;
  set twoFactorConfirmedAt(Null? twoFactorConfirmedAt) =>
      _twoFactorConfirmedAt = twoFactorConfirmedAt;
  Null? get currentTeamId => _currentTeamId;
  set currentTeamId(Null? currentTeamId) => _currentTeamId = currentTeamId;
  Null? get profilePhotoPath => _profilePhotoPath;
  set profilePhotoPath(Null? profilePhotoPath) =>
      _profilePhotoPath = profilePhotoPath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Null? get fbId => _fbId;
  set fbId(Null? fbId) => _fbId = fbId;
  String? get verificationStatus => _verificationStatus;
  set verificationStatus(String? verificationStatus) =>
      _verificationStatus = verificationStatus;
  String? get dob => _dob;
  set dob(String? dob) => _dob = dob;
  String? get gender => _gender;
  set gender(String? gender) => _gender = gender;
  String? get about => _about;
  set about(String? about) => _about = about;

  Organizer.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _twoFactorSecret = json['two_factor_secret'];
    _twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    _twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    _currentTeamId = json['current_team_id'];
    _profilePhotoPath = json['profile_photo_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _fbId = json['fb_id'];
    _verificationStatus = json['verificationStatus'];
    _dob = json['dob'];
    _gender = json['gender'];
    _about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['two_factor_secret'] = this._twoFactorSecret;
    data['two_factor_recovery_codes'] = this._twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this._twoFactorConfirmedAt;
    data['current_team_id'] = this._currentTeamId;
    data['profile_photo_path'] = this._profilePhotoPath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['fb_id'] = this._fbId;
    data['verificationStatus'] = this._verificationStatus;
    data['dob'] = this._dob;
    data['gender'] = this._gender;
    data['about'] = this._about;
    return data;
  }
}

class Users {
  int? _id;
  int? _userId;
  int? _eventId;
  String? _status;
  int? _invitedBy;
  String? _createdAt;
  String? _updatedAt;

  Users(
      {int? id,
      int? userId,
      int? eventId,
      String? status,
      int? invitedBy,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (eventId != null) {
      this._eventId = eventId;
    }
    if (status != null) {
      this._status = status;
    }
    if (invitedBy != null) {
      this._invitedBy = invitedBy;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get eventId => _eventId;
  set eventId(int? eventId) => _eventId = eventId;
  String? get status => _status;
  set status(String? status) => _status = status;
  int? get invitedBy => _invitedBy;
  set invitedBy(int? invitedBy) => _invitedBy = invitedBy;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Users.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _eventId = json['event_id'];
    _status = json['status'];
    _invitedBy = json['invited_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['event_id'] = this._eventId;
    data['status'] = this._status;
    data['invited_by'] = this._invitedBy;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
