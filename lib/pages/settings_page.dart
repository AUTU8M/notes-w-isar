import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp_isar/theme/themedata_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          //darkmode
          Text("Dark Mode"),

          //switch
          CupertinoSwitch(
            value:
                Provider.of<ThemedataProvider>(
                  context,
                  listen: false,
                ).isDarkMode,
            onChanged:
                (value) =>
                    Provider.of<ThemedataProvider>(
                      context,
                      listen: false,
                    ).toggleTheme(),
          ),
        ],
      ),
    );
  }
}
