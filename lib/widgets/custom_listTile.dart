import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.ontap,
    this.value,
  }) : super(key: key);

  String title;
  IconData iconData;
  String? value;
  Function() ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.fade,
      ),
      trailing: Wrap(
        spacing: 12,
        children: [
          if (value != null) Text(value!),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.greyShade1,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              EvaIcons.arrowIosForwardOutline,
              color: Colors.black,
              size: 19,
            ),
          ),
        ],
      ),
      onTap: ontap,
    );
  }
}
