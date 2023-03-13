class NotificationsModel {
  int? _id;
  String? _title;
  String? _body;
  int? _userId;
  int? _eventId;
  int? _senderId;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;
  String? _profilePhotoPath;

  NotificationsModel(
      {int? id,
      String? title,
      String? body,
      int? userId,
      int? eventId,
      int? senderId,
      String? createdAt,
      String? updatedAt,
      String? firstname,
      String? lastname,
      String? profilePhotoPath}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (body != null) {
      this._body = body;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (eventId != null) {
      this._eventId = eventId;
    }
    if (senderId != null) {
      this._senderId = senderId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (firstname != null) {
      this._firstname = firstname;
    }
    if (lastname != null) {
      this._lastname = lastname;
    }
    if (profilePhotoPath != null) {
      this._profilePhotoPath = profilePhotoPath;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get body => _body;
  set body(String? body) => _body = body;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get eventId => _eventId;
  set eventId(int? eventId) => _eventId = eventId;
  int? get senderId => _senderId;
  set senderId(int? senderId) => _senderId = senderId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get firstname => _firstname;
  set firstname(String? firstname) => _firstname = firstname;
  String? get lastname => _lastname;
  set lastname(String? lastname) => _lastname = lastname;
  String? get profilePhotoPath => _profilePhotoPath;
  set profilePhotoPath(String? profilePhotoPath) =>
      _profilePhotoPath = profilePhotoPath;

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _userId = json['user_id'];
    _eventId = json['event_id'];
    _senderId = json['sender_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _profilePhotoPath = json['profilePhotoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['body'] = this._body;
    data['user_id'] = this._userId;
    data['event_id'] = this._eventId;
    data['sender_id'] = this._senderId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['profilePhotoPath'] = this._profilePhotoPath;
    return data;
  }
}
