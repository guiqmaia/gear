import 'package:flutter/material.dart';
import 'package:gear/presenter/profile/profile_page.dart';


import 'widgets/edit_profile_body.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return EditProfileBody();
  }
}
