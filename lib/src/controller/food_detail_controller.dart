import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:food_order_app/src/model/food_report_model.dart';
import 'package:food_order_app/src/service/food_report_service.dart';
import 'package:food_order_app/src/view/widgets/toast.dart';
import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  final FoodReportService _reportService = FoodReportService();
  var customerReport = Rx<OrderReport?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrder();
  }

  Future<void> fetchOrder() async {
    isLoading(true);

    final networkStatus = await _getNetworkStatus();
    if (networkStatus.contains(ConnectivityResult.none)) {
      errorMessage.value = "No internet connection. Please try again.";
      ToastWidget.showToast("No internet connection.");
      isLoading(false);
      return;
    }

    try {
      final report = await _reportService.reportService();
      customerReport.value = report;
      errorMessage.value = '';
      ToastWidget.showToast("Fetching Successful.");
    } catch (e) {
      ToastWidget.showToast("$e");
      print(e);
    } finally {
      isLoading(false);
      update();
    }
    update();
  }

  Future<List<ConnectivityResult>> _getNetworkStatus() async {
    final connectivity = Connectivity();
    final result = await connectivity.checkConnectivity();
    return result;
  }
}
