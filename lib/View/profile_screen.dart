import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'May 24, 2024',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture and Details
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/doctor.jpg'), // Replace with the real image URL
            ),
            const SizedBox(height: 16),
            Text(
              'Kathryn Murphy',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              'Dentist',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            // Success Rate, Rating, Reviews
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileDetail('80%', 'Succeed'),
                _buildProfileDetail('4.0', 'Rating'),
                _buildProfileDetail('82', 'Reviews'),
              ],
            ),
            const SizedBox(height: 24),
            // Options
            _buildOptionItem(
              context,
              icon: Icons.person_outline,
              title: 'Specialist',
              subtitle: 'Select best match',
              onTap: () {},
            ),
            _buildOptionItem(
              context,
              icon: Icons.calendar_today_outlined,
              title: 'Date & Time',
              subtitle: 'Select best match',
              onTap: () {},
            ),
            _buildOptionItem(
              context,
              icon: Icons.topic_outlined,
              title: 'Meeting Topic',
              subtitle: 'Select best match',
              onTap: () {},
            ),
            SizedBox(height: 30,),
            // Book Appointment Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(150, 40), // Adjust width and height here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add custom padding
                  ),
                  onPressed: () {
                    // Handle booking logic
                  },
                  child: Text(
                    'Book Appointment',
                    style: GoogleFonts.poppins(
                      fontSize: 14, // Smaller font size
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Message Icon
                IconButton(
                  icon: Stack(
                    children: [
                      Icon(Icons.mail_outline, size: 28, color: Colors.orange),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    // Handle message logic
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildOptionItem(BuildContext context,
      {required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(icon, size: 20, color: Colors.blue),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black54
      ),
      onTap: onTap,
    );
  }
}
