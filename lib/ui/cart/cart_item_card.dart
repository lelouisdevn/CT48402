import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../shared/dialog_utils.dart';

// 
class CartItemCard extends StatelessWidget {
  final String productId;
  final CartItem cardItem;

  const CartItemCard({
    required this.productId,
    required this.cardItem,
    super.key,
  });

// xây dựng một card 
  @override
  Widget build(BuildContext context) {
    return Dismissible( // lướt sang trái để loại bỏ -> icon delete or such thing

      key: ValueKey(cardItem.id),

      // background ở bên dưới của một cartItem 
      background: Container(
        color: Theme.of(context).errorColor, //red
        alignment: Alignment.centerRight, 
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon( //icon delete
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),


      direction: DismissDirection.endToStart,  //phải sang trái

      // comfirm to dismiss
      confirmDismiss: (direction) {
        return showComfirmDialogue(
          context,
          'Do you want to remove this item from the cart?',
        );
      },

      //sau khi loại bỏ -> print on the console;
      onDismissed: (direction) {
        print('Cart item dismissed');
      },

      child: buildItemCard(), //foreground is on the background ofc wt* :>
    );
  }


// xây dựng "foreground"
  Widget buildItemCard() {

    // a card 
    return Card(
      // tạo margin
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),



      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(

          // hình tròn bên trái
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${cardItem.price}'),
              ),
            ),
          ),

          //tiêu đề
          title: Text(cardItem.title),

          //tiêu đề con
          subtitle: Text('Total: \$${cardItem.price * cardItem.quantity}'),

          //bên phải cùng
          trailing: Text('${cardItem.quantity} x'),
        ),
      ),
    );
  }
}
