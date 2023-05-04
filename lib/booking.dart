import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

final List<String> namesleft = [
  "09:00 AM - 10:00 AM",
  "11:00 AM - 12:00 PM",
  " 03:00 AM - 04:00 PM",
"05:00 PM - 06:00 PM",
  " 07:00 PM - 08:00 PM",
];

final List<String> namesright = [
  "10:00 AM - 11:00 AM",
  "02:00 PM - 03:00 PM",
"04:00 PM - 05:00 PM",
  "06:00 PM - 07:00 PM",
  "08:00 PM - 09:00 PM"
];
List<bool> leftSelected = List.generate(namesleft.length, (index) => false);
List<bool> rightSelected = List.generate(namesright.length, (index) => false);



class _bookingState extends State<booking> {


 
  
 
  String selectedTime = ''; // Declare a variable to store the selected time
  //...
   bool _isSelected = false;
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      
      today =day;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: content(),
    );


  }


  Widget content(){
    return Column(
      children: [SizedBox(
        height: 20,
      ),
      Container(
        child: TableCalendar(focusedDay: today, firstDay: DateTime.utc(2010,10,16), lastDay: DateTime.utc(2030,3,14),
        onDaySelected: _onDaySelected,
        locale: "en_US",
        rowHeight: 30,
        headerStyle: HeaderStyle(
          formatButtonVisible: false, titleCentered: true
        ),
        // availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day  , today),
         ),

      ),
      SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height/2.8,
            child: Expanded(child: ListView.builder(
              itemCount: namesleft.length,
              itemBuilder: (context,index){
                return  Row(
                    children: [
                      GestureDetector(

                         onTap: () {
        setState(() {
      leftSelected[index] = !leftSelected[index]; // Toggle the selected state of the left card
      rightSelected[index] = false; // Deselect the right card
      selectedTime = namesleft[index];// Set selectedTime to the time of the selected container
    });
    
      },

                        child: Container(
                          width:(MediaQuery.of(context).size.width-25) / 2,
                          height: 100,
                          color: Colors.transparent,
                         
                          
                          

                          child: Card(
                            color: selectedTime == namesleft[index] || selectedTime == namesright[index] ? Colors.blue : Colors.white,
                            elevation: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                  
                                ),
                                Center(
                                  child: Flexible(child: Text(
                                    namesleft[index],style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )),
                                )
                              ],
                            ),
                                      
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    GestureDetector(
                      onTap: () {
        setState(() {
      leftSelected[index] = false; // Deselect the left card
      rightSelected[index] = !rightSelected[index]; // Toggle the selected state of the right card
      selectedTime = namesright[index]; // Set selectedTime to the time of the selected container
    });
      },
                        child: Container(
                          width:(MediaQuery.of(context).size.width-25) / 2,
                          height: 100,
                          color: Colors.transparent,
                          child: Card(
                            color: selectedTime == namesleft[index] || selectedTime == namesright[index] ? Colors.blue : Colors.white,
                            elevation: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                  
                                ),
                                Center(
                                  child: Flexible(child: Text(
                                    namesright[index],style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )),
                                )
                              ],
                            ),
                                      
                          ),
                        ),
                      ),
                    ],
                  );
                
              }
            )),
          ),
        )
      ],
    );
  }
}