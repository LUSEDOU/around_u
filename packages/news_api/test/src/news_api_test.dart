// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:news_api/news_api.dart';

void main() {
  group('NewsApi', () {
    test('can be instantiated', () {
      expect(NewsApi(), isNotNull);
    });
  });
}
