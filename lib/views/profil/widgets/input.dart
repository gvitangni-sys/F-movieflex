import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';
import 'package:movieflex/views/profil/widgets/pages/edith_page.dart';
import 'package:movieflex/views/profil/widgets/pages/helpcenter.dart';
import 'package:movieflex/views/profil/widgets/pages/notification.dart';
import 'package:movieflex/views/profil/widgets/pages/privacy.dart';
import 'package:movieflex/views/profil/widgets/pages/secutity.dart';
import 'package:movieflex/views/profil/widgets/pages/settingdownload.dart';
import 'package:movieflex/views/profil/widgets/profile_option_tile.dart';

class MyInputs extends StatefulWidget {
  const MyInputs({super.key});

  @override
  State<MyInputs> createState() => _MyInputsState();
}

class _MyInputsState extends State<MyInputs> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        children: profileOptions.map((option) {
          if (option.isSwitch) {
            return ProfileOptionTile(
              option: option,
              trailing: Switch(
                value: isDarkMode,
                activeTrackColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            );
          }

          return ProfileOptionTile(
            option: option,
            onTap: () {
              Widget? pageDestination;

              // Redirection selon le titre de l'option
              switch (option.title) {
                case "Edit Profile":
                  pageDestination = const EdithPage(title: "Edit Profile");
                  break;
                case "Notification":
                  pageDestination = const NotifcationPage(title: "");
                  break;
                case "Download":
                  pageDestination = const SettingDownload(title: "");
                  break;
                case "Security":
                  pageDestination = const SecurityPage(title: "");
                  break;
                case "Help Center":
                  pageDestination = const HelpPage();
                  break;
                case "Privacy Policy":
                  pageDestination = const PrivacyPage(title: "");
                  break;
              }

              if (pageDestination != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pageDestination!),
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
