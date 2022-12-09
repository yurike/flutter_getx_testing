import 'package:flutter_getx_testing/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Arrange
  late Wallet wallet;

  // before each test
  setUp(() {
    wallet = Wallet(); // Arrange
  });

  // after each test (rare)
  tearDown(() {});

  // before ALL test (init db or Dio)
  setUpAll(() {});

  group('when empty wallet', () {
    test(', coin amount is 0', () {
      expect(wallet.coinAmount, 0);
    });

    test(', invested Amount amount is 0', () {
      expect(wallet.investedAmount, 0);
    });
  });

  group('when NON empty wallet', () {
    setUp(() {
      // Act
      wallet.add(Order(coinAmount: 10, coinPrice: 1));
    });

    test('- coin amount is NOT 0', () {
      // Assert
      expect(wallet.coinAmount, 10);
    });

    test('- invested Amount is NOT 0', () {
      // Assert
      expect(wallet.investedAmount, 10);
    });
  });

  group('when add invalid coin amount', () {
    test('- throw exception on negative', () {
      expect(() => wallet.add(Order(coinAmount: -10, coinPrice: 1)),
          throwsException);
    });

    test('- throw exception on 0', () {
      expect(() => wallet.add(Order(coinAmount: 0, coinPrice: 1)),
          throwsException);
    });
  });

  group('when add invalid coin price', () {
    test('- throw exception on negative', () {
      expect(() => wallet.add(Order(coinAmount: 10, coinPrice: -1)),
          throwsException);
    });

    test('- throw exception on 0', () {
      expect(() => wallet.add(Order(coinAmount: 10, coinPrice: 0)),
          throwsException);
    });
  });
}
