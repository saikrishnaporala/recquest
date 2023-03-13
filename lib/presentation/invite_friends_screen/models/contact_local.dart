class ContactLocal {
  final String name;
  String phoneNumber;
  bool isSelected;

  ContactLocal(this.name, this.phoneNumber, this.isSelected);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSelected'] = this.isSelected;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
