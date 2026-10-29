import 'dart:io';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.darkBlue),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.darkBlue,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: AppColors.gold,
        child: Column(
          children: [
            // الصورة + تاج الاسم
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  contact.imagePath != null
                      ? Image.file(File(contact.imagePath!), fit: BoxFit.cover)
                      : Container(
                    color: AppColors.lightBlue,
                    child: const Icon(
                      Icons.person,
                      size: 56,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        contact.name,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _infoRow(Icons.email, contact.email),
                  const SizedBox(height: 6),
                  _infoRow(Icons.phone, contact.phone),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 28,
                    child: ElevatedButton.icon(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, size: 14),
                      label: const Text(
                        'Delete',
                        style: TextStyle(fontSize: 10),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}