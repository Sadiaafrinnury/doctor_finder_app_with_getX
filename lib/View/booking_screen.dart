import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedDateIndex = -1; // To track the selected date
  String selectedFromTime = "09:00am"; // Default 'from' time
  String selectedToTime = "10:00am"; // Default 'to' time

  final List<String> weekDays = ["M", "T", "W", "T", "F", "S", "S"]; // Weekdays

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Appointment",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Calendar Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Calendar Title
                  Text(
                    "Choose Your Date",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Weekdays Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: weekDays.map((day) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10),

                  // Calendar UI
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7, // 7 days in a week
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: 31, // Total days in the month
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedDateIndex == index
                                ? Colors.blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: GoogleFonts.poppins(
                                color: selectedDateIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Time Picker Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose Your Time",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Time Pickers Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 'From' Time Dropdown
                      DropdownButton<String>(
                        value: selectedFromTime,
                        onChanged: (value) {
                          setState(() {
                            selectedFromTime = value!;
                          });
                        },
                        items: [
                          "09:00am",
                          "10:00am",
                          "11:00am",
                          "12:00pm",
                        ].map((time) {
                          return DropdownMenuItem(
                            value: time,
                            child: Text(
                              time,
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          );
                        }).toList(),
                      ),

                      // 'To' Time Dropdown
                      DropdownButton<String>(
                        value: selectedToTime,
                        onChanged: (value) {
                          setState(() {
                            selectedToTime = value!;
                          });
                        },
                        items: [
                          "10:00am",
                          "11:00am",
                          "12:00pm",
                          "01:00pm",
                        ].map((time) {
                          return DropdownMenuItem(
                            value: time,
                            child: Text(
                              time,
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Book Appointment Button
                  ElevatedButton(
                    onPressed: () {
                      // Add booking logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Appointment booked successfully!"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Swipe to book.....",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



