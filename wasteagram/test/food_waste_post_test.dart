import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main() {
  test('the formated date from the getter should have the appropriately formated date value - weekday, month, day, year', () {
    final newPost = FoodWastePost(
        date: Timestamp.fromDate(DateTime(2021,8,10)));

    final String date = newPost.getDate;

    expect(date, 'Tuesday, August 10, 2021');
  });

  test('Post created from Map should have appropraite property values', () {
    final date = Timestamp.fromDate(DateTime.parse('2021-08-10'));
    const url = 'FAKE';
    const quantity = 1;
    const latitude = 2.0;
    const longitude = 5.0;

    final food_waste_post = FoodWastePost.fromMap({
      'date': date,
      'imageURL': url,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    });
    expect(food_waste_post.date, date);
    expect(food_waste_post.imageURL, url);
    expect(food_waste_post.quantity, quantity);
    expect(food_waste_post.latitude, latitude);
    expect(food_waste_post.longitude, longitude);

  });
}

