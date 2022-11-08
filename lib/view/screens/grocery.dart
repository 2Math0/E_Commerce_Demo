import 'package:flutter/material.dart';
import 'package:flutter_demo_task/controller/favourite_controller.dart';
import 'package:flutter_demo_task/json_objs.dart';
import 'package:flutter_demo_task/model/address_model.dart';
import 'package:flutter_demo_task/model/ads_banner_model.dart';
import 'package:flutter_demo_task/model/daily_deals_model.dart';
import 'package:get/get.dart';

import '../../model/categories_model.dart';
import '../constants/const_styles.dart';
import '../widgets/bars/ads_banner.dart';
import '../widgets/bars/search_bar.dart';
import '../widgets/items/address_card.dart';
import '../widgets/items/detailed_item.dart';
import '../widgets/items/item_container.dart';
import '../widgets/page_header.dart';

class GroceryPage extends StatelessWidget {
  GroceryPage({Key? key}) : super(key: key);

  final List<AddressElement> addressElementList =
      addressFromJson(addressJson).address;
  final List<Category> categoriesList =
      categoriesFromJson(categoriesJson).categories;
  final List<DayDeal> dailyDealsList =
      dailyDealsFromJson(dailyDealsJson).dayDeals;
  final AdBanner adBanner = adsBannerFromJson(adBannerJson).adBanner;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            size: size,
            location: 'Mustafa St.',
          ),
          const SizedBox(height: 24),
          const SearchBar(),
          const SizedBox(height: 24),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: ListView.builder(
              itemCount: addressElementList.length,
              itemBuilder: (BuildContext context, int index) {
                return AddressCard(
                    size: size,
                    color: addressElementList[index].icon,
                    addressType: addressElementList[index].type,
                    address: addressElementList[index].street,
                    streetNumber: addressElementList[index].streetNumber);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Explore by Category',
                style: kTitleStyle,
              ),
              Text(
                'See All(36)',
                style: kSmallText,
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.width / 4,
            child: ListView.builder(
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context, int index) => ItemContainer(
                  size: size,
                  color: categoriesList[index].icon,
                  name: categoriesList[index].name),
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Deals of the day',
            style: kTitleStyle,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: size.width / 4,
            child: ListView.builder(
              itemCount: dailyDealsList.length,
              itemBuilder: (BuildContext context, int index) {
                final fav = Get.put(FavouriteController());
                return DetailedItem(
                  size: size,
                  color: dailyDealsList[index].icon,
                  name: dailyDealsList[index].name,
                  location: dailyDealsList[index].distance,
                  price: dailyDealsList[index].price,
                  lastPrice: dailyDealsList[index].lastPrice,
                  quantity: dailyDealsList[index].quantity,
                  isFavourite: fav.keys.isNotEmpty
                      ? fav.keys.contains(dailyDealsList[index].name)
                          ? true
                          : dailyDealsList[index].favourite
                      : dailyDealsList[index].favourite,
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 24),
          AdsBanner(
              size: size,
              color: adBanner.icon,
              subText: adBanner.subText,
              title: adBanner.title,
              price: adBanner.price,
              lastPrice: adBanner.lastPrice,
              endDate: adBanner.endDate,
              textColor: adBanner.textColor)
        ],
      ),
    );
  }
}
