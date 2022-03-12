import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_listTile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShade1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://scontent.flyp1-1.fna.fbcdn.net/v/t1.6435-9/173891180_1423854754635422_619427205903090101_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_eui2=AeGb5HaU4ynJUzyQKKWz2w5VsUxlFtZl8i2xTGUW1mXyLXoZtp8W1ln6sSgngjD96A1BqmS339dfdrTjmEVFZ1A8&_nc_ohc=S5rTkS5NuAcAX_E90lh&tn=1s4yMSH6qsZ1M1zB&_nc_ht=scontent.flyp1-1.fna&oh=00_AT-FQhiVVfS7hDL-bfiJ2sB2oATqJRKwJKMSOnXTVEEHhw&oe=62483D56",
                      ),
                    ),
                    const SpaceW12(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chand Abdullah",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          "chandabdullah.nls@gmail.com",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: AppColors.secondaryColor,
                              ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                              horizontal: 20,
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Edit Profile",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: AppColors.secondaryColor,
                                    ),
                          ),
                        ),
                      ],
                    )
                  ],
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
                        title: "All My Orders",
                        iconData: EvaIcons.listOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Pending Shipment",
                        iconData: EvaIcons.shoppingBagOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Pending Payments",
                        iconData: EvaIcons.creditCardOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Finished Orders",
                        iconData: EvaIcons.checkmarkSquare2Outline,
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
                        title: "Invite Friends",
                        iconData: EvaIcons.inboxOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Customer Support",
                        iconData: EvaIcons.headphonesOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Rate Our App",
                        iconData: EvaIcons.starOutline,
                        ontap: () {},
                      ),
                      CustomListTile(
                        title: "Make a Suggestion",
                        iconData: EvaIcons.edit2Outline,
                        ontap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
