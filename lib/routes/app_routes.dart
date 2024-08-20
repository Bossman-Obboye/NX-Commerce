import 'package:get/get.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/login.dart';
import 'package:nx_commerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:nx_commerce/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:nx_commerce/features/authentication/screens/signup/signup.dart';
import 'package:nx_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:nx_commerce/features/personalization/screens/profile/profile.dart';
import 'package:nx_commerce/features/personalization/screens/settings/settings.dart';
import 'package:nx_commerce/features/shop/screens/address/address.dart';
import 'package:nx_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:nx_commerce/features/shop/screens/cart/cart_screen.dart';
import 'package:nx_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:nx_commerce/features/shop/screens/home/home_screen.dart';
import 'package:nx_commerce/features/shop/screens/order/order.dart';
import 'package:nx_commerce/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:nx_commerce/features/shop/screens/store/store.dart';
import 'package:nx_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:nx_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:nx_commerce/routes/routes.dart';

class NxAppRoutes {
  static final pages = [
    GetPage(name: NxRoutes.home, page: () => const HomeScreen()),
    GetPage(name: NxRoutes.store, page: () => const StoreScreen()),
    GetPage(name: NxRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: NxRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: NxRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: NxRoutes.order, page: () => const OrderScreen()),
    GetPage(name: NxRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: NxRoutes.cart, page: () => const CartScreen()),
    GetPage(name: NxRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: NxRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: NxRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: NxRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: NxRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: NxRoutes.forgetPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: NxRoutes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(name: NxRoutes.subCategories, page: () => const SubCategoriesScreen()),
    // TODO : Uncomment this after SearchScreen is created
    // GetPage(name: NxRoutes.search, page: () => const SearchScreen()),
    GetPage(name: NxRoutes.brand, page: () => const BrandProductsScreen()),
    // GetPage(name: NxRoutes.allProducts, page: () => const AllProductsScreen()),
    // NxRoutes.signUpSuccess, NxRoutes.allProducts, NxRoutes.productDetails and NxRoutes.resetPassword aren't added because they are
    // dependent on other parameters. Not that they cannot be add here.
  ];
}