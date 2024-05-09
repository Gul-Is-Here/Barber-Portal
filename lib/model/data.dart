import 'package:intl/intl.dart';

enum Status {
  schedule,
  completed,
  cancel,
}

class OrderData {
  final String orderNumber;
  final Status status;
  final String customerName;
  final String email;
  final DateTime appointmentAndDate;
  final String phone;
  final double price;
  final bool isCompleted;
  final bool isCancel;

  OrderData({
    required this.orderNumber,
    required this.status,
    required this.email,
    required this.appointmentAndDate,
    required this.customerName,
    required this.phone,
    required this.price,
    required this.isCompleted,
    required this.isCancel,
  });
}

List<OrderData> orderBooking = [
  OrderData(
    orderNumber: '2233445566cd',
    status: Status.schedule,
    email: 'harry1122@gmail.com',
    appointmentAndDate: DateTime.now(),
    customerName: 'Mike',
    phone: '+631972722',
    price: 12.0,
    isCompleted: false,
    isCancel: false,
  ),
  OrderData(
    orderNumber: '2233445566a',
    status: Status.cancel,
    email: 'harry1122@gmail.com',
    appointmentAndDate: DateTime.now(),
    customerName: 'Harry',
    phone: '+631972722',
    price: 12.0,
    isCompleted: false,
    isCancel: false,
  ),
  OrderData(
    orderNumber: '2233445566c',
    status: Status.schedule,
    email: 'harry1122@gmail.com',
    appointmentAndDate: DateTime.now(),
    customerName: 'Jhon',
    phone: '+631972722',
    price: 12.0,
    isCompleted: false,
    isCancel: false,
  ),
  OrderData(
    orderNumber: '2233445566b',
    status: Status.completed,
    email: 'harry1122@gmail.com',
    appointmentAndDate: DateTime.now(),
    customerName: 'Marry',
    phone: '+631972722',
    price: 12.0,
    isCompleted: false,
    isCancel: false,
  ),
  OrderData(
    orderNumber: '2233445566b',
    status: Status.completed,
    email: 'harry1122@gmail.com',
    appointmentAndDate: DateTime.now(),
    customerName: 'Hunter',
    phone: '+631972722',
    price: 12.0,
    isCompleted: false,
    isCancel: false,
  ),
];
