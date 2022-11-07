import 'package:flutter/material.dart';
import 'package:flutter_demo_task/ui/constants/const_colors.dart';
import 'package:flutter_demo_task/ui/constants/const_styles.dart';

import '../widgets/bars/ads_banner.dart';
import '../widgets/bars/search_bar.dart';
import '../widgets/items/address_card.dart';
import '../widgets/items/detailed_item.dart';
import '../widgets/items/item_container.dart';
import '../widgets/page_header.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({Key? key}) : super(key: key);

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AddressCard(
                  size: size,
                  addressType: 'Home Address',
                  color: kLightBrownColor83,
                  address: 'Mustafa St. NO:2',
                  streetNumber: 'Street x12',
                ),
                AddressCard(
                  size: size,
                  addressType: 'Office Address',
                  color: kLightBrownColor83,
                  address: 'Mustafa St. NO:2',
                  streetNumber: 'Street x12',
                ),
                AddressCard(
                  size: size,
                  addressType: 'Home Address',
                  color: kLightBrownColor83,
                  address: 'Mustafa St. NO:2',
                  streetNumber: 'Street x12',
                ),
              ],
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ItemContainer(
                    size: size, color: kLightPinkColor83, name: 'Steak'),
                ItemContainer(
                    size: size, color: kYellowColor83, name: 'Vegetables'),
                ItemContainer(
                    size: size, color: kPurpleColor83, name: 'Beverage'),
                ItemContainer(size: size, color: kBlueColor83, name: 'Fish'),
                ItemContainer(size: size, color: kPinkColor83, name: 'Juice'),
              ],
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
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DetailedItem(
                  size: size,
                  color: kLightBrownColor83,
                  name: 'Summer Sun Ice Cream Pack',
                  lastPrice: 18,
                  location: '15 minutes',
                  price: 12,
                  quantity: 5,
                ),
                DetailedItem(
                  size: size,
                  color: kGreenColor83,
                  name: 'Summer Sun Ice Cream Pack',
                  lastPrice: 18,
                  location: '15 minutes',
                  price: 12,
                  quantity: 5,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          AdsBanner(
              size: size,
              color: kLightPinkColor83,
              subText: 'Mega',
              title: 'Whopper',
              price: 17,
              lastPrice: 32,
              endDate: '24 December 2020',
              textColor: kPurpleTextColor83)
        ],
      ),
    );
  }
}
