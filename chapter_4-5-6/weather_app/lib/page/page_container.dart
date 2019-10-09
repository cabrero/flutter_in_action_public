import 'package:flutter/material.dart';
import 'package:weather_app/models/src/app_settings.dart';
import 'package:weather_app/models/src/countries.dart';
import 'package:weather_app/page/forecast_page.dart';
import 'package:weather_app/page/settings_page.dart';
import 'package:weather_app/styles.dart';
import 'package:weather_app/utils/forecast_animation_utils.dart' as utils;

class PageContainer extends StatefulWidget {
  const PageContainer({Key key, this.settings}) : super(key: key);

  final AppSettings settings;

  @override
  _PageContainerState createState() => _PageContainerState(settings);
}

class _PageContainerState extends State<PageContainer> {
  _PageContainerState(this.settings);

  AppSettings settings;

  PopupMenuButton citiesMenu() {
    return PopupMenuButton(
        elevation: 0.0,
        icon: Icon(
          Icons.location_city,
          color: AppColor.textColorDark,
        ),
        onSelected: (selection) {
          setState(() {
            settings.activeCity =
                allAddedCities.firstWhere((city) => city.name == selection);
          });
        },
        itemBuilder: (BuildContext context) {
          return allAddedCities
              .where((city) => city.active)
              .map((City city) => PopupMenuItem(
                    value: city.name,
                    child: Text(city.name),
                  ))
              .toList();
        });
  }

  FlatButton settingsButton() {
    return FlatButton(
        child: Text(
          utils.temperatureLabels[settings.selectedTemperature],
          style: Theme.of(context).textTheme.headline,
        ),
        onPressed: _showSettingsPage);
  }

  void _showSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
              settings: settings,
            ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ForecastPage(
      menu: citiesMenu(),
      settingsButton: settingsButton(),
      settings: settings,
    );
  }
}
