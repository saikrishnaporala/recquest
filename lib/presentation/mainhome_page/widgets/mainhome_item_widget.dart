import 'dart:developer';

import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/event_display_model.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:recquest_21/widgets/custom_button.dart';

import '../models/mainhome_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class MainhomeItemWidget extends StatelessWidget {
  const MainhomeItemWidget({Key? key, required this.eventList})
      : super(key: key);
  final Future<List<MainhomeItemModel>> eventList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: eventList,
      builder: (BuildContext context,
          AsyncSnapshot<List<MainhomeItemModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<MainhomeItemModel> events = snapshot.data ?? [];
          if (events.length > 0) {
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      left: 16,
                      top: 9,
                      right: 16,
                      bottom: 9,
                    ),
                    margin: getMargin(left: 10, right: 10, bottom: 5, top: 5),
                    decoration: AppDecoration.outlineGray30002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 7,
                          ),
                          child: Row(
                            children: [
                              // CustomImageView(
                              //   imagePath: ImageConstant.imageNotFound,
                              //   height: getSize(
                              //     50,
                              //   ),
                              //   width: getSize(
                              //     50,
                              //   ),
                              //   radius: BorderRadius.circular(
                              //     getHorizontalSize(
                              //       25,
                              //     ),
                              //   ),
                              // ),
                              Container(
                                  margin: getMargin(
                                    left: 0,
                                    top: 0,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            openIndividualEvent(
                                                events[index].id.toString());
                                          },
                                          child: Container(
                                            child: Text(
                                                events[index].title.toString(),
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNotoSansSemiBold18),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 1,
                                            top: 6,
                                          ),
                                          child: events[index].venue == null
                                              ? Text(
                                                  StringUtils.capitalize(
                                                      "No Venue"),
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtNotoSansMedium16,
                                                )
                                              : Row(
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLocationBlack90001,
                                                      height: getVerticalSize(
                                                        15.00,
                                                      ),
                                                      width: getHorizontalSize(
                                                        15.00,
                                                      ),
                                                      margin: getMargin(
                                                        top: 2,
                                                        bottom: 2,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        onTapVenue();
                                                      },
                                                      child: Container(
                                                        child: Padding(
                                                            padding: getPadding(
                                                              right: 3,
                                                            ),
                                                            child: Text(
                                                              StringUtils.capitalize(
                                                                  events[index]
                                                                      .venue
                                                                      .toString()),
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtNotoSansMedium16,
                                                            )),
                                                      ),
                                                      // child: Padding(
                                                      //   padding: getPadding(
                                                      //     left: 3,
                                                      //   ),
                                                      //   child: Text(
                                                      //       StringUtils.capitalize(
                                                      //           mainhomeItemModelObj.venue.toString()),
                                                      //       overflow: TextOverflow.ellipsis,
                                                      //       textAlign: TextAlign.left,
                                                      //       style: AppStyle.txtNotoSansSemiBold14Gray600),
                                                      // ),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ])),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 11,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    0), //apply padding to all four sides
                                child: Text(
                                    DateFormat.yMMMd().format(DateTime.parse(
                                        events[index].date.toString())),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansSemiBold12),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15), //apply padding to all four sides
                                child: Text(
                                    DateFormat.jm().format(DateTime.parse(
                                        events[index].date.toString())),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansSemiBold12),
                              ),
                              Spacer(),
                              Padding(
                                  padding: getPadding(
                                    left: 16,
                                  ),
                                  child: BackgroundController
                                              .instance.uid.value ==
                                          events[index].createdById
                                      ? Padding(
                                          padding: getPadding(top: 0, right: 0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.account_circle,
                                                  size: 24,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              ]))
                                      : null),
                              Padding(
                                padding: getPadding(
                                  left: 16,
                                ),
                                child: BackgroundController
                                            .instance.uid.value ==
                                        events[index].createdById
                                    ? Padding(
                                        padding: getPadding(top: 0, right: 0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite,
                                                size: 24,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ]))
                                    : null,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(
                            top: 10,
                          ),
                          padding: getPadding(
                            left: 10,
                            top: 5,
                            right: 10,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 185, 185, 185)),
                            ),
                          ),
                        ),
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
                            decoration:
                                AppDecoration.txtFillAmber70026.copyWith(
                              borderRadius:
                                  BorderRadiusStyle.txtRoundedBorder10,
                            ),
                            child: Text(events[index].categoryName.toString(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtNotoSansSemiBold12),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(
              width: size.width,
              padding: getPadding(left: 37, right: 37),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/calender.png',
                    width: 200,
                    height: 200,
                  ),
                  Padding(
                      padding: getPadding(top: 33),
                      child: Text("No created or following events",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNotoSansRegular12)),
                  Container(
                    height: getVerticalSize(50.00),
                    width: getHorizontalSize(300.00),
                    margin: getMargin(top: 8, bottom: 6),
                    child: CustomButton(
                        height: 50,
                        text: "lbl_explore_events".tr.toUpperCase(),
                        margin: getMargin(left: 3, top: 14),
                        shape: ButtonShape.RoundedBorder14,
                        padding: ButtonPadding.PaddingAll9,
                        fontStyle: ButtonFontStyle.NotoSansBold16,
                        onTap: onTapEvents),
                  )
                ],
              ),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void onTapEvents() {
    Get.toNamed(AppRoutes.eventsScreen);
  }

  openIndividualEvent(String id) async {
    try {
      APIHandler apiClient = APIHandler();
      print(id);
      dynamic response = await apiClient.get(
        '/eventById/$id',
        isAuthenticated: true,
      );

      dynamic resondeData = response.data;
      print(resondeData);
      EventDisplayModel eventDisplayModel =
          EventDisplayModel.fromJson(response.data);
      Get.toNamed(AppRoutes.eventDetailsAboutScreen,
          arguments: eventDisplayModel);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapOrgProfile(int oid) async {
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/userById/$oid', isAuthenticated: true);

      MyProfileModel profileDisplayModel =
          MyProfileModel.fromJson(response.data);
      print(profileDisplayModel);
      Get.toNamed(AppRoutes.organizerProfileAboutScreen,
          arguments: profileDisplayModel);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      // isDataLoading;
    }
  }

  void onTapVenue() {}

  void onTapCategoryName() {}
}
