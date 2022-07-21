import 'package:flutter/material.dart';

import '../../themes/app_size.dart';

class BannerView extends StatelessWidget {
  final String picture;
  final carouselHeight = 240.0;

  const BannerView({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
          child: Container(
            height: carouselHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: Dimens.border,
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 148, 156, 240),
                Color.fromARGB(255, 207, 135, 248),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: <BoxShadow>[
                BoxShadow(offset: Offset(1.1, 1.1), blurRadius: 10.0),
              ],
            ),
            child: ClipRRect(
              borderRadius: Dimens.border,
              child: Stack(
                children: [
                  Image.network(picture),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.marginXL, vertical: Dimens.marginXL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Knee Rehab Programme",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "Mon/Thu/Sat",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          "3 sessions per day",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Dimens.marginM),
                          child: Container(
                            padding: const EdgeInsets.all(Dimens.marginM),
                            color: const Color.fromARGB(255, 216, 248, 135),
                            child: Text(
                              "Left Shoulder",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                        Text(
                          "Assigned by",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "Jane Doe",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
