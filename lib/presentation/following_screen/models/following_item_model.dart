class FollowingItemModel {
  int? _id;
  int? _eventId;
  int? _userId;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;
  String? _profilePhotoPath;

  FollowingItemModel(
      {int? id,
      int? eventId,
      int? userId,
      String? createdAt,
      String? updatedAt,
      String? firstname,
      String? lastname,
      String? profilePhotoPath}) {
    if (id != null) {
      this._id = id;
    }
    if (eventId != null) {
      this._eventId = eventId;
    }
    if (userId != null) {
      this._userId = userId;
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
  int? get eventId => _eventId;
  set eventId(int? eventId) => _eventId = eventId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
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

  FollowingItemModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _eventId = json['event_id'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _profilePhotoPath = json['profilePhotoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['event_id'] = this._eventId;
    data['user_id'] = this._userId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    data['profilePhotoPath'] = this._profilePhotoPath;
    return data;
  }
}
