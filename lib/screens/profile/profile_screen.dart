import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:e_commerce/constants/spaces.dart';
import 'package:e_commerce/widgets/custom_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShade1,
      body: SafeArea(
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
              const SpaceH20(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(EvaIcons.listOutline),
                      title: const Text("All My Orders"),
                      trailing: Container(
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
                    ),
                    ListTile(
                      leading: const Icon(EvaIcons.shoppingBag),
                      title: const Text("Pending Shipment"),
                      trailing: Container(
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
