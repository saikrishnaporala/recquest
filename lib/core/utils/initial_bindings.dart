import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/data/apiClient/api_client.dart';
import 'package:recquest_21/utils/background_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.put(BackgroundController());
  }
}
