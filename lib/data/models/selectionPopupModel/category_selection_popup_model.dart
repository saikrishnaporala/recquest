///SelectionPopupModel is common model
///used for setting data into dropdowns
class CategorySelectionPopupModel {
  // int? id;
  // String title;
  // dynamic value;
  // bool isSelected;

  // SelectionPopupModel({
  //   this.id,
  //   required this.title,
  //   this.value,
  //   this.isSelected = false,
  // });

  int? _id;
  String? _name;
  String? _slug;
  String? _status;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  CategorySelectionPopupModel(
      {int? id,
      String? name,
      String? slug,
      String? status,
      String? image,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (status != null) {
      this._status = status;
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
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  CategorySelectionPopupModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _status = json['status'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['status'] = this._status;
    data['image'] = this._image;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
