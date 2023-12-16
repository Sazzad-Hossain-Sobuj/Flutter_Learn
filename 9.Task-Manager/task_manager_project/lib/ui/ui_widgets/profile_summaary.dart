import 'package:flutter/material.dart';
import '../ui_screens/edit_profile_screen.dart';

class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key, this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (enableOnTap) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditProfileScreen()));
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text('Sazzad Hosain',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
      subtitle: const Text('sazzadsobuj62@gmail.com',style: TextStyle(color: Colors.white,),),
      tileColor: Colors.teal,
      trailing: enableOnTap? const Icon(Icons.arrow_forward): null,
    );
  }
}