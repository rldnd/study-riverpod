import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/model/shopping_item_model.dart';
import 'package:study_riverpod/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where(
          (item) =>
              filterState == FilterState.spicy ? item.isSpicy : !item.isSpicy,
        )
        .toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
