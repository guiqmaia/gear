import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/top_bar_app.dart';
import 'listview_signup.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopBarApp(
            title: 'Cadastre-se',
            isProfile: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: const ListViewSignUp(),
          ),
        ],
      ),
    );
  }
}
