import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_widget.dart';
import 'core/app_getit.dart';

void main() {
  setupGetIt();
  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
