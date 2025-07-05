import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

bool showTextFormField = false;

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextFormField
            ? CustomTextField(
              obscureText: false,
              width: 200.w,
              hintText: "search".tr(),
              height: 55.h,
              onFieldSubmitted: (value) {
                GoRouter.of(

                  context,
                ).pushNamed(AppRoutes.searchResultScreen, extra: value);
              },
            )
            : SizedBox.shrink(),
        IconButton(
          icon: Icon(Icons.search, color: AppColors.primary),
          onPressed: () {
            setState(() {
              showTextFormField = !showTextFormField;
            });
          },
          
        ),
        
      ],
    );
  }
}
