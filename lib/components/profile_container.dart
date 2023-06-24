import 'package:chromatica/components/gaps.dart';
import 'package:chromatica/screens/update_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {

  final shouldShowEdit;
  final text;
  final title;

  IconData icon;
   ProfileContainer({
    required this.shouldShowEdit,
    required this.title,
    required this.text,
    required this.icon,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Icon(
               icon,
               size: 30, 
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title",style: font1b(),),
                const SizedBox(height: 5),
                Text("$text",style: font1(),),
              ],
            ),

            const Spacer(),

            GestureDetector(
              onTap: () {
                if(shouldShowEdit){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateUserEmailScreen()));
                } 
              },
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  color: shouldShowEdit ? Theme.of(context).colorScheme.tertiary : Colors.transparent,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  
  
}