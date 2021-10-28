import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FoodWastePost {
  Timestamp? date;
  double? longitude;
  double? latitude;
  int? quantity;
  String? imageURL;
  DocumentReference? docuemnt;

  FoodWastePost(
      {this.date, this.latitude, this.longitude, this.quantity, this.imageURL});

  String get getDate =>
      DateFormat.yMMMMEEEEd('en_US').format(date!.toDate());

  FoodWastePost.fromMap(Map<String, dynamic> map, {this.docuemnt})
      : quantity = map['quantity'],
        imageURL = map['imageURL'],
        latitude = map['latitude'],
        longitude = map['longitude'],
        date = map['date'];
}
