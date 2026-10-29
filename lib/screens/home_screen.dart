import 'package:flutter/material.dart';
import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../models/contact_model.dart';
import '../widgets/add_contact_sheet.dart';
import '../widgets/contact_card.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _maxContacts = 6;
  final List<ContactModel> _contacts = [];

  Future<void> _addContact() async {
    final result = await showModalBottomSheet<ContactModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddContactSheet(),
    );

    if (result != null) {
      setState(() => _contacts.add(result));
    }
  }

  void _deleteAt(int index) {
    setState(() => _contacts.removeAt(index));
  }

  void _deleteLast() {
    if (_contacts.isEmpty) return;
    setState(() => _contacts.removeLast());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(AppAssets.logo, height: 44),
        ),
      ),
      body: _contacts.isEmpty
          ? const EmptyState()
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 8, bottom: 150),
          itemCount: _contacts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ContactCard(
            contact: _contacts[index],
            onDelete: () => _deleteAt(index),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'delete_last',
              onPressed: _deleteLast,
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.delete),
            ),
          if (_contacts.isNotEmpty && _contacts.length < _maxContacts)
            const SizedBox(height: 12),

          if (_contacts.length < _maxContacts)
            FloatingActionButton(
              heroTag: 'add_contact',
              onPressed: _addContact,
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.add),
            ),
        ],
      ),
    );
  }
}