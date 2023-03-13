import 'package:get/get.dart';
import 'package:recquest_21/data/models/selectionPopupModel/category_selection_popup_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'map_view_item_model.dart';

class MapViewModel {
  RxList<MainhomeItemModel> mapViewItemList =
      RxList.filled(0, MainhomeItemModel());

  RxList<CategorySelectionPopupModel> categoryItemList =
      RxList.filled(0, CategorySelectionPopupModel());
}
