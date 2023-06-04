import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/reusable_text.dart';
import 'package:language_buddy/views/ui/user/show_profile_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BuddyProfile extends StatefulWidget {
  const BuddyProfile({Key? key}) : super(key: key);

  @override
  BuddyProfileState createState() => BuddyProfileState();
}

class BuddyProfileState extends State<BuddyProfile> {
  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Profile Picture
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/avatar3.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Sliding panel
          SlidingUpPanel(
            controller: _panelController,
            minHeight: 70,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Colors.transparent,
            backdropEnabled: true,
            backdropColor: Colors.black12.withOpacity(0.5),
            backdropOpacity: 0.5,
            panel: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(33, 255, 255, 255).withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _panelController.open();
                        },
                        child: Icon(
                          Icons.drag_indicator_outlined,
                          color: accentColor,
                        ),
                      ),
                    ),
                    const HeightSpacer(size: 30),
                    const ShowProfileDetails(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          backgroundColor: accentColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                        FloatingActionButton(
                          backgroundColor: primaryColor,
                          onPressed: () {},
                          child: Icon(Icons.check, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
