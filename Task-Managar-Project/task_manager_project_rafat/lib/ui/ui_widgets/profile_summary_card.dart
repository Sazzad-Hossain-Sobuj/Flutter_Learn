import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_project_rafat/ui/ui_screens/edit_profile_screen.dart';

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
              MaterialPageRoute(builder: (context) => EditProfileScreen()));
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