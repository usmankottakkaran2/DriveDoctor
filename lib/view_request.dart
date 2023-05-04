import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class viewrequest extends StatefulWidget {
  const viewrequest({super.key});

  @override
  State<viewrequest> createState() => _viewrequestState();
}
final List<Map<String, dynamic>> requests=[{
  "name":"Abhinand",
  "phone":"6217618271",
  "place":"Calicut",
  "services":["Engine service"],
  "timeslot":"11:00 AM - 12:00 PM"
},{
  "name":"Basil",
  "phone":"6217618271",
  "place":"Malappuram",
  "services":["Wheel Service","Oil Service"],
  "timeslot":"10:00 AM - 11:00 AM",
}];
class _viewrequestState extends State<viewrequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [

                Expanded(
                  child: ListTile(
                    title: Text(requests[index]["name"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                //             Card(
                //   child: Padding(
                //     padding: EdgeInsets.all(16.0),
                //     child: Text(services[index],
                //       style: TextStyle(
                //         fontSize: 10.0,
                //         fontWeight: FontWeight.bold,
                //         fontStyle: FontStyle.italic,
                //         color: Colors.black,
                //         decorationColor: Colors.blue,
                //         decorationStyle: TextDecorationStyle.dashed,
                //       ),
                //     ),
                //   ),
                // ),
                      ],
                    ),
                  ),
                ),
                Row(
                      children: [
                        Icon(Icons.location_on, size: 16.0),
                        SizedBox(width: 4.0),
                        Text(
                        requests[index]["place"],
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      
                      ],),
              ],
            ),
          );
        },
          ),
      ),



    );
  }
}