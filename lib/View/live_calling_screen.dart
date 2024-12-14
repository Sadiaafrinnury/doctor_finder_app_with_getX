import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiveCallingScreen extends StatelessWidget {
  const LiveCallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (Doctor)
          Positioned.fill(
            child: Image.asset(
              'assets/images/doctor.jpg', // Replace with doctor's image URL
              fit: BoxFit.cover,
            ),
          ),

          // Participant small video overlay
          Positioned(
            top: 100,
            right: 16,
            child: Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/user.jpeg', // Replace with participant's image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Live badge
          Positioned(
            top: 50,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Live',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Doctor's name and designation
          Positioned(
            bottom: 140,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kathryn Murphy',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Certified Dentist Doctor',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Control buttons
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute button
                _buildControlButton(Icons.mic_off, Colors.blue),
                // End call button
                _buildControlButton(Icons.call_end, Colors.red),
                // Chat button
                _buildControlButton(Icons.chat, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color, size: 28),
    );
  }
}
