import 'package:flutter/material.dart';
import 'package:rive_animation/screens/cources/widgets_cources/feature_item.dart';

import '../../widget/chat_wedgets/widgets.dart';
import 'Cource_info.dart';

class FeaturedListPage extends StatelessWidget {
  final List features;

  FeaturedListPage({required this.features});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Featured Items" ,),
      ),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FeatureItem(data: features[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // Create an instance of AddFeaturePage and navigate to it
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCourse(), // Use AddFeaturePage() instead of AddFeaturePage
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
