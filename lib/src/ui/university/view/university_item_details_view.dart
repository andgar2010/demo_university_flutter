import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../../domains/domains.dart';
import '../../ui.dart';

class UniversityItemDetailsView extends StatelessWidget {
  const UniversityItemDetailsView(
    this.config, {
    this.itemUniverity,
    super.key,
  });
  static const routeName = '/university_item';

  final UniversityConfig config;
  final UniversityModel? itemUniverity;

  @override
  Widget build(BuildContext context) {
    late UniversityPresenter presenter = UniversityPresenter(config: config);
    return ChangeNotifierProvider.value(
      value: presenter,
      child: Consumer<UniversityPresenter>(
        builder: (context, presenter, _) {
          return _buildPage(context);
        },
      ),
    );
  }

  Scaffold _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
