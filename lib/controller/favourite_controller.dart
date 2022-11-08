import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/widgets/items/detailed_item.dart';

class FavouriteController extends GetxController {
  final Map _favourites = {};

  Map get favourites => _favourites;

  void addToFavourites(DetailedItem detailedItem) {
    _favourites[detailedItem.name] = detailedItem;
    update();
  }

  void removeFromFavourites(String key) {
    _favourites.remove(key);
    update();
  }
}
