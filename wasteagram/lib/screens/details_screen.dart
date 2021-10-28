import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/entry_screen';
  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  Widget build(BuildContext context) {
    final FoodWastePost post = 
        ModalRoute.of(context)!.settings.arguments as FoodWastePost;

    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: Colors.blue), title: Text('Post Details')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(post.getDate, style: Theme.of(context).textTheme.headline6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Semantics(
                child: 
                SizedBox(
                   width: 375.0,
                    height: 300.0,
                  child: Image.network(post.imageURL.toString(),
                      width: MediaQuery.of(context).size.width * 0.40),
                ),
                image: true,
                label: 'waste items photo',
              ),
            ],
          ),
          Text(post.quantity.toString() + " items",
              style: Theme.of(context).textTheme.headline4),
          Text(
              "Location: (" +
                  post.latitude.toString() +
                  ", " +
                  post.longitude.toString() +
                  ")",
              style: Theme.of(context).textTheme.headline6)
        ],
      ),
    );
  }
}
