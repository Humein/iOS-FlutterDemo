import 'package:flutter_module/item_model.dart';

class Repo {
  static List<Item> items = new List<Item>();

  // initialize the list, add three items to start
  static void initializeList() {
    items = List<Item>.generate(3, (i) => new Item(i, "Item number $i"));
  }

  // add a new item to the list
  static String addItem() {
    //int ndx = items.length;
    int ndx = getNextIndex();
    String msg;
    msg = "*New* Item number $ndx";
    items.add(new Item(ndx, msg));
    return msg;
  }

  // find the highest index currently in the list
  // and add one to it
  static int getNextIndex() {
    int highNdx = 0;

    for (var x = 0; x < items.length; x++) {
      if (items[x].id > highNdx) highNdx = items[x].id;
    }

    return highNdx + 1;
  }
}
