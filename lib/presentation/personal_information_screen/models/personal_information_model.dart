import 'package:get/get.dart';
import 'package:recquest_21/data/models/selectionPopupModel/selection_popup_model.dart';

class PersonalInformationModel {
  DateTime selectedYyyymmddTxt = DateTime.now();

  Rx<String> dob = Rx("lbl_yyyy_mm_dd".tr);

  RxList<SelectionPopupModel> dropdownItemList = [
    SelectionPopupModel(
      id: 1,
      title: "Male",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Female",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Others",
    )
  ].obs;
}
