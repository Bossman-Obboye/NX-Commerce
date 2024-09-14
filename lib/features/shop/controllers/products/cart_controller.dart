import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/controllers/products/variation_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/local_storage/storage_utils.dart';

import '../../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Constructor
  CartController() {
    loadCartItems();
  }

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  // Add items in the cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      NxLoaders.customToast(message: 'Select Quantity');
      return;
    }

    // Variation Selected?
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      NxLoaders.customToast(message: 'Select Variation');
      return;
    }

    // Out lof Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        NxLoaders.warningSnackBar(
            message: 'Selected variation is out of stock.', title: 'Oh Snap!');
        return;
      }
    } else {
      if (product.stock < 1) {
        NxLoaders.warningSnackBar(
            message: 'Selected Product is out of stock.', title: 'Oh Snap!');
        return;
      }
    }

    // Covert the ProductModel to a CartItemModel with the given quantity
    final selectedCartItem =
    covertToCartItem(product, productQuantityInCart.value);

    // Check the if already added in the Cart
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == selectedCartItem.productId &&
        cartItem.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // This quantity is already added or Updated/Removed fro the design (Cart)(-)
      cartItems[index].quantity = selectedCartItem.quantity;
    }
    {
      cartItems.add(selectedCartItem);

      updateCart();

      NxLoaders.customToast(
          message: 'Your Product has been added to the Cart.');
    }
  }

  void addOneItemToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == cartItem.productId &&
        cartItem.variationId == cartItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }


  void removeOneItemFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
    cartItem.productId == cartItem.productId &&
        cartItem.variationId == cartItem.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      }
    } else {
      // Show dialog before completely removing
      cartItems[index].quantity == 1 ? removeFromCartDialog(index) : cartItems
          .removeAt(index);
    }

    updateCart();
  }


  /// This function converts a ProductModel to a CartItemModel
  CartItemModel covertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      // Reset Variation in case of single product type.
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
        ? variation.salePrice
        : variation.price
        : product.salePrice > 0.0
        ? product.salePrice
        : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      image: isVariation ? variation.image : product.thumbnail,
      quantity: quantity,
      variationId: variation.id,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  // Update Cart Values
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculateNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems += calculateNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    NxLocalStorage.instance().writeData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    // final cartItemStrings =
    // NxLocalStorage.instance().readData<List<dynamic>>('cartItems');
    // if (cartItemStrings != null) {
    //   // cartItems.assignAll(cartItemStrings
    //   //     .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
    //   updateCartTotals();
    // }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
            (item) =>
        item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        // Remove th item from the cart
        cartItems.removeAt(index);
        updateCart();
        NxLoaders.customToast(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    // If product has no variation than calculate cartEntries and display total number
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productType == ProductType.single.toString()) {
       productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Ge selected variation if any...
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      }else{
        productQuantityInCart.value = 0;
      }
    }
  }
}
