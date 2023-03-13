import 'dart:developer';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/utils/app_util.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'package:recquest_21/presentation/event_details_about_screen/widgets/flashsale_item_widget.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/event_details_about_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailsAboutScreen extends GetWidget<EventDetailsAboutController> {
  dynamic argData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    final LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return SafeArea(
      child: Scaffold(
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
                text: argData.title, margin: getMargin(left: 16)),
            styleType: Style.bgFillWhiteA700),
        body: Container(
          // width: size.width,
          padding: getPadding(left: 10, top: 10, right: 10, bottom: 10),
          decoration: AppDecoration.fillWhiteA700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  argData.organizer.profilePhotoPath != null
                      ? AppbarCircleimage(
                          imagePath: argData.organizer.profilePhotoPath,
                          margin: getMargin(left: 23, top: 10, bottom: 10),
                          onTap: () {
                            onTapOrgProfile(argData.organizer.id);
                          })
                      : Container(
                          margin: getMargin(left: 10, top: 10, bottom: 10),
                          child: CustomImageView(
                              imagePath: ImageConstant.userIcon,
                              height: getSize(50.00),
                              width: getSize(50.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(54.00)),
                              onTap: () {
                                onTapOrgProfile(argData.organizer.id);
                              }),
                        ),
                  Padding(
                    padding: getPadding(left: 20, top: 3, bottom: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            StringUtils.capitalize(argData.organizer.firstname +
                                " " +
                                StringUtils.capitalize(
                                    argData.organizer.lastname)),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansSemiBold18
                                .copyWith(height: getVerticalSize(1.19))),
                        Text("Organizer",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansRegular12
                                .copyWith(height: getVerticalSize(1.00)))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: getPadding(top: 5),
                child: Container(
                  width: getHorizontalSize(345.00),
                  margin: getMargin(top: 5, bottom: 5),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: argData.content,
                          style: TextStyle(
                            color: ColorConstant.black900,
                            fontSize: getFontSize(14),
                            fontFamily: 'Noto Sans',
                            fontWeight: FontWeight.w400,
                            height: getVerticalSize(1.19),
                          ),
                        ),
                      ]),
                      textAlign: TextAlign.left),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 0,
                  top: 10,
                ),
                child: Container(
                  height: 150.0,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(argData.latitude, argData.longitude),
                      zoom: 17.0,
                    ),
                    markers: Set<Marker>.of([
                      Marker(
                        markerId: MarkerId(argData.title),
                        position: LatLng(argData.latitude, argData.longitude),
                        infoWindow: InfoWindow(title: argData.title),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapCategoryName();
                      },
                      child: Container(
                        margin: getMargin(
                          top: 5,
                          bottom: 5,
                        ),
                        padding: getPadding(
                          left: 10,
                          top: 5,
                          right: 10,
                          bottom: 5,
                        ),
                        decoration: AppDecoration.txtFillAmber70026.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder10,
                        ),
                        child: Text(
                            StringUtils.capitalize(argData.category_name),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            DateFormat.yMMMd().format(
                                DateTime.parse(argData.date.toString())),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16
                                .copyWith(height: getVerticalSize(0.91))),
                        Text(
                            DateFormat.jm().format(
                                DateTime.parse(argData.date.toString())),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16
                                .copyWith(height: getVerticalSize(1.00))),
                        // FileImage(File(controller.items[index].image)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTapVenue();
                },
                child: Padding(
                  padding: getPadding(
                    left: 3,
                  ),
                  child: Text(StringUtils.capitalize(argData.venue.toString()),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNotoSansMedium16),
                ),
              ),
              Padding(
                padding: getPadding(left: 0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            onTapInvite();
                            // onTapShare(context);
                          },
                          // alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 44,
                            height: 44,
                            margin: getMargin(
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(Icons.share),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _getFromCamera();
                          },
                          // alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 44,
                            height: 44,
                            margin: getMargin(
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(Icons.photo_camera),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapFollowers();
                          },
                          // alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 44,
                            height: 44,
                            margin: getMargin(
                              right: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(Icons.verified_user),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            allImages();
                          },
                          // alignment: AlignmentDirectional(0, 0),
                          child: Container(
                              margin: getMargin(
                                right: 15,
                              ),
                              padding: getPadding(all: 10),
                              decoration: BoxDecoration(
                                  color: Colors.pink[900],
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              alignment: AlignmentDirectional(0, 0),
                              child: Text("All Images",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16W)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 0.0),
                  color: ColorConstant.whiteA700,
                  height: 20.0,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              color: ColorConstant.whiteA700,
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width - 280,
                              // height: MediaQuery.of(context).size.height,
                              height: 10.0,
                              child: Image.file(
                                  File(controller.items[index].image)),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RouteTwo(
                                      image: controller.items[index].image,
                                      name: controller.items[index].name),
                                ),
                              );
                            });
                        // ),);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapInvite() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('eventId', argData.id.toString());
    prefs.setString('eventSlug', argData.slug.toString());
    Get.toNamed(AppRoutes.inviteFriendsScreen, arguments: argData);
  }

  onTapShare(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: getPadding(all: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        GridTile(
                            child: GestureDetector(
                          onTap: () {
                            whatsappShare();
                          },
                          child: CustomIconButton(
                              height: 40,
                              width: 40,
                              margin: getMargin(right: 20),
                              variant: IconButtonVariant.OutlineBlue70033,
                              shape: IconButtonShape.RoundedBorder12,
                              padding: IconButtonPadding.PaddingAll9,
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgFacebookWhiteA700)),
                        )),
                        GridTile(
                            child: GestureDetector(
                          onTap: () {
                            whatsappShare();
                          },
                          child: CustomIconButton(
                              height: 40,
                              width: 40,
                              margin: getMargin(right: 20),
                              variant: IconButtonVariant.OutlineGreen50033_1,
                              shape: IconButtonShape.RoundedBorder12,
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgCallGray5002)),
                        )),
                        GridTile(
                            child: GestureDetector(
                          onTap: () {
                            sendMessageLink();
                          },
                          child: CustomIconButton(
                              height: 40,
                              width: 40,
                              margin: getMargin(right: 20),
                              variant: IconButtonVariant.OutlineGreenA70033,
                              shape: IconButtonShape.RoundedBorder12,
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgVolumeWhiteA70040x40)),
                        )),
                        GridTile(
                            child: GestureDetector(
                          onTap: () {
                            onTapBtnTwitter();
                          },
                          child: CustomIconButton(
                              height: 40,
                              width: 40,
                              margin: getMargin(right: 20),
                              variant: IconButtonVariant.OutlineLightblue50033,
                              shape: IconButtonShape.RoundedBorder12,
                              padding: IconButtonPadding.PaddingAll9,
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgTwitter)),
                        )),
                      ])
                    ]))
          ]);
        });
  }

  onTapFollowers() {
    Get.toNamed(AppRoutes.followingScreen, arguments: argData);
  }

  getPictures() {
    return FlashsaleItemWidget(
      folderPath: argData.slug,
      filesList: controller.listofFiles(),
    );
  }

  onTapArrowleft() {
    Get.back();
  }

  onTapCategoryName() {
    Get.toNamed(AppRoutes.eventsScreen);
  }

  onTapVenue() {
    Get.toNamed(AppRoutes.mapViewScreen);
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      controller.imageFile.value = File(pickedFile.path);

      if (pickedFile != null && pickedFile.path != null) {
        String folderInAppDocDir =
            await AppUtil.createFolderInAppDocDir(argData.id);
        print(folderInAppDocDir);
      }
    }
  }

  // Get from camera
  _getFromCamera() async {
    if (await isNearby(argData.latitude, argData.longitude)) {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        print(pickedFile.path);
        controller.imageFile.value = File(pickedFile.path);
        String path =
            await AppUtil.createFolderInAppDocDir(argData.slug.toString());
        print(path);

        // Step 1: Retrieve image from picker
        final File image = File(pickedFile.path);

        // Step 2: Check for valid file
        if (image == null) return;

        // Step 3: Get directory where we can duplicate selected file.
        // final String path = await getApplicationDocumentsDirectory().path;

        // Step 4: Copy the file to a application document directory.
        var fileName = controller.getFileName(pickedFile.path);
        print(fileName);
        File localImage = await image.copy('$path$fileName');
        print(localImage);
        PhotoItem pi = new PhotoItem();
        pi.image = localImage.path;
        pi.name = fileName;
        controller.items.add(pi);
        controller.eventDetailsAboutModelObj.value.photoItemList.add(pi);
      }
    } else {
      Get.snackbar('Error', "Your location if far from the event");
    }
  }

  Future<bool> isNearby(double lat, double long) async {
    // Get your current location
    Position position = await Geolocator.getCurrentPosition();
    // Create a new position object for the given latitude and longitude
    // Position target = Position(latitude: lat, longitude: long);
    // Calculate the distance between the two locations in meters
    double distance = await Geolocator.distanceBetween(
        position.latitude, position.longitude, lat, long);
    // Convert the distance to miles
    double distanceInMiles = distance / 1609.34;
    // Check if the distance is less than or equal to one mile
    if (distanceInMiles <= 1) {
      return true;
    } else {
      return false;
    }
  }

  void whatsappShare() {}

  void sendMessageLink() {}

  void onTapBtnTwitter() {}

  void addReview(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
                padding: getPadding(all: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Review",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16)),
                      CustomTextFormField(
                          width: 355,
                          controller: controller.reviewMessage,
                          focusNode: FocusNode(),
                          hintText: "Review Message",
                          margin: getMargin(top: 5),
                          variant: TextFormFieldVariant.OutlineBlack90007,
                          fontStyle: TextFormFieldFontStyle
                              .NotoSansRegular14Bluegray900b2,
                          textInputAction: TextInputAction.done,
                          maxLines: 4),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("Rating",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16)),
                      CustomTextFormField(
                        width: 355,
                        focusNode: FocusNode(),
                        controller: controller.rating,
                        hintText: "Rating(1,2,3,4,5)",
                        margin: getMargin(top: 5),
                        variant: TextFormFieldVariant.OutlineBlack90007,
                        fontStyle: TextFormFieldFontStyle
                            .NotoSansRegular14Bluegray900b2,
                        textInputAction: TextInputAction.done,
                      ),
                      CustomButton(
                          height: 49,
                          width: 350,
                          text: "lbl_done2".tr,
                          margin: getMargin(top: 10, bottom: 5),
                          shape: ButtonShape.RoundedBorder10,
                          padding: ButtonPadding.PaddingAll9,
                          fontStyle: ButtonFontStyle.NotoSansSemiBold18,
                          onTap: onSubmitReview(context))
                    ]))
          ]);
        });
  }

  onSubmitReview(context) async {
    try {
      APIHandler apiClient = APIHandler();
      DateTime today = DateTime.now();
      String dateStr = "${today.day}/${today.month}/${today.year}";
      dynamic reviewDataObj = {
        'reviewmessage': controller.reviewMessage.text,
        'rate': controller.rating.text,
        "reviewdate": dateStr,
        "event_id": argData.id,
      };

      dynamic response = await apiClient.post('/saveReview',
          data: reviewDataObj, isAuthenticated: true);

      dynamic responseData = response.data;

      if (responseData['message'] == 201) {
        controller.reviewMessage.text = "";
        controller.rating.text = "";
        Get.snackbar('Success', responseData['message']);
        Navigator.pop(context);
      } else {
        Get.snackbar('Error', "Failed to submit, try again");
      }
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapProduct() {
    Get.toNamed(AppRoutes.picturesScreen);
  }

  void allImages() {
    controller.listofFiles().then((snapshot) {
      print(snapshot);
      Get.toNamed(AppRoutes.picturesScreen, arguments: [
        {"folderPath": argData.slug},
        {"title": argData.title},
        {"imageList": snapshot.toList()},
        {"event_id": argData.id},
      ]);
    });
  }

  // Check contacts permission
  // Future<PermissionStatus> _getPermission() async {
  //   final PermissionStatus permission = await Permission.contacts.status;
  //   if (permission != PermissionStatus.granted &&
  //       permission != PermissionStatus.denied) {
  //     final Map<Permission, PermissionStatus> permissionStatus =
  //         await [Permission.contacts].request();
  //     return permissionStatus[Permission.contacts] ??
  //         PermissionStatus.undetermined;
  //   } else {
  //     return permission;
  //   }
  // }

  onTapMyProfile() {
    Get.toNamed(AppRoutes.myProfileScreen);
  }

  onTapOrgProfile(id) async {
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/userById/$id', isAuthenticated: true);

      MyProfileModel orgDisplayModel = MyProfileModel.fromJson(response.data);
      print(orgDisplayModel);
      Get.toNamed(AppRoutes.organizerProfileAboutScreen,
          arguments: orgDisplayModel);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      // isDataLoading;
    }
  }
}

class RouteTwo extends StatelessWidget {
  final String image;
  final String name;

  RouteTwo({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: FileImage(File(image)),
                // image: file(image),
              ),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(20.0),
          //   child: Center(
          //     child: Text(
          //       name,
          //       style: TextStyle(fontSize: 40),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
