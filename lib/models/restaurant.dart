import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    // burger
    Food(
      name: 'Classic cheeseburger',
      imgPath: 'assets/images/burgers/burger1.png',
      description:
          'A juicy beef potty with melted chadder, lattuce, tomato, and a hint onion and pickle.',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      imgPath: 'assets/images/burgers/burger2.png',
      description:
          'Smoky BBQ source, crispy bacon, and onion rings make this beef burger a savory.',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
        Addon(name: 'Avocado', price: 1.99),
      ],
    ),
    Food(
      name: 'veggie burger',
      imgPath: 'assets/images/burgers/burger3.png',
      description:
          'A hearty veggie patty topped with fresh avocado, lettuce, and tomato, served.',
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'grilled Onions', price: 0.99),
        Addon(name: 'Jalapenus', price: 1.49),
        Addon(name: 'Extra BBQ sauce', price: 1.99),
      ],
    ),
    Food(
      name: 'Aloha Burger',
      imgPath: 'assets/images/burgers/burger4.png',
      description:
          'A char-grilled chicken breast topped with a slice of grilled pineapple.',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Toriyaki Glaze', price: 0.99),
        Addon(name: 'Extra Pineapple', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),

    // salads
    Food(
      name: 'Ceaser Salad',
      imgPath: 'assets/images/salads/salad1.png',
      description:
          'Crisp romaine lettuce, parmesan cheese, croutons, and Ceaser dressing.',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chiken', price: 0.99),
        Addon(name: 'Anchovies', price: 0.99),
        Addon(name: 'Extra Parmesan', price: 1.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      imgPath: 'assets/images/salads/salad2.png',
      description:
          'Tomatoes, cucumbers, red onions, olives, feta cheese with olive oil and herbs.',
      price: 0.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Feta Cheese', price: 0.99),
        Addon(name: 'Kalanata Olives', price: 1.49),
        Addon(name: 'Grilled Shrine', price: 1.99),
      ],
    ),
    Food(
      name: 'Quinea Salad',
      imgPath: 'assets/images/salads/salad3.png',
      description:
          'Quinea mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette.',
      price: 0.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Avocado', price: 0.99),
        Addon(name: 'Feta Cheese', price: 1.49),
        Addon(name: 'Grilled Chicken', price: 1.99),
      ],
    ),
    Food(
      name: 'Asian Sesane Salad',
      imgPath: 'assets/images/salads/salad4.png',
      description:
          'Delight in the flavors of the best with this sesame-infused salad.',
      price: 0.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Mandarine Oranges', price: 0.99),
        Addon(name: 'Almond Slivers', price: 1.49),
        Addon(name: 'Extra Teriyaki Chicken', price: 1.99),
      ],
    ),
    // sides
    Food(
      name: 'Sweet Potato Fries',
      imgPath: 'assets/images/sides/side1.png',
      description: 'Crispy sweet potato fries with a touch of salt.',
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese Sauce', price: 0.99),
        Addon(name: 'Truffle Oil', price: 1.49),
        Addon(name: 'Cajun Spice', price: 1.99),
      ],
    ),
    Food(
      name: 'Onion Rings',
      imgPath: 'assets/images/sides/side2.png',
      description: 'Golden and crispy onion rings, perfect for dipping.',
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Ranch Dip', price: 0.99),
        Addon(name: 'Spicy Mayo', price: 1.49),
        Addon(name: 'Parmesan Dust', price: 1.99),
      ],
    ),
    Food(
      name: 'Galice Bread',
      imgPath: 'assets/images/sides/side3.png',
      description:
          'Warm and toasty garlic bread, topped with melted butter and parsley.',
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Galic', price: 0.99),
        Addon(name: 'Mozzarella Cheese', price: 1.49),
        Addon(name: 'Marinara Dip', price: 1.99),
      ],
    ),
    Food(
      name: 'Loaded Sweet Potato Fries',
      imgPath: 'assets/images/sides/side4.png',
      description:
          'Savery Sweet potato fries loaded with melted cheese, smoky bacon bits, and more.',
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Sour Cream', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.49),
        Addon(name: 'Green Onions', price: 0.99),
      ],
    ),

    // desserts
    Food(
      name: 'Chocolate Brownie',
      imgPath: 'assets/images/desserts/dessert1.png',
      description:
          'Rich and fudgy chocolate brownie, with chunks of chocolate.',
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 0.99),
        Addon(name: 'Hot Fudge', price: 1.49),
        Addon(name: 'Whipped Cream', price: 1.99),
      ],
    ),
    Food(
      name: 'Cheesecake',
      imgPath: 'assets/images/desserts/dessert2.png',
      description:
          'Creamy cheesecake on a graham cracker crust, with a berry compote.',
      price: 6.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Strawberry Tooping', price: 0.99),
        Addon(name: 'Blueberry Compote', price: 1.49),
        Addon(name: 'Chocolate Chips', price: 1.99),
      ],
    ),
    Food(
      name: 'Apple Pie',
      imgPath: 'assets/images/desserts/dessert3.png',
      description:
          'Classic apple pie with a flaky crust and a cinnaron-spiced apple filling.',
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Caramel Sauce', price: 0.99),
        Addon(name: 'Vanilla Ice Cream', price: 1.49),
        Addon(name: 'Cinnaron spice', price: 1.99),
      ],
    ),
    Food(
      name: 'Red Velvet Lava Cake',
      imgPath: 'assets/images/desserts/dessert4.png',
      description:
          'A deleciable red velvet cake with a warm, gooey chocolate lava center.',
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Raspberry Sauce', price: 0.99),
        Addon(name: 'Cream Cheese Icing', price: 1.49),
        Addon(name: 'Chocolate Sprinkles', price: 0.99),
      ],
    ),
    // drinks
    Food(
      name: 'Orange juice',
      imgPath: 'assets/images/drinks/drink1.png',
      description:
          'A well squized orange juice suitable for the ocassion and increase relaxation.',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Flavor', price: 0.99),
        Addon(name: 'Mint leaves', price: 1.49),
        Addon(name: 'Ginger Zest', price: 1.99),
      ],
    ),
    Food(
      name: 'Ice Pepsi',
      imgPath: 'assets/images/drinks/drink2.png',
      description:
          'Cold soft drink with lime water and ice cubes in a well poised glass.',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Flavor', price: 0.99),
        Addon(name: 'Mint leaves', price: 1.49),
        Addon(name: 'Ginger Zest', price: 1.99),
      ],
    ),
    Food(
      name: 'Red bull',
      imgPath: 'assets/images/drinks/drink3.png',
      description: 'Energy drink to boost and increase your energy.',
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Flavor', price: 0.99),
        Addon(name: 'Mint leaves', price: 1.49),
        Addon(name: 'Ginger Zest', price: 1.99),
      ],
    ),
    Food(
      name: 'Fanta',
      imgPath: 'assets/images/drinks/drink4.png',
      description: 'Soft drink for confort and relaxation.',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Flavor', price: 0.99),
        Addon(name: 'Mint leaves', price: 1.49),
        Addon(name: 'Ginger Zest', price: 1.99),
      ],
    ),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

/* 
O P E R A T I O N S
*/

// user cart
  final List<CartItem> _cart = [];

// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
// see if there is a cart item already with the same item and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

// if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

// remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

// get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

// get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
/*
H E L P E R S
 */

// generate a receipt

// format double value into money

// format List of addons into a string summary
}
