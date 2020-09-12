import 'package:app/src/core/styles.dart';
import 'package:app/src/modules/auth/presentation/signup/country_picker/controller.dart';
import 'package:flutter/material.dart';
import 'package:country_provider/country_provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CountryPicker extends WidgetModule {
  @override
  List<Bind> get binds => [Bind((_) => CountryPickerController())];

  @override
  Widget get view => _CountryPicker();
}

class _CountryPicker extends StatefulWidget {
  const _CountryPicker({Key key}) : super(key: key);
  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState
    extends ModularState<_CountryPicker, CountryPickerController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: controller.appBarTitle,
          leading: BackButton(color: Colors.black),
          backgroundColor: AppTheme.backgroundColor,
          elevation: controller.elevation,
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 18.0),
              icon: controller.actionIcon,
              onPressed: () =>
                  controller.changeAppBarTitle(controller.searching),
            ),
          ],
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        body: (controller.searching == true && controller.searchQuery.isEmpty)
            ? Container()
            : FutureBuilder<List<Country>>(
                future: controller.searching == false
                    ? CountryProvider.getAllCountries()
                    : CountryProvider.getCountriesByName(
                        controller.searchQuery.toLowerCase()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppTheme.primaryColor),
                      ),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data.isEmpty) {
                    return Center(
                      child: Container(
                        child: Text('No results found !'),
                      ),
                    );
                  }
                  final _countries = snapshot.data;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: ListView(children: <Widget>[
                      for (var country in _countries)
                        GestureDetector(
                          onTap: () => Modular.to.pop(country),
                          child: Column(
                            children: [
                              ListTile(
                                leading: country.flag != null
                                    ? Container(
                                        width: 32,
                                        height: 32,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'icons/flags/png/${country.alpha2Code.toLowerCase()}.png',
                                            fit: BoxFit.fill,
                                            package: 'country_icons',
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.grey,
                                      ),
                                title: Text(
                                  country.name,
                                ),
                              ),
                              if (country != _countries.last) Divider(),
                            ],
                          ),
                        )
                    ]),
                  );
                },
              ),
      ),
    );
  }
}

enum CONTRY_PICKER_TYPE { PHONE_CODE, CONTRY }
