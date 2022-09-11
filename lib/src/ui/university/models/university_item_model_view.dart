library university;

import 'package:flutter/material.dart' show IconData;

class UniversityItemModelView {
  UniversityItemModelView({
    this.leadingIcon,
    this.label,
    this.trailingIcon,
    this.route,
  });

  IconData? leadingIcon;
  String? label;
  IconData? trailingIcon;
  String? route;
}
