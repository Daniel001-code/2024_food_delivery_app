import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_quantity_selector.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food image
                        Image.asset(
                          cartItem.food.imgPath,
                          height: 100,
                          width: 100,
                        ),

                        const SizedBox(
                          width: 10,
                        ),
                        // name and price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // food name
                            Text(cartItem.food.name),

                            // food price
                            Text('\$' + cartItem.food.price.toString()),
                          ],
                        ),

                        Spacer(),
                        // increment or decrement quantity
                        QuantitySelector(
                            food: cartItem.food,
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            },
                            onIncrement: () {
                              restaurant.addToCart(
                                cartItem.food,
                                cartItem.selectedAddons,
                              );
                            },
                            quantity: cartItem.quantity)
                      ],
                    ),
                  ),

                  // addons
                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      scrollDirection: Axis.horizontal,
                      children: cartItem.selectedAddons
                          .map((addon) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Row(
                                    children: [
                                      // addon name
                                      Text(addon.name),

                                      // addon price
                                      Text(
                                        '(\$${addon.price.toString()})',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  onSelected: (value) {},
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontSize: 12,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}
