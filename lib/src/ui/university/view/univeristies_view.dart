import 'package:demo_tyba_andres_garcia/src/domains/model/model.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../ui.dart';

class UniveristiesView extends StatelessWidget {
  const UniveristiesView(
    this.config, {
    super.key,
  });

  static const routeName = '/';

  final UniversityConfig config;

  @override
  Widget build(BuildContext context) {
    UniversityPresenter presenter = UniversityPresenter(config: config);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<UniversityModel?>?>(
        future: presenter.getDataAll(),
        builder: (BuildContext context,
            AsyncSnapshot<List<UniversityModel?>?> snapshot) {
          late Widget builder;
          switch (snapshot.connectionState) {
            // Stream is null
            case ConnectionState.none:
              builder = Text(
                'Stream is null',
                style: Theme.of(context).textTheme.headline4,
              );
              break;

            // Stream waitis for first value
            case ConnectionState.waiting:
              builder = Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Loading',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
              break;

            // Stream has not yet finished
            case ConnectionState.active:
              if (snapshot.hasData) {
                var counter_ = snapshot.data!;
                builder = Text(
                  'Loading: $counter_',
                  style: Theme.of(context).textTheme.headline4,
                );
              } else {
                builder = Text(
                  'Loading: No data!',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
              break;

            // Stream has finished
            case ConnectionState.done:
              if (snapshot.hasError) {
                builder = Text(
                  'Completed stream: Error data!',
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (snapshot.hasData) {
                // 'Completed stream: snapshot.data',
                List<UniversityModel?> universities = snapshot.data!;
                builder = ListView.builder(
                  restorationId: 'sampleItemListView',
                  itemCount: universities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final UniversityModel? item = universities[index];

                    return ListTile(
                      title: Text(item!.name),
                      leading: const CircleAvatar(
                        foregroundImage:
                            AssetImage('assets/images/flutter_logo.png'),
                      ),
                      onTap: () {
                        Navigator.restorablePushNamed(
                          context,
                          UniversityItemDetailsView.routeName,
                        );
                      },
                    );
                  },
                );
              } else {
                builder = Text(
                  'Completed stream: No data!',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
              break;
            default:
              builder = const SizedBox.shrink();
          }

          return builder;
        },
      ),
    );
  }
}
