import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'package:flutter_shoppingcart/mvvm/view_models/item_view_model.dart';
import 'package:provider/provider.dart';

class ShoppingcartDetail extends StatelessWidget {
  const ShoppingcartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                _buildDetailNameAndPrice(viewModel),
                _buildDetailRatingAndReviewCount(viewModel),
                _buildDetailColorOptions(context, viewModel),
                _buildDetailButton(context, viewModel),
              ],
            ),
          ),
        );
      },
    );
  } // end of build

  Widget _buildDetailNameAndPrice(ItemViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          viewModel.selectedItem.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${viewModel.selectedItem.price}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildDetailRatingAndReviewCount(ItemViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          ...List.generate(
            viewModel.selectedItem.rating.toInt(),
                (index) => Icon(Icons.star, color: Colors.yellow),
          ),
          Spacer(),
          Text('Review '),
          Text(
            '(${viewModel.selectedItem.reviewCount})',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions(BuildContext context, ItemViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color Options'),
          SizedBox(height: 10),
          Row(
            children: viewModel.selectedItem.colorOptions.asMap().entries.map((entry) {
              int index = entry.key;
              Color color = entry.value;
              return _buildDetailIcon(context, index, viewModel);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildDetailIcon(BuildContext context, int index, ItemViewModel viewModel) {
    bool isSelected = index == viewModel.selectedId; // Assuming color selection tied to item selection
    Color color = viewModel.selectedItem.colorOptions[index];
    return GestureDetector(
      onTap: () {
        // If color selection is needed separately, modify ViewModel accordingly
        // For simplicity, assuming color selection is tied to item selection
        // Otherwise, you might need a separate selectedColorIndex in ViewModel
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: isSelected ? kAccentColor : Colors.grey,
                  width: isSelected ? 3.0 : 1.0,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: ClipOval(
                child: Container(
                  color: color,
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context, ItemViewModel viewModel) {
    return Align(
      child: TextButton(
        onPressed: () {
          // alert dialog 사용법
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('장바구니에 담으시겠습니까?'),
                actions: [
                  CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                        // 추가 로직 필요 시 ViewModel에 구현
                        _addToCart(context, viewModel);
                      },
                      child: Text('확인')),
                ],
              );
            },
          );
        },
        style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        child: const Text(
          'Add to Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, ItemViewModel viewModel) {
    // 실제 장바구니 추가 로직 구현
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('장바구니에 추가됨'),
          content: Text('${viewModel.selectedItem.name}이(가) 장바구니에 추가되었습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
