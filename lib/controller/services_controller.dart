import 'dart:async';
import 'dart:convert';

import 'package:barber_portal/const/globals.dart';
import 'package:barber_portal/model/added_services_model.dart';
import 'package:barber_portal/model/services_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServicesController extends GetxController {
  var addServices = AddServices(services: [], menu: []).obs;
  var isLoading = true.obs;

  var selectedService = ''.obs;
  var selectedSubCategory = ''.obs;
  var userPrice = ''.obs;
  var serId = ''.obs;
  var mId = ''.obs;

  // For added services
  final _servicesStreamController =
      StreamController<List<AddedServices>>.broadcast();
  List<AddedServices>? _cachedServices;

  Stream<List<AddedServices>> get servicesStream =>
      _servicesStreamController.stream;

  @override
  void onInit() {
    super.onInit();
    fetchServicesData();
    refreshData(id);
  }

  // Fetch Added Services Data
  Future<void> fetchAddedServicesData(String id) async {
    if (_cachedServices != null) {
      _servicesStreamController.add(_cachedServices!);
      return;
    }

    try {
      final response = await http.get(Uri.parse(
          'https://salons.sgsolutionsgroup.com/sassapi/get_stylist_menu/$id'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        _cachedServices =
            jsonData.map((json) => AddedServices.fromJson(json)).toList();
        _servicesStreamController.add(_cachedServices!);
      } else {
        _servicesStreamController
            .addError('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      _servicesStreamController.addError('Failed to load data: $e');
    }
  }

  void refreshData(String id) {
    _cachedServices = null;
    fetchAddedServicesData(id);
  }

  @override
  void onClose() {
    _servicesStreamController.close();
    super.onClose();
  }

  // Fetch Services Data
  Future<void> fetchServicesData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://salons.sgsolutionsgroup.com/sassapi/services')); // replace with your API URL
      if (response.statusCode == 200) {
        addServices.value = AddServices.fromRawJson(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data: $e');
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

  // Post Selected Data
  Future<void> postSelectedData() async {
    try {
      // Construct the data to be posted
      final data = {
        'stylist_id': id,
        'price': userPrice.value,
        'ser_id': serId.value,
        'm_id': mId.value,
      };

      // Make a POST request
      final response = await http.post(
        Uri.parse(
            'https://salons.sgsolutionsgroup.com/sassapi/post_data_json'), // Replace with your API URL
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Data posted successfully');
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to post data: $e');
    }
  }
}
