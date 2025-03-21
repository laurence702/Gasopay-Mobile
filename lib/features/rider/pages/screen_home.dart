import 'package:flutter/material.dart';
import 'package:project_wee/constants/app_assets.dart';
import 'package:project_wee/constants/app_colors.dart';

import '../widgets/list_item.dart';
import '../widgets/stat_card.dart';

class RiderHomeScreen extends StatelessWidget {
  const RiderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header (User name, image, Notifications)
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .32,
                    height: 200,
                    decoration: BoxDecoration(
                        color: AppColors.lightCard,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            AppAsset.img.profilePlaceholder,
                          ),
                        )),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.lightCard,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Amina R.',
                            style: TextStyle(
                              fontSize: 8 * 2.7,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'user@email.com • ⭐️ 4.5',
                            style: TextStyle(
                              fontSize: 8 * 1.6,
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 80,
                              width: 80,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Overview (stats: Total debts, Totoal pickups)
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F5FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Stats',
                      style: TextStyle(
                        fontSize: 8 * 2.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            title: 'Total Debts',
                            value: '₦25,000',
                            valueColor: Colors.red,
                            label: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red.withOpacity(.2),
                              ),
                              child: const Text(
                                'INELIGIBLE',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatCard(
                            title: 'Total Pickups',
                            value: '12',
                            label: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: const Text(
                                '12% vs last period',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              // History (Payments)
              const SizedBox(height: 8),
              // Overview (stats: Total debts, Totoal pickups)
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightCard,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Payments',
                      style: TextStyle(
                        fontSize: 8 * 2.3,
                      ),
                    ),
                    SizedBox(height: 8),
                    PaymentListItem(
                      amount: '23,000',
                      date: '20 Mar 2025',
                      status: 'PAID',
                    ),
                    SizedBox(height: 8),
                    PaymentListItem(
                      amount: '18,000',
                      date: '18 Mar 2025',
                      status: 'PAID',
                    ),
                    SizedBox(height: 8),
                    PaymentListItem(
                      amount: '6,000',
                      date: '12 Mar 2025',
                      status: 'UNPAID',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
