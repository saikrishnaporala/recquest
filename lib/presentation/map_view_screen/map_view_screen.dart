import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recquest_21/data/models/selectionPopupModel/category_selection_popup_model.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:recquest_21/widgets/MapWidget.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';

import 'controller/map_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

class MapViewScreen extends GetWidget<MapViewController> {
  final MapViewController controller =
      Get.put(MapViewController(), permanent: false);

  static final LatLng _kMapCenter = LatLng(
      BackgroundController.instance.latitude,
      BackgroundController.instance.longitude);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'Marker 1'),
          rotation: 90),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(18.997962200185533, 72.8379758747611),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
        backgroundColor: ColorConstant.gray10001,
        appBar: CustomAppBar(
            height: getVerticalSize(50.00),
            leadingWidth: 32,
            leading: AppbarImage(
              height: getSize(16.00),
              width: getSize(16.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 16, top: 16, bottom: 16),
            ),
            title: AppbarSubtitle(text: "Maps", margin: getMargin(left: 16)),
            styleType: Style.bgFillWhiteA700),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  // width: size.width,
                  padding: getPadding(left: 0, top: 0, right: 0, bottom: 0),
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Padding(
                              padding: getPadding(left: 10, top: 10, right: 10),
                              child: Obx(() => ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  // physics: BouncingScrollPhysics(),
                                  // shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        // height: getVerticalSize(10.00));
                                        width: getHorizontalSize(5.00));
                                  },
                                  itemCount: controller.mapViewModelObj.value
                                      .categoryItemList.length,
                                  itemBuilder: (context, index) {
                                    CategorySelectionPopupModel model =
                                        controller.mapViewModelObj.value
                                            .categoryItemList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        getEventsByCategory(model.id);
                                      },
                                      // alignment: AlignmentDirectional(0, 0),
                                      child: Container(
                                          margin: getMargin(
                                            right: 5,
                                          ),
                                          padding: getPadding(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.pink[900],
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              )),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(model.name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtNotoSansMedium16W)),
                                    );
                                  }))),
                        ),
                      ])),
              Container(
                // width: size.width,
                padding: getPadding(left: 0, top: 0, right: 0, bottom: 0),
                decoration: AppDecoration.fillWhiteA700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: 0,
                        top: 5,
                      ),
                      child: Container(
                        height: size.height - 209,
                        // child: Obx(() => MapWidget(
                        //     eventslist: controller
                        //         .mapViewModelObj.value.mapViewItemList)),
                        child: Obx(() => GoogleMap(
                            // onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  BackgroundController.instance.latitude,
                                  BackgroundController.instance.longitude),
                              zoom: 17.0,
                            ),
                            markers: controller.markers.toSet())),
                      ),
                    ),
                  ],
                ),
              ),
            ]));
  }

  void getEventsByCategory(dynamic id) {
    controller.getEventsByCategory(id);
  }
}
