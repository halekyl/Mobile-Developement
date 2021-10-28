import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class NewEntry extends StatefulWidget {
  static const routeName = '/newEntry';

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  File? image;
  final picker = ImagePicker();
  String? fire_url;
  LocationData? locationData;
  var locationService = Location();

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();
    setState(() {
      //print('LOCATION DATA TEST: printing Lat & Long');
      //print(locationData!.latitude);
      //print(locationData!.longitude);
    });
  }

  final formKey = GlobalKey<FormState>();
  int wastedItems = 0;

  void uploadData() async {
    final url = fire_url;
    final date = DateTime.now();
    final quantity = wastedItems;
    final latitude = locationData!.latitude;
    final longitude = locationData!.longitude;
    FirebaseFirestore.instance.collection('posts1').add({
      'date': date,
      'imageURL': url,
      'longitude': longitude,
      'latitude': latitude,
      'quantity': quantity,
    });
    //print('upload complete');
    Navigator.of(context).maybePop();
  }

  getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {});
    var fileName = DateTime.now().toString() + '.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    final url = await storageReference.getDownloadURL();
    print(url);
    fire_url = url;
    return url;
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.blue), title: Text('New Post')),
        body: Center(
            child: ElevatedButton(
                child: Text('Select Photo'),
                onPressed: () {
                  getImage();
                  setState(() {});
                })),
      );
    } else {
      return Center(
          child: Scaffold(
        appBar: AppBar(leading: BackButton(color: Colors.blue), title: Text('Confirm New Post Details')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                    width: 375.0,
                    height: 300.0,
                      child: Image.file(
                        image!,
                      ),
                    )
                  ]),
                  TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "How Many Items"),
                    onSaved: (value) {
                      wastedItems = int.parse(value!);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a number';
                      } else {
                        return null;
                      }
                    },
                  ),
                ])),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 85,
                child: Semantics(
                  child: ElevatedButton.icon(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          uploadData();
                        }
                      },
                      icon: Icon(Icons.cloud_upload_outlined),
                      label: Text("")),
                  button: true,
                  enabled: true,
                  onTapHint: 'Select an image',
                ),
              ),
            )
          ],
        ),
      ));
    }
    //return Center(child: CircularProgressIndicator());
  }
}
