import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:recquest_21/widgets/MapWidget.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'controller/create_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_drop_down.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateEventsScreen extends GetWidget<CreateEventsController> {
  GlobalKey<FormState> createEventKey = GlobalKey<FormState>();
  CameraPosition? cameraPosition;

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  @override
  Widget build(BuildContext context) {
    controller.eventnametextController.text = 'Event 0123';
    controller.eventlocationtextController.text = "RT Nagar";
    controller.inputController.text = "About the event";
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray10001,
            appBar: CustomAppBar(
                height: getVerticalSize(50.00),
                leadingWidth: 32,
                leading: AppbarImage(
                    height: getSize(16.00),
                    width: getSize(16.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 15, bottom: 15),
                    onTap: onTapArrowleft),
                title: AppbarSubtitle(
                    text: "New Event", margin: getMargin(left: 16)),
                styleType: Style.bgFillWhiteA700),
            // title: Padding(
            //     padding: getPadding(left: 20),
            //     child: Text("lbl_new_event".tr,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.left,
            //         style: AppStyle.txtNotoSansBold24
            //             .copyWith(height: getVerticalSize(1.00)))),
            // actions: [
            //   AppbarImage(
            //       height: getSize(40.00),
            //       width: getSize(40.00),
            //       svgPath: ImageConstant.imgFloatingicon,
            //       margin: getMargin(right: 10, top: 10, bottom: 10),
            //       onTap: onTapNotifications)
            // ],
            // styleType: Style.bgFillBluegray90002),
            // CustomAppBar(
            //     height: getVerticalSize(60.00),
            //     leadingWidth: 59,
            //     leading: AppbarCircleimage(
            //         imagePath: ImageConstant.imageNotFound,
            //         margin: getMargin(left: 19, top: 10, bottom: 10)),
            //     title: Padding(
            //         padding: getPadding(left: 20),
            //         child: Text("lbl_new_event".tr,
            //             overflow: TextOverflow.ellipsis,
            //             textAlign: TextAlign.left,
            //             style: AppStyle.txtNotoSansBold24
            //                 .copyWith(height: getVerticalSize(1.00)))),
            //     styleType: Style.bgFillBluegray90002),
            body: Form(
                key: createEventKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 16, top: 15, right: 16, bottom: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("lbl_event_name".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16
                                  .copyWith(height: getVerticalSize(1.00))),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.eventnametextController,
                              hintText: "lbl_event_name".tr,
                              margin: getMargin(top: 5),
                              shape: TextFormFieldShape.RoundedBorder6,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("lbl_event_category".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.00)))),
                          Obx(() => CustomDropDown(
                                width: 355,
                                focusNode: FocusNode(),
                                icon: Container(
                                    margin: getMargin(left: 30, right: 18),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowdown)),
                                hintText: "lbl_category".tr,
                                margin: getMargin(top: 5),
                                items: controller
                                    .createEventsModelObj.value.categoryList,
                                onChanged: (value) {
                                  controller.onSelected(value);
                                },
                              )),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_event_location".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.00)))),
                          GestureDetector(
                              onTap: () {
                                onTapChooseLocation(context);
                              },
                              child: Container(
                                  margin: getMargin(top: 5),
                                  padding: getPadding(left: 0, right: 14),
                                  decoration: AppDecoration.outlineBlack90007
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder6),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              getPadding(left: 2, bottom: 1),
                                          child: CustomTextFormField(
                                              width: 280,
                                              focusNode: FocusNode(),
                                              controller: controller
                                                  .eventlocationtextController,
                                              hintText: "lbl_event_location".tr,
                                              margin: getMargin(top: 5),
                                              shape: TextFormFieldShape
                                                  .RoundedBorder6),
                                        ),
                                        Icon(Icons.location_searching),
                                      ]))),
                          Padding(
                              padding: getPadding(top: 9),
                              child: Text("msg_event_date_time".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.00)))),
                          GestureDetector(
                              onTap: () {
                                onTapRoweventdatetimeone(context);
                              },
                              child: Container(
                                  margin: getMargin(top: 5),
                                  padding: getPadding(
                                      left: 14, top: 13, right: 14, bottom: 13),
                                  decoration: AppDecoration.outlineBlack90007
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder6),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(left: 2, bottom: 1),
                                            child: Obx(() => Text(
                                                controller
                                                    .createEventsModelObj
                                                    .value
                                                    .eventDateTimeOneTxt
                                                    .value,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNotoSansRegular12
                                                    .copyWith(
                                                        height: getVerticalSize(
                                                            1.00),),),),),
                                        Icon(Icons.date_range_rounded),
                                      ],),),),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("lbl_about".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.00)))),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.inputController,
                              hintText: "lbl_about".tr,
                              margin: getMargin(top: 5),
                              variant: TextFormFieldVariant.OutlineBlack90007_1,
                              shape: TextFormFieldShape.RoundedBorder6,
                              fontStyle:
                                  TextFormFieldFontStyle.AsapRomanRegular14,
                              textInputAction: TextInputAction.done,
                              maxLines: 5),
                          CustomButton(
                              height: 49,
                              width: 355,
                              text: "lbl_submit".tr,
                              margin: getMargin(top: 10, bottom: 5),
                              shape: ButtonShape.RoundedBorder10,
                              padding: ButtonPadding.PaddingAll9,
                              fontStyle: ButtonFontStyle.NotoSansSemiBold18,
                              onTap: onTapCreateEvent)
                        ])))));
  }

  Future<void> onTapRoweventdatetimeone(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2050),
    );
    final f = new DateFormat('MM-dd-yyyy hh:mm a');
    if (date != null) {
      TimeOfDay? time = await showTimePicker(
          context: Get.context!,
          initialTime: controller
              .createEventsModelObj.value.selectedEventDateTimeOneTxt);
      if (time != null) {
        controller.createEventsModelObj.value.eventDateTimeOneTxt.value =
            f.format(DateTime.parse(
                date.toLocal().toString().split(" ")[0].toString()));
      }
    }
  }

  onTapCreateEvent() async {
    try {
      APIHandler apiClient = APIHandler();
      String address = controller.eventlocationtextController.toString();
      LatLng coordinates =
          await BackgroundController.instance.getCoordinates(address);
      print(coordinates.latitude); // 37.4219999
      print(coordinates.longitude); // -122.0840575
      dynamic eventObj = {
        'title': controller.eventnametextController.text,
        'content': controller.inputController.text,
        'date': controller.createEventsModelObj.value.eventDateTimeOneTxt.value,
        'status': 'enabled',
        'venue': controller.eventlocationtextController.text,
        'is_read': 'no',
        'latitude': coordinates.latitude,
        'longitude': coordinates.longitude,
        'category_id': controller.selectedDropDownValue?.id
      };
      print(eventObj);
      dynamic response = await apiClient.post('/saveEvent',
          data: eventObj, isAuthenticated: true);

      dynamic resondeData = response.data;
      print(resondeData);
      Get.snackbar(
        'Success',
        resondeData['message'],
        backgroundColor: Colors.pink[900],
      );
      Get.toNamed(AppRoutes.mainhomePage);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapMyProfile() {
    Get.toNamed(AppRoutes.myProfileScreen);
  }

  onTapNotifications() {
    Get.toNamed(AppRoutes.notificationsListScreen);
  }

  void onTapChooseLocation(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Color.fromARGB(31, 218, 218, 218)
          .withOpacity(0.6), // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Column(
          children: <Widget>[
            Expanded(
              // flex: 5,
              child: Stack(
                children: [
                  GoogleMap(
                    //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      //innital position in map
                      target: LatLng(
                          BackgroundController.instance.latitude,
                          BackgroundController
                              .instance.longitude), //initial position
                      zoom: 17.0, //initial zoom level
                    ),
                    mapType: MapType.normal, //map type
                    onCameraMove: (CameraPosition cameraPositiona) async {
                      cameraPosition = cameraPositiona; //when map is dragging
                      List<Placemark> place = await placemarkFromCoordinates(
                          cameraPosition!.target.latitude,
                          cameraPosition!.target.longitude);
                      final coordinates = new Coordinates(
                          cameraPosition!.target.latitude,
                          cameraPosition!.target.longitude);
                      var addresses = await Geocoder.local
                          .findAddressesFromCoordinates(coordinates);
                      print(addresses);
                      controller.updateLocation('${addresses[1].addressLine}');
                    },
                    onCameraIdle: () async {
                      //when map drag stops
                      List<Placemark> place = await placemarkFromCoordinates(
                          cameraPosition!.target.latitude,
                          cameraPosition!.target.longitude);
                      final coordinates = new Coordinates(
                          cameraPosition!.target.latitude,
                          cameraPosition!.target.longitude);
                      var addresses = await Geocoder.local
                          .findAddressesFromCoordinates(coordinates);
                      print(addresses);
                      controller.updateLocation('${addresses[1].addressLine}');
                    },
                  ),
                  Center(
                    //picker image on google map
                    child: Image.asset(
                      "assets/images/picker.png",
                      width: 30,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Obx(() => controller.location.value != ""
                          ? Text(controller.location.value,
                              style: AppStyle.txtNotoSansMedium16)
                          : Text("Address",
                              style: AppStyle.txtNotoSansMedium16)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // This will evenly distribute the buttons within the row
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Dismiss'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.eventlocationtextController.text = controller.location.toString();
                    print(cameraPosition?.target.latitude);
                    print(cameraPosition?.target.longitude);
                    Navigator.pop(context);
                  },
                  child: Text('Confirm'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  onTapArrowleft() {
    Get.back();
  }
}
