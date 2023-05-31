import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:language_buddy/views/common/custom_textfeild.dart';
import 'package:language_buddy/views/common/exports.dart';


class SearchBuddy extends StatefulWidget {
  const SearchBuddy({Key? key}) : super(key: key);

  @override
  State<SearchBuddy> createState() => _SearchBuddyState();
}

class _SearchBuddyState extends State<SearchBuddy> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange.shade800,
          iconTheme: IconThemeData(color: Colors.grey.shade700),
        title:  CustomTextField(
          hintText: 'Search for a member',
          suffixIcon: GestureDetector(
            child: const Icon(AntDesign.search1),
            onTap: (){
              setState(() {});
            },
          ),
          controller: search,
          keyboardType: TextInputType.text,
        ),
        elevation: 0,
      ),
      body:  Padding(padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/optimized_search.png'),
          ReusableText(
            text: 'Search for a language buddy',
            style: appstyle(24, Colors.deepOrangeAccent.withOpacity(0.6), FontWeight.w500)
          ),
        ],
      ),
      ),
    );
  }
}