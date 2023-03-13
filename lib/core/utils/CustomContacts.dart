import 'package:fast_contacts/src/model/contact.dart';

class CustomContacts {
  // CustomContacts(Contact e, bool bool);
  final Contact contact;
  bool isChecked;

  CustomContacts({
    required this.contact,
    this.isChecked = false,
  });
}
