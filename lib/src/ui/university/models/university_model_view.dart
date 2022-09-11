library university;

import 'university_item_model_view.dart';

class UniversityModelView {
  UniversityModelView({
    this.title,
    this.items,
    this.subtitle,
  });

  List<UniversityItemModelView>? items;
  String? subtitle;
  String? title;
}
