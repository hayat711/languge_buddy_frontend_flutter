import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_buddy/views/common/custom_btn.dart';
import 'package:language_buddy/views/common/exports.dart';
import 'package:language_buddy/views/common/height_spacer.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select the language you want to learn'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpacer(size: 20),
            const ReusableText(
              text: 'Select Your Native Language:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const HeightSpacer(size: 10),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: 'English',
                  onChanged: (String? newValue) {},
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            const ReusableText(
              text: 'Select Language(s) You Want to Learn:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const HeightSpacer(size: 10),
            Wrap(
              spacing: 12.w,
              runSpacing: 8.h,
              children: [
                _buildLanguageChip('English'),
                _buildLanguageChip('Spanish'),
                _buildLanguageChip('French'),
                _buildLanguageChip('German'),
                _buildLanguageChip('Chinese'),
                _buildLanguageChip('Italian'),
                // Add more language chips as needed
              ],
            ),
            const HeightSpacer(size: 30),
            Center(
              child: CustomButton(
                onTap: () {
                  // Perform language selection logic
                },
                text: 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String language) {
    return ChoiceChip(
      label: Text(language),
      selected: true, // Modify the selection based on user input
      onSelected: (selected) {
        // Handle selection logic
      },
    );
  }
}
