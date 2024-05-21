import 'package:barber_portal/model/services_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:your_project_name/models/welcome.dart';  // replace with the actual path to your models

class ServicesController extends GetxController {
  var addServices = AddServices(services: [], menu: []).obs;
  var isLoading = true.obs;

  var selectedService = ''.obs;
  var selectedSubCategory = ''.obs;
  var userPrice = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchServicesData();
  }

  Future<void> fetchServicesData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://salons.sgsolutionsgroup.com/sassapi/services')); // replace with your API URL
      if (response.statusCode == 200) {
        addServices.value = AddServices.fromRawJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Menu> get filteredMenu {
    final selectedServiceId = selectedService.value;
    return addServices.value.menu
        .where((menu) => menu.serviceId == selectedServiceId)
        .toList();
  }
}
