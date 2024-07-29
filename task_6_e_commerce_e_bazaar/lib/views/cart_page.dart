import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:task_6_e_commerce_e_bazaar/controllers/itembag_controller.dart';

import '../constants/themes.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: const Text('Checkout', style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.local_mall,color: kPrimaryColor,)))
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: itemBag.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(itemBag[index].imgUrl),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemBag[index].title,
                                style: AppTheme.kCardTitle,
                              ),
                              const Gap(6),
                              Text(
                                itemBag[index].shortDescription,
                                style: AppTheme.kBodyText,
                              ),
                              const Gap(4),
                              Text(
                                '\$${itemBag[index].price}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                  ]),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Have a coupon code? enter here'),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: kSecondaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FDS2023', // I have used a static coupon right now
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              Text(
                                'Available',
                                style: TextStyle(
                                    color: kSecondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(6),
                              Icon(Icons.check_circle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'No discount',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor),
                      ),
                      Text(
                        '\$${ref.watch(priceCalcProvider)}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kSecondaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
