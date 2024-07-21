import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app_colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<MyProvider>(context);
    Locale currentLocale = context.locale;
    return Container(
      // height: MediaQuery.of(context).size.height * 0.80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(const Locale("en"));
              // provider.changeLanguage(context,"en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: currentLocale == const Locale('en')
                          ? AppColors.primary
                          : AppColors.colorBlack),
                ),
                currentLocale == const Locale('en')
                    ? const Icon(
                  Icons.done,
                  size: 35,
                )
                    : const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              // provider.changeLanguage(context,"ar");
              context.setLocale(const Locale("ar"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: currentLocale != const Locale('en')
                            ? AppColors.primary
                            : AppColors.colorBlack)),
                currentLocale != const Locale('en')
                    ? const Icon(
                  Icons.done,
                  size: 35,
                )
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}