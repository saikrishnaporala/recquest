class PhotoItem {
  String? _image;
  String? _name;
  bool? _isSelected;

  PhotoItem({String? image, String? name, bool? isSelected}) {
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (isSelected != null) {
      this._isSelected = isSelected;
    }
  }

  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  bool? get isSelected => _isSelected;
  set isSelected(bool? isSelected) => _isSelected = isSelected;

  PhotoItem.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _name = json['name'];
    _isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['name'] = this._name;
    data['isSelected'] = this._isSelected;
    return data;
  }
}
