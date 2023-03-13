class EventReviewItemModel {
  int? _id;
  String? _reviewmessage;
  String? _reviewdate;
  int? _rate;
  int? _eventId;
  int? _userId;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;

  EventReviewItemModel(
      {int? id,
      String? reviewmessage,
      String? reviewdate,
      int? rate,
      int? eventId,
      int? userId,
      String? createdAt,
      String? updatedAt,
      String? firstname,
      String? lastname}) {
    if (id != null) {
      this._id = id;
    }
    if (reviewmessage != null) {
      this._reviewmessage = reviewmessage;
    }
    if (reviewdate != null) {
      this._reviewdate = reviewdate;
    }
    if (rate != null) {
      this._rate = rate;
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
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get reviewmessage => _reviewmessage;
  set reviewmessage(String? reviewmessage) => _reviewmessage = reviewmessage;
  String? get reviewdate => _reviewdate;
  set reviewdate(String? reviewdate) => _reviewdate = reviewdate;
  int? get rate => _rate;
  set rate(int? rate) => _rate = rate;
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

  EventReviewItemModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _reviewmessage = json['reviewmessage'];
    _reviewdate = json['reviewdate'];
    _rate = json['rate'];
    _eventId = json['event_id'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['reviewmessage'] = this._reviewmessage;
    data['reviewdate'] = this._reviewdate;
    data['rate'] = this._rate;
    data['event_id'] = this._eventId;
    data['user_id'] = this._userId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['firstname'] = this._firstname;
    data['lastname'] = this._lastname;
    return data;
  }
}
