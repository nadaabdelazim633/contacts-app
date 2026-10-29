import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../core/validators.dart';
import '../models/contact_model.dart';
import 'app_button.dart';
import 'custom_text_field.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _picker = ImagePicker();
  String? _imagePath;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => _imagePath = file.path);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pop(
      context,
      ContactModel(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        imagePath: _imagePath,
      ),
    );
  }

  Widget _previewText(String value, String placeholder, {bool bold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value.isEmpty ? placeholder : value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: bold ? FontWeight.bold : FontWeight.w400,
            color: AppColors.gold,
          ),
        ),
        const Divider(color: AppColors.gold, height: 10, thickness: 1),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.gold, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: _imagePath == null
                              ? Lottie.asset(
                            AppAssets.imagePickerLottie,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 44,
                              color: AppColors.gold,
                            ),
                          )
                              : Image.file(
                            File(_imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          _previewText(
                            _nameController.text,
                            'User Name',
                            bold: true,
                          ),
                          _previewText(
                            _emailController.text,
                            'example@gmail.com',
                          ),
                          _previewText(
                            _phoneController.text,
                            '+200000000000',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  controller: _nameController,
                  hint: 'Enter User Name',
                  validator: Validators.name,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: _emailController,
                  hint: 'Enter User Email',
                  validator: Validators.email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  controller: _phoneController,
                  hint: 'Enter User Phone',
                  validator: Validators.phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 16),

                AppButton(text: 'Enter user', onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}