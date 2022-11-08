import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controller/favourite_controller.dart';
import 'package:flutter_demo_task/view/widgets/page_header.dart';
import 'package:get/get.dart';

import '../constants/const_styles.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key? key}) : super(key: key);

  final favouriteController = Get.find<FavouriteController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(size: size, location: 'Oxford Street'),
          const SizedBox(height: 32),
          const Text(
            'Favourites',
            style: kTitleStyle,
          ),
          GetBuilder<FavouriteController>(builder: (controller) {
            List favouritesList = controller.favourites.values.toList();
            return favouritesList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: favouritesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: favouritesList[index]);
                    },
                  )
                : const Center(
                    child: Text(
                      'No Favourite Items yet!',
                      style: kNormalText,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
