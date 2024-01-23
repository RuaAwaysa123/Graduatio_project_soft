import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Background Image
                Image.asset(
                  'assets/coffee.jpg',
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
                // Love Icon
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
                // Interested Icon
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: Icon(
                    Icons.star_border,
                    color: Colors.grey,
                    size: 32.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Event Title
            Text(
              'Event Title',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            // Audience Images, Going Count, Arrow
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Audience Images (Add your logic to load images)
                CircleAvatar(radius: 20.0, backgroundImage: NetworkImage('url')),
                // Add more audience images here

                // Going Count and Arrow
                Column(
                  children: [
                    Text('+11 going'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Date and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Calendar Icon
                Icon(Icons.calendar_today),
                SizedBox(width: 8.0),
                // Date and Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Monday, January 22, 2024'),
                    Text('8 PM - 9 PM'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
            SizedBox(height: 16.0),
            // Location
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Location Icon
                Icon(Icons.location_on),
                SizedBox(width: 8.0),
                // Location Text (Update with actual location)
                Text('Event Location'),
              ],
            ),
            SizedBox(height: 16.0),
            // Price
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Price Icon
                Icon(Icons.attach_money),
                SizedBox(width: 8.0),
                // Price Text (Update with actual price)
                Text('\$50.00'),
              ],
            ),
            SizedBox(height: 16.0),
            // Book Event Now Button (Stays fixed when scrolling)
            ElevatedButton(
              onPressed: () {},
              child: Text('Book Event Now'),
              // Use a Positioned widget if you want it to stay fixed while scrolling
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
