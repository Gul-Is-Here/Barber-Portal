import 'package:get/get.dart';
import '../screens/Menu/menu_items.dart';

class AddMenuController extends GetxController {
  List<BookingItem> bookings = [];
  var selectedCategory = RxString('');
  var selectedSubcategory = RxString('').obs;
  var enteredPrice = RxDouble(0.0);
  DateTime? selectedDate;

  final List<String> categories = [
    'BODY WAXING',
    'VOMO HAIR EXTENSION',
    'TEXTURE',
    'TREATMENTS',
    'COLOR',
    'SHAMPOO & BLOW DRY',
    'HAIR CUT & BLOW DRY'
  ];

  final Map<String, List<String>> itemsByCategory = {
    'BODY WAXING': ['chin', 'lip'],
    'VOMO HAIR EXTENSION': ['Hand Tied & Tape In 12/14 -inch'],
    'TEXTURE': [
      'Brazilian Blow Out',
      'Keratin Express Treatments',
      'Keratin Smoothing Treatment'
    ],
    'TREATMENTS': ['Botanical Hair therapy', 'Keratin Color Lock Treatment'],
    'COLOR': [
      'Single Process Color',
      "Men's Color",
      "Men's Color Blending",
      'Partial Highlights/Lowlights',
      'Creative Color',
      'Full Highlights',
      'Toner/Glaze, Shampoo & Blow Dry'
    ],
    'SHAMPOO & BLOW DRY': [
      'SHAMPOO & BLOW DRY',
      'Special Occasion Updo',
      'Additional Styling'
    ],
    'HAIR CUT & BLOW DRY': [
      'Women & Girls Cut & Style',
      'Men & Boys & Style',
      'Bang Trim'
    ],
  };

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
    selectedSubcategory.value = ''.obs;
    enteredPrice.value = 0.0;
  }

  void setSelectedSubcategory(String subcategory) {
    selectedSubcategory.value = subcategory.obs;
    enteredPrice.value = 0.0;
  }

  void setEnteredPrice(double price) {
    enteredPrice.value = price;
  }

  bool isPriceValid() {
    return enteredPrice.value >= 1 && enteredPrice.value <= 10;
  }

  addBooking(BookingItem bookingItem) {
    bookings.add(bookingItem);
  }

  deleteBooking(BookingItem bookingItem) {
    bookings.remove([bookingItem]);
  }
}
