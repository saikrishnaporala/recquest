import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/presentation/invite_friends_screen/models/contact_local.dart';

class InviteFriendsController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ContactLocal> contacts1 = <ContactLocal>[].obs;
  var selectionCount = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    _loadContacts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  Future<void> _loadContacts() async {
    Set<String> phones = Set<String>();
    final permissionStatus = await Permission.contacts.status;
    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> iterable = await ContactsService.getContacts();
      iterable.toList().forEach((contactData) {
        if (contactData.phones!.length > 0) {
          contactData.phones!.forEach((contactPhone) {
            String name = contactPhone.value.toString();
            if (!phones.contains(name)) {
              phones.add(name);
              contacts1.add(ContactLocal(contactData.displayName.toString(),
                contactPhone.value.toString(), false));
            }
            
          });
        }
      });
      print(contacts1);
    } else if (permissionStatus.isDenied) {
      await Permission.contacts.request();
      await _loadContacts();
    } else {
      // Permission is permanently denied, take users to app settings
      openAppSettings();
    }
  }

  // Future<void> sendMessage(
  //     List<Contact> selectedContacts, String message) async {
  //   for (final contact in selectedContacts) {
  //     final isSent =
  //         await sendSMS(message: message, recipients: [contact.phones]);
  //     if (isSent) {
  //       print('Message sent to ${contact.displayName}');
  //     } else {
  //       print('Failed to send message to ${contact.displayName}');
  //     }
  //   }
  // }
}
