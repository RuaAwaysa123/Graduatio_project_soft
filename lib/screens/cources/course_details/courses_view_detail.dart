import 'package:flutter/material.dart';
class courseDetails extends StatefulWidget {
  @override
  _courseDetailsState createState() => _courseDetailsState();
}

class _courseDetailsState extends State<courseDetails> {
  buildIngredientItem(String name, IconData iconData, Color bgColor) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: bgColor,
            ),
            child: Center(
              child: Icon(iconData, size: 20.0, color: Colors.white),
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            width: 60.0,
            child: Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'nunito',
                  fontSize: 12.0,
                  color: Color(0xFFC2C0C0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height - 20.0,
                  width: MediaQuery.of(context).size.width,
                  color:Colors.blue //Color(0xFFF3B2B7),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2 - 20.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2 + 25.0,
                left: 15.0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 2) - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF726B68),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      Text(
                        '1 hour',
                        style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // This is the line
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),

                      SizedBox(height: 10.0),

                      Container(
                        height: 80.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIngredientItem(
                              '',
                              Icons.calendar_today_outlined,
                              Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),
                                Text(
                                  'Mon, Jan 22, 2024',
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF726B68),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  '10pm - 11pm',
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 12.0,
                                    color: Color(0xFFC6C4C4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Line
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),

                      SizedBox(height: 10.0),

                      Container(
                        height: 80.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildIngredientItem(
                              'Organizers',
                              Icons.person_3_outlined,
                              Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),
                                Text(
                                  'IEEE ,Computer Community',
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF726B68),
                                  ),
                                ),
                                SizedBox(height: 10.0),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      Container(
                        height: 80.0,
                        child: Row(
                          children: [
                            buildIngredientItem(
                              '',
                              Icons.location_on,
                              Colors.blue,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Your Location',
                              style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color: Color(0xFFD4D3D2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Line
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      Container(
                        height: 80.0,
                        child: Row(
                          children: [
                            buildIngredientItem(
                              '',
                              Icons.attach_money,
                              Colors.blue,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              '20 NIS',
                              style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                color:Color(0xFF726B68),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Line
                      Padding(
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Container(
                          height: 0.5,
                          color: Color(0xFFC6C4C4),
                        ),
                      ),
                      SizedBox(height: 10.0),

                      Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color:Colors.blue, //Color(0xFF473D3A),
                          ),
                          child: Center(
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                fontFamily: 'nunito',
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 10,
                left: 200.0,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img-removebg-preview.png'),//assets/OIP__21_-removebg-preview.png//assets/R.svg
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 25.0,
                left: 15.0,
                child: Container(
                  height: 300.0,
                  width: 250.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // use a row with crossaxis as end
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            child: Text(
                              'Arduino Work shop',
                              style: TextStyle(
                                fontFamily: 'varela',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(Icons.favorite, size: 18.0, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 170.0,
                        child: Text(
                          'These workshops are designed to introduce participants to the basics of electronics and programming using Arduino microcontrollers. ',
                          style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 13.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xFF473D3A),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '4.2',
                                    style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 13.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '/5',
                                    style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 13.0,
                                      color: Color(0xFF7C7573),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 35.0,
                                    width: 80.0,
                                  ),
                                  Positioned(
                                    left: 40.0,
                                    child: Container(
                                      height: 35.0,
                                      width: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17.5),
                                        border: Border.all(
                                          color: Color(0xFFF3B2B7),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage('assets/man.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20.0,
                                    child: Container(
                                      height: 35.0,
                                      width: 35.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17.5),
                                        image: DecorationImage(
                                          image: AssetImage('assets/model.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                          color: Color(0xFFF3B2B7),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35.0,
                                    width: 35.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.5),
                                      image: DecorationImage(
                                        image: AssetImage('assets/model2.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        color: Color(0xFFF3B2B7),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                '+ 27 more',
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
