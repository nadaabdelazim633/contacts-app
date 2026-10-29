import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            AppAssets.emptyLottie,
            height: 200,
            // لو ملف الأنيميشن مش موجود يعرض أيقونة بدل ما التطبيق يقع
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.contacts_outlined,
              size: 100,
              color: AppColors.gold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.gold,
            ),
          ),
        ],
      ),
    );
  }
}