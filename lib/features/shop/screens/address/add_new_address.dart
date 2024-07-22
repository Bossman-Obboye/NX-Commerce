import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NxAppBar(title: Text('Add new Address'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NxSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name")),
                SizedBox(height: NxSizes.spaceBtwInputFields),
                 TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")),
                SizedBox(height: NxSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Street"))),
                    SizedBox(width: NxSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"))),
                  ],
                ),
                SizedBox(height: NxSizes.spaceBtwInputFields),
                  Row(
                  children: [
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "City"))),
                    SizedBox(width: NxSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"))),
                  ],
                ),
                SizedBox(height: NxSizes.spaceBtwInputFields),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country")),
                SizedBox(height: NxSizes.spaceBtwInputFields),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
