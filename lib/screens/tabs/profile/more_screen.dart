import 'package:e_commerce/constants/adaptive.dart';
import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_header.dart';
import 'package:e_commerce/widgets/custom_listTile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShade1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeader(
                  title: "More",
                ),
                const SpaceH24(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: "Shipping Address",
                        iconData: EvaIcons.pinOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Payment Method",
                        iconData: EvaIcons.creditCardOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Currency",
                        iconData: Icons.payments_outlined,
                        value: "USD",
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Language",
                        value: "English",
                        iconData: Icons.language_outlined,
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
                const SpaceH24(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CustomListTile(
                        title: "Notification Settings",
                        iconData: EvaIcons.bellOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Privacy Policy",
                        iconData: EvaIcons.shieldOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Frequently Ask Questions",
                        iconData: EvaIcons.questionMarkCircleOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Legal Information",
                        iconData: EvaIcons.fileTextOutline,
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
                const SpaceH16(),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed('/');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.red.withOpacity(.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.logOutOutline,
                        color: Colors.red.withOpacity(.7),
                      ),
                      const SpaceW8(),
                      Text(
                        "LOG OUT",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: widthOfScreen(context),
                //   child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
