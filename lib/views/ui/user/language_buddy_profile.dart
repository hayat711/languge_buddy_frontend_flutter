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
  const LanguageBuddyProfile({Key? key}) : super(key: key);

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
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Center(
                  child: Image.asset(
                    'assets/images/avatar3.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
               

              // sliding panel
              Container(

                child: Container(
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
                    backdropOpacity: 0.1,
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
                      borderRadius: 24,
                      blur: 10,
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(0, 230, 47, 105).withOpacity(0.1),
                            Color.fromARGB(0, 202, 50, 146).withOpacity(0.05),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(0, 255, 255, 255).withOpacity(0.2),
                          Color.fromARGB(0, 255, 255, 255).withOpacity(0.2),
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
                                const ShowProfileDetails(),
                              ],
                            ),
                            Positioned(
                              left: 12,
                              top: 2,
                              right: 12,
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
              ),

              // Indicator to expand bottom sheet
              

            ],
          ),
        ),
      
    );
  }
}
