import 'package:nx_commerce/features/shop/models/product_attribute_model.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/features/shop/models/product_variation_model.dart';
import 'package:nx_commerce/main.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';

import 'features/shop/models/brand_model.dart';

final productsTo = [
  ProductModel(
    id: '001',
    sku: 'AT-SXW182-2Y3',
    title: 'The Authentic Black Backpack',
    stock: 15,
    price: 310,
    isFeatured: true,
    salePrice: 288,
    thumbnail: NxImages.productImage1,
    categoryId: '5',
    description:
        'Magna fugiat fugiat qui velit Lorem deserunt ipsum et culpa occaecat amet deserunt. Aliquip culpa culpa cillum quis aliqua commodo ullamco incididunt anim. Culpa aute ex et ex et esse Lorem ad irure ullamco cillum ad occaecat labore. Reprehenderit et labore cillum duis excepteur excepteur proident labore nulla veniam. In occaecat enim ea aliqua.',
    productType: ProductType.single.toString(),
    brand: BrandModel(
      id: '003',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FNike?alt=media&token=fe68055d-f023-4be5-b158-de11d7e31b7f',
      name: "Nike",
      productsCount: 648,
      isFeatured: true,
    ),
    images: [NxImages.productImage1],
    productAttributes: [],
    productVariations: [],
  ),
  ProductModel(
    id: '002',
    sku: 'RQ-TXS384-2HA',
    title: 'Original Beauty Ladies Braces',
    stock: 5,
    price: 30,
    isFeatured: true,
    salePrice: 23.21,
    thumbnail: NxImages.productImage2,
    categoryId: '5',
    description:
        'Aute ea aute ex sunt quis eiusmod pariatur cillum duis. Labore commodo culpa dolor non consequat reprehenderit nulla tempor. Aliqua sint voluptate culpa proident excepteur. Excepteur sit amet aliqua cupidatat fugiat. Qui cupidatat ad nisi dolor exercitation reprehenderit adipisicing.',
    productType: ProductType.single.toString(),
    brand: BrandModel(
      id: '001',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FOpenCabinet?alt=media&token=702529de-45b4-4880-9993-9a6dee966486',
      name: "OpenCabinet",
      productsCount: 63,
      isFeatured: true,
    ),
    images: [NxImages.productImage2],
    productAttributes: [],
    productVariations: [],
  ),
  ProductModel(
    id: '003',
    sku: 'RQ-TXS3qw4-2HA',
    title: 'Canon Scanner- Black',
    stock: 10,
    price: 290,
    isFeatured: true,
    salePrice: 248,
    thumbnail: NxImages.productImage3,
    categoryId: '8',
    description:
        'Aute ea aute ex sunt quis eiusmod. Labore commodo culpa dolor non consequat reprehenderit nulla tempor. Aliqua sint voluptate culpa proident excepteur. Excepteur sit amet aliqua cupidatat fugiat. Qui cupidatat ad nisi dolor exercitation reprehenderit adipisicing.',
    productType: ProductType.single.toString(),
    brand: BrandModel(
        id: '004',
        image:
            'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FSony?alt=media&token=f3334c55-74c8-44c3-9ae3-907867f36576',
        name: "Sony",
        productsCount: 520,
        isFeatured: true),
    images: [NxImages.productImage3],
    productAttributes: [],
    productVariations: [],
  ),
  ProductModel(
    id: '004',
    sku: 'RQ-TXS384-2HA',
    title: 'Original Beauty Ladies Braces',
    stock: 32,
    price: 120,
    isFeatured: true,
    salePrice: 109.99,
    thumbnail: NxImages.productImage5,
    categoryId: '5',
    description:
        'Aute ea aute ex sunt quis eiusmod pariatur cillum duis. Labore commodo culpa dolor non consequat reprehenderit nulla tempor. Aliqua sint voluptate culpa proident excepteur. Excepteur sit amet aliqua cupidatat fugiat. Qui cupidatat ad nisi dolor exercitation reprehenderit adipisicing.',
    productType: ProductType.single.toString(),
    brand: BrandModel(
      id: '001',
      image:
          'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FOpenCabinet?alt=media&token=702529de-45b4-4880-9993-9a6dee966486',
      name: "OpenCabinet",
      productsCount: 648,
      isFeatured: true,
    ),
    images: [
      NxImages.productImage5,
      NxImages.productImage4,
      NxImages.productImage6
    ],
    productAttributes: [],
    productVariations: [],
  ),
  ProductModel(
    id: '005',
    sku: 'BJ-ERS384-2H9',
    title: 'Triple X Earphone',
    stock: 30,
    price: 45,
    isFeatured: true,
    salePrice: 43,
    thumbnail: NxImages.productImage7,
    categoryId: '3',
    description:
        'Adipisicing labore ex commodo in do ad nisi enim ad adipisicing. Ut consequat excepteur culpa est adipisicing cillum. Proident ullamco aliquip ex occaecat commodo id cillum Lorem incididunt cillum sunt nisi consequat voluptate. Quis cupidatat do id do irure Lorem enim proident dolore consequat. Est sint eiusmod qui esse esse ex dolor sit culpa Lorem laborum proident eiusmod.',
    productType: ProductType.variable.toString(),
    brand: brand4,
    images: [NxImages.productImage7, NxImages.productImage8],
    productAttributes: [
      ProductAttributeModel(
        name: 'Color',
        values: ['Grey', 'White'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '01',
        attributeValues: {'Color': 'Grey'},
        sku: 'BJ-ERS384-2S1',
        image: NxImages.productImage7,
        description:
            'Adipisicing Lorem ex minim duis proident laborum occaecat fugiat cupidatat voluptate id esse anim commodo. Pariatur do deserunt sint proident sint. In ad duis irure sint aliqua commodo magna officia nulla. Proident aliqua consequat do sit anim incididunt. Aliqua aliqua aliqua labore duis incididunt mollit aliquip occaecat laborum laborum.',
        price: 45,
        salePrice: 41,
        stock: 20,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Grey'},
        sku: 'BJ-ETX23D-2S1',
        image: NxImages.productImage8,
        description:
            'Adipisicing Lorem ex minim duis proident laborum occaecat fugiat cupidatat voluptate id esse anim commodo. Pariatur do deserunt sint proident sint. In ad duis irure sint aliqua commodo magna officia nulla. Proident aliqua consequat do sit anim incididunt. Aliqua aliqua aliqua labore duis incididunt mollit aliquip occaecat laborum laborum.',
        price: 45,
        salePrice: 41,
        stock: 20,
      ),
    ],
  ),
  ProductModel(
    id: '006',
    sku: 'MT-OPS384-9TV',
    title: 'Female V-neck Long Dress',
    stock: 30,
    price: 45,
    isFeatured: true,
    salePrice: 43,
    thumbnail: NxImages.productImage9,
    categoryId: '3',
    description:
        'Id dolore irure adipisicing tempor est et esse nisi fugiat laboris ipsum ad. Cupidatat elit minim aliqua esse magna. Cillum laborum reprehenderit fugiat ipsum. Pariatur deserunt occaecat ut ea consequat occaecat labore tempor. Sit cillum sit ad non aute consequat officia elit dolore excepteur eu ipsum consequat. Ut excepteur cillum sit dolor occaecat est. Adipisicing occaecat dolor eiusmod consectetur ut exercitation aute cillum aute minim aute excepteur velit commodo.',
    productType: ProductType.variable.toString(),
    brand: brand2,
    images: [
      NxImages.productImage9,
      NxImages.productImage9b,
      NxImages.productImage10
    ],
    productAttributes: [
      ProductAttributeModel(
        name: 'Color',
        values: ['Green', 'Brown', 'Grey'],
      ),
      ProductAttributeModel(
        name: 'Size',
        values: [
          'Medium',
          'Large',
        ],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '01',
        attributeValues: {'Color': 'Green', 'Size': 'Large'},
        sku: 'BJ-ERS384-2S1',
        image: NxImages.productImage9,
        description:
            'Adipisicing Lorem ex minim duis proident laborum occaecat fugiat cupidatat voluptate id esse anim commodo. Pariatur do deserunt sint proident sint. In ad duis irure sint aliqua commodo magna officia nulla. Proident aliqua consequat do sit anim incididunt. Aliqua aliqua aliqua labore duis incididunt mollit aliquip occaecat laborum laborum.',
        price: 46,
        salePrice: 24,
        stock: 8,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Brown', 'Size': 'Large'},
        sku: 'BJ-ETX23D-2S1',
        image: NxImages.productImage9b,
        description:
            'Adipisicing Lorem ex minim duis proident laborum occaecat fugiat cupidatat voluptate id esse anim commodo. Pariatur do deserunt sint proident sint. In ad duis irure sint aliqua commodo magna officia nulla. Proident aliqua consequat do sit anim incididunt. Aliqua aliqua aliqua labore duis incididunt mollit aliquip occaecat laborum laborum.',
        price: 45,
        salePrice: 30,
        stock: 22,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Grey', 'Size': 'Medium'},
        sku: 'BJ-ETX23D-2S1',
        image: NxImages.productImage10,
        description:
            'Adipisicing Lorem ex minim duis proident laborum occaecat fugiat cupidatat voluptate id esse anim commodo. Pariatur do deserunt sint proident sint. In ad duis irure sint aliqua commodo magna officia nulla. Proident aliqua consequat do sit anim incididunt. Aliqua aliqua aliqua labore duis incididunt mollit aliquip occaecat laborum laborum.',
        price: 40,
        salePrice: 32.10,
        stock: 40,
      ),
    ],
  ),
  ProductModel(
    id: '007',
    sku: 'RQ-TXS3qw4-2HA',
    title: 'Samsung Galaxy S9 - Original Black',
    stock: 6,
    price: 290,
    isFeatured: true,
    salePrice: 248,
    thumbnail: NxImages.productImage11,
    categoryId: '4',
    description:
        'Commodo fugiat non id culpa fugiat adipisicing veniam ex commodo fugiat commodo. Labore minim ea velit elit anim. Ex commodo deserunt commodo sunt Lorem aliquip. Duis commodo laborum Lorem magna ut nostrud. Aliquip adipisicing cupidatat est nulla consectetur.',
    productType: ProductType.single.toString(),
    brand: brand4,
    images: [
      NxImages.productImage11,
      NxImages.productImage12,
      NxImages.productImage13
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black'])
    ],
    productVariations: [],
  ),
  ProductModel(
    id: '008',
    sku: 'MK-XCY872-2Q1',
    title: 'Samsung Galaxy S9 - Original Black',
    stock: 17,
    price: 12943,
    isFeatured: true,
    salePrice: 110233,
    thumbnail: NxImages.productImage14,
    categoryId: '8',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.single.toString(),
    brand: brand4,
    images: [
      NxImages.productImage14,
      NxImages.productImage15,
      NxImages.productImage16
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['White'])
    ],
    productVariations: [],
  ),
  ProductModel(
    id: '009',
    sku: 'GA-XCY672-SD1',
    title: 'Iphone 14 pro',
    stock: 17,
    price: 3000,
    isFeatured: true,
    salePrice: 3000,
    thumbnail: NxImages.productImage17,
    categoryId: '4',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.single.toString(),
    brand: brand4,
    images: [
      NxImages.productImage17,
      NxImages.productImage18,
      NxImages.productImage19
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black'])
    ],
    productVariations: [],
  ),
  ProductModel(
    id: '010',
    sku: 'GA-XCY672-SD1',
    title: 'Iphone 14 pro',
    stock: 17,
    price: 3000,
    isFeatured: true,
    salePrice: 3000,
    thumbnail: NxImages.productImage17,
    categoryId: '4',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.single.toString(),
    brand: brand4,
    images: [
      NxImages.productImage17,
      NxImages.productImage18,
      NxImages.productImage19
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black'])
    ],
    productVariations: [],
  ),
  ProductModel(
    id: '011',
    sku: 'GA-XWO672-54D',
    title: 'Clean-free Colored Necklace',
    stock: 50,
    price: 33,
    isFeatured: true,
    salePrice: 30,
    thumbnail: NxImages.productImage33,
    categoryId: '1',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.variable.toString(),
    brand: brand2,
    images: [
      NxImages.productImage33,
      NxImages.productImage34,
      NxImages.productImage35
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Yellow', 'Grey', 'Black'])
    ],
    productVariations: [
      ProductVariationModel(
        id: '01',
        attributeValues: {'Color': 'Yellow'},
        sku: 'BJ-ERS384-2S1',
        image: NxImages.productImage34,
        description:
            'Commodo sint cillum sit ad adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 33,
        salePrice: 20,
        stock: 22,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Grey'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage33,
        description:
            'Cadipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 30,
        salePrice: 28,
        stock: 2,
      ),
      ProductVariationModel(
        id: '03',
        attributeValues: {'Color': 'Black'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage35,
        description:
            'Resique adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 30,
        salePrice: 25,
        stock: 0,
      ),
    ],
  ),
  ProductModel(
    id: '012',
    sku: 'GA-XWO672-54D',
    title: 'Multi-purpose Backpack. For school, work, exer...',
    stock: 200,
    price: 78,
    isFeatured: true,
    salePrice: 60,
    thumbnail: NxImages.productImage36,
    categoryId: '7',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.variable.toString(),
    brand: brand2,
    images: [
      NxImages.productImage36,
      NxImages.productImage37,
      NxImages.productImage38,
      NxImages.productImage39,
      NxImages.productImage40,
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Grey', 'Black']),
      ProductAttributeModel(
          name: 'Style', values: ['Back', 'Shoulder', 'Pocket'])
    ],
    productVariations: [
      ProductVariationModel(
        id: '01',
        attributeValues: {'Color': 'Black', 'Style': 'Back'},
        sku: 'BJ-ERS384-2S1',
        image: NxImages.productImage37,
        description:
            'Commodo sint cillum sit ad adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 82,
        salePrice: 61,
        stock: 13,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Black', 'Style': 'Back'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage38,
        description:
            'Cadipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 89,
        salePrice: 70,
        stock: 5,
      ),
      ProductVariationModel(
        id: '03',
        attributeValues: {'Color': 'Grey', 'Style': 'Pocket'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage39,
        description:
            'Resique adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 30,
        salePrice: 25,
        stock: 5,
      ),
      ProductVariationModel(
        id: '03',
        attributeValues: {'Color': 'Black', 'Style': 'Shoulder'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage40,
        description:
            'Resique adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 55,
        salePrice: 49.49,
        stock: 5,
      ),
    ],
  ),
  ProductModel(
    id: '013',
    sku: 'MK-XCY872-2Q1',
    title: 'Wireless MTN Router- 4G ~5.43mb/s trans fibre....',
    stock: 45,
    price: 129,
    isFeatured: true,
    salePrice: 110,
    thumbnail: NxImages.productImage47,
    categoryId: '7',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.single.toString(),
    brand: brand1,
    images: [
      NxImages.productImage47,
      NxImages.productImage48,
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Black'])
    ],
    productVariations: [],
  ),
  ProductModel(
    id: '014',
    sku: 'GA-XW3272-54D',
    title: 'Women Formal Dress',
    stock: 50,
    price: 75,
    isFeatured: true,
    salePrice: 69.99,
    thumbnail: NxImages.productImage51,
    categoryId: '1',
    description:
        'Exercitation eiusmod voluptate do Lorem occaecat minim exercitation et velit excepteur qui tempor. Sit reprehenderit commodo adipisicing mollit aute sint adipisicing sint voluptate do eiusmod incididunt sit sit. Ex culpa ea laboris fugiat amet. Culpa occaecat nulla commodo nisi dolore eu enim dolor cupidatat ullamco cillum culpa dolore. Laboris adipisicing consequat ut et id ipsum amet eu dolore reprehenderit dolor tempor proident sit.',
    productType: ProductType.variable.toString(),
    brand: brand2,
    images: [
      NxImages.productImage51,
      NxImages.productImage52,
      NxImages.productImage53
    ],
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Blue', 'Black'])
    ],
    productVariations: [
      ProductVariationModel(
        id: '01',
        attributeValues: {'Color': 'Black'},
        sku: 'BJ-ERS384-2S1',
        image: NxImages.productImage51,
        description:
            'Commodo sint cillum sit ad adipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 70,
        salePrice: 64.99,
        stock: 87,
      ),
      ProductVariationModel(
        id: '02',
        attributeValues: {'Color': 'Blue'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage52,
        description:
            'Cadipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 75,
        salePrice: 73,
        stock: 2,
      ),
      ProductVariationModel(
        id: '03',
        attributeValues: {'Color': 'Blue'},
        sku: 'BJ-ERG844-2S1',
        image: NxImages.productImage53,
        description:
            'Cadipisicing pariatur exercitation. Dolor fugiat culpa deserunt enim dolore reprehenderit proident cillum. Mollit adipisicing sunt anim eu sint eu voluptate mollit enim. Elit irure veniam laboris nostrud voluptate occaecat officia..',
        price: 75,
        salePrice: 73,
        stock: 2,
      ),
    ],
  ),
  ProductModel(
    id: '015',
    sku: 'MK-XCY872-2Q1',
    title: 'Grey-Black Men\'s Long Sleeve Shirt',
    stock: 45,
    price: 22,
    isFeatured: true,
    salePrice: 18,
    thumbnail: NxImages.productImage42,
    categoryId: '1',
    description:
        'Deserunt officia incididunt dolor mollit ipsum et mollit dolor duis laborum culpa. Nostrud cupidatat tempor elit eiusmod laborum irure esse. Eu reprehenderit pariatur dolore voluptate occaecat pariatur minim laboris in adipisicing. Sunt id sint in eu commodo officia fugiat dolor culpa est. Dolor qui dolore irure voluptate dolor aute amet ullamco in magna adipisicing. Amet pariatur do quis non ut qui ipsum anim culpa.',
    productType: ProductType.single.toString(),
    brand: brand3,
    images: [
      NxImages.productImage42,
      NxImages.productImage43,
    ],
    productAttributes: [],
    productVariations: [],
  ),
];
