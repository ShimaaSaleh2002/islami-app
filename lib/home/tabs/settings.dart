import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../bottom_sheets/language_bottom_sheet.dart';
import '../bottom_sheets/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "theme".tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Text(
                pro.appTheme == ThemeMode.dark ? "dark".tr() : "light".tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "language".tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Text(
                "english".tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}