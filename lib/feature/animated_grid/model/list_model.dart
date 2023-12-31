import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../animated_list/model/list_model.dart';

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedGridState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedGridState? get _animatedGrid => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedGrid!.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedGrid!.removeItem(
        index,
            (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}