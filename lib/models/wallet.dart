import 'package:flutter_getx_testing/models/models.dart';
import 'package:speed_up/speed_up.dart';

class Wallet {
  final List<Order> _orders = [];

  num get coinAmount => _orders.sum((o) => o.coinAmount);

  num get investedAmount => _orders.sum((o) => o.totalPaid);

  void add(Order order) {
    if (order.coinAmount.isNegative || order.coinAmount == 0) {
      throw Exception('Negative coin amount');
    }
    if (order.coinPrice.isNegative || order.coinPrice == 0) {
      throw Exception('Negative coin amount');
    }

    _orders.add(order);
  }
}
