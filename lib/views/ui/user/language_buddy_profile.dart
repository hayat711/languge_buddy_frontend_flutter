import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';
import 'package:language_buddy/views/common/reusable_text.dart';
import 'package:language_buddy/views/ui/user/show_profile_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LanguageBuddyProfile extends StatefulWidget {
  const LanguageBuddyProfile({Key? key, required this.userName, required this.userLang, required this.userBio, required this.userAvatar, required this.age, required this.userLocation, required this.index}) : super(key: key);

  final String userName;
  final String userLang;
  final String userBio;
  final String userAvatar;
  final int age;
  final String userLocation;
  final int index;


  @override
  // ignore: library_private_types_in_public_api
  _LanguageBuddyProfileState createState() => _LanguageBuddyProfileState();
}

class _LanguageBuddyProfileState extends State<LanguageBuddyProfile> {
  PanelController _panelController = PanelController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Profile Picture
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                // width: double.infinity,
                // height: MediaQuery.of(context).size.height * 0.9,
                child: Center(
                  child: Image.asset(
                    'assets/images/avatar${widget.index}.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
               

              // sliding panel
              Container(
                child: SlidingUpPanel(
                  controller: _panelController,
                  minHeight: 70,
                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: Colors.transparent,
                  backdropEnabled: true,
                  backdropColor: Colors.black12.withOpacity(0.1),
                  backdropOpacity: 0.3,
                  parallaxEnabled: true,
                  parallaxOffset: 0.5,
                  renderPanelSheet: false,
                 boxShadow:const [
                   BoxShadow(
                      blurRadius: 20.0,
                     color: Colors.grey,
                  ),
                   ],

                  panel:  GlassmorphicFlexContainer(
                    borderRadius: 40,
                    blur: 12,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.pink.withOpacity(0.1),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.6),
                        Colors.pink.withOpacity(0.4),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Positioned(
                                bottom: 80,
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle tap to expand bottom sheet
                                    _panelController.open();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(1),

                                    child: const Icon(
                                      Icons.drag_indicator_outlined,
                                      color: accentColor,
                                    ),
                                  ),
                                ),
                              ),
                              // User profile details
                              const HeightSpacer(size: 30),
                               ShowProfileDetails(
                                userName: widget.userName,
                                userLang: widget.userLang,
                                userBio: widget.userBio,
                                userAvatar: widget.userAvatar,
                                age: widget.age,
                                userLocation: widget.userLocation,

                              ),
                            ],
                          ),
                          Positioned(
                            left: 10,
                            top: 2,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: accentColor,
                                  onPressed: () {
                                    // Handle skip profile button press
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close, color: Colors.white),
                                ),
                                FloatingActionButton(
                                  backgroundColor: primaryColor,
                                  onPressed: () {
                                    // Handle accept profile button press
                                  },
                                  child: const Icon(Icons.check, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Indicator to expand bottom sheet
              

            ],
          ),
        ),
      
    );
  }
}
