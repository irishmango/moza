import 'package:flutter/material.dart';
import 'package:moza/src/features/profile/presentation/widgets/badges_grid.dart';
import 'package:moza/src/features/settings/presentation/screens/change_password.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/src/shared/xp_tile.dart';
import 'package:moza/theme.dart';

final Map<String, dynamic> dummyUserProfile = {
  "firstName": "Shokri Francis",
  "lastName": "Raoof",
  "dob": "14.04.1991",
  "country": "Ireland",
  "email": "shokri@moza.com",
  "instrument": "Voice",
  "school": "---",
};

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ScreenHeader(title: "Settings"),
                SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 71,
                      backgroundImage: AssetImage('assets/img/avatar_profile.png'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // First Name
                    TextFormField(
                      initialValue: dummyUserProfile["firstName"],
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Last Name
                    TextFormField(
                      initialValue: dummyUserProfile["lastName"],
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Email
                    TextFormField(
                      initialValue: dummyUserProfile["email"],
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Change Password Option
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        leading: Icon(Icons.edit, color: Colors.black),
                        title: Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.black),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Instrument
                    TextFormField(
                      initialValue: dummyUserProfile["instrument"],
                      decoration: InputDecoration(
                        labelText: "Instrument",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // School
                    TextFormField(
                      initialValue: dummyUserProfile["school"],
                      decoration: InputDecoration(
                        labelText: "School",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Date of Birth
                    TextFormField(
                      initialValue: dummyUserProfile["dob"],
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
            
                    // Country
                    TextFormField(
                      initialValue: dummyUserProfile["country"],
                      decoration: InputDecoration(
                        labelText: "Country",
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 24,),
            
            
                    // update profile button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                         ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text("Profile Updated"))
                         );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          "Update Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                SizedBox(height: 16),
            
            
                
                SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
