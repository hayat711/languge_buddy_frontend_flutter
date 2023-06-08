import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';

class ShowProfileDetails extends StatelessWidget {
  const ShowProfileDetails({
    Key? key,
    required this.userName,
    required this.userLang,
    required this.userBio,
    required this.userAvatar,
    required this.age,
    required this.userLocation,
  }) : super(key: key);

  final String userName;
  final String userLang;
  final String userBio;
  final String userAvatar;
  final int age;
  final String userLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // User profile details
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: SizedBox(
                  child: Row(
                    children: [
                      const SizedBox(width: 22),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          '$userName  ($age years)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  '$userLocation',
                  style:  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child:  Row(
              children:  [
                 Icon(
                  Icons.language,
                  color: primaryColor,
                  size: 16,
                ),
                 SizedBox(width: 8),
                 Text(
                  'Languages:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child:  Row(
              children:  [
                const SizedBox(width: 8),
                Text(
                  'Know:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Text(
                  ' $userLang, English',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            child:  Row(
              children:  [
                const SizedBox(width: 8),
                Text(
                  'Want to learn:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Text(
                  ' Korean, Japanese, Arabic, Persian',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
               const Icon(
                  Icons.info,
                  color: primaryColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'About: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child:  Row(
              children:  [
                const SizedBox(width: 8),
                Text(
                  userBio,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: accentColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Interests',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child:  Row(
              children:  [
                const SizedBox(width: 8),
                Text(
                  'Language Exchange, Football, Music, Movies, Traveling, Reading.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
