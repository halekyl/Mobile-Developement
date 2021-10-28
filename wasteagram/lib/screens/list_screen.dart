import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'details_screen.dart';
import 'new_entry.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  File? image;
  final picker = ImagePicker();
  LocationData? locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
  }

  void CreateNewPost(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntry.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Wastegram')),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('posts1')
                .orderBy('date', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData &&
                  // ignore: unnecessary_null_comparison
                  snapshot.data!.docs != null &&
                  snapshot.data!.docs.length > 0) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data!.docs[index];
                      Timestamp postDate = post['date'];
                      DateTime dateTime = postDate.toDate();
                      String displayDate =
                          DateFormat('EEEE, MMMM d, ' 'yyyy').format(dateTime);
                      //print(displayDate);
                      FoodWastePost newWastePost = FoodWastePost(
                          date: post['date'],
                          quantity: post['quantity'],
                          latitude: post['latitude'],
                          longitude: post['longitude'],
                          imageURL: post['imageURL']);
                      return Semantics(
                        child: ListTile(
                            leading: Text(displayDate.toString(),
                                style: Theme.of(context).textTheme.headline6),
                            title: Text(
                              post['quantity'].toString(),
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.right,
                            ),
                            onTap: () {
                              seeDetails(context, newWastePost);
                            }),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Semantics(
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              //print('CALLING CREATENEWPOST');
              CreateNewPost(context);
            },
          ),
        ));
  }

  // navigate to details screen
  void seeDetails(BuildContext context, FoodWastePost foodWastePost) {
    Navigator.pushNamed(context, DetailsScreen.routeName,
        arguments: foodWastePost);
  }
}
