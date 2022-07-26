import 'package:flutter/material.dart';
import 'package:gear/presenter/edit_profile_page/widgets/non_changable_container.dart';
import 'package:gear/presenter/edit_profile_page/widgets/non_editable_container_list.dart';
import '../../../core/app_getit.dart';
import 'btn_edit_user.dart';
import 'wrap_textfield_edit_user.dart';
import '../../../shared/widgets/top_bar_app.dart';

class BodyEditProfile extends StatefulWidget {
  const BodyEditProfile({Key? key}) : super(key: key);

  @override
  State<BodyEditProfile> createState() => _BodyEditProfileState();
}

class _BodyEditProfileState extends State<BodyEditProfile> {
  TextEditingController telephoneController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: 'Editar Perfil',
            pageRoute: null,
            isProfile: true,
          ),
          const NonEditableContainerList(),
          WrapTextFieldEditUser(
            telephoneController: telephoneController,
            mobileNumberController: mobileNumberController,
            cepController: cepController,
            adressController: adressController,
          ),
          BtnEditUser(
            userId: logedUser.id!,
            telephoneController: telephoneController,
            mobileNumberController: mobileNumberController,
            cepController: cepController,
            adressController: adressController,
          ),
        ],
      ),
    );
  }
}
