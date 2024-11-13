import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'package:flutter_shoppingcart/mvvm/view_models/item_view_model.dart';
import 'package:provider/provider.dart';

class ShoppingcartHeader extends StatelessWidget {
  const ShoppingcartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            _buildHeaderPic(viewModel),
            _buildHeaderSelector(context, viewModel),
          ],
        );
      },
    );
  }

  Widget _buildHeaderPic(ItemViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          viewModel.selectedItem.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector(BuildContext context, ItemViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: viewModel.items.asMap().entries.map((entry) {
          int id = entry.key;
          var item = entry.value;
          return _buildHeaderSelectorButton(context, id, item.icon, viewModel);
        }).toList(),
      ),
    );
  }

  Widget _buildHeaderSelectorButton(BuildContext context, int id, IconData iconData, ItemViewModel viewModel) {
    bool isSelected = id == viewModel.selectedId;
    return GestureDetector(
      onTap: () {
        viewModel.selectItem(id);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? kAccentColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          iconData,
          color: Colors.white, // 아이콘 색상을 필요에 따라 조정
        ),
      ),
    );
  }
}
