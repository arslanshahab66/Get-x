import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 7, 12, 47),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/wallet.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Account',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                leading: const Icon(
                  Icons.security_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  'Security',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white70,
                  size: 18,
                ),
              ),
              ListTile(
                  leading: const Icon(
                    Icons.mode_night_outlined,
                    color: Colors.white70,
                  ),
                  title: Text(
                    'Dark Mode',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    'System',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70),
                  )),
              ListTile(
                  leading: const Icon(
                    Icons.language,
                    color: Colors.white70,
                  ),
                  title: Text(
                    'Language',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  trailing: Text(
                    'English',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white70),
                  )),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade800,
                height: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'About',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip,
                  color: Colors.white70,
                ),
                title: Text(
                  'Privacy policies',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.insert_page_break_outlined,
                  color: Colors.white70,
                ),
                title: Text(
                  'White paper',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.warning_amber,
                  color: Colors.white70,
                ),
                title: Text(
                  'Info',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.grey.shade800,
                height: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Remove all data',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
