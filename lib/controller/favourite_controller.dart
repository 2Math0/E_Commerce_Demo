import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../view/widgets/items/detailed_item.dart';

class FavouriteController extends GetxController {
  final Map _favourites = {};

  Map get favourites => _favourites;
  List get keys => _favourites.keys.toList();

  void addToFavourites(DetailedItem detailedItem) {
    detailedItem.isFavourite = true;
    _favourites[detailedItem.name] = detailedItem;
    update();
  }

  void removeFromFavourites(String key) {
    _favourites.remove(key);
    update();
  }
}
