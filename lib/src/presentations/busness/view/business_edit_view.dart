// ===== business_edit_view.dart
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BusinessEditView extends StatefulWidget {
  final Map<String, String>? account;
  const BusinessEditView({super.key, this.account});

  @override
  State<BusinessEditView> createState() => _BusinessEditViewState();
}

class _BusinessEditViewState extends State<BusinessEditView> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.account?['name'] ?? '',
    );
    _emailController = TextEditingController(
      text: widget.account?['email'] ?? '',
    );
    _phoneController = TextEditingController(
      text: widget.account?['phone'] ?? '',
    );
    _addressController = TextEditingController(
      text: widget.account?['address'] ?? '',
    );
  }

  void _onSave() {
    if (_nameController.text.trim().isEmpty &&
        _emailController.text.trim().isEmpty &&
        _phoneController.text.trim().isEmpty &&
        _addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Fill at least one field')));
      return;
    }

    Navigator.pop(context, {
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone': _phoneController.text.trim(),
      'address': _addressController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Business'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _onSave,
            child: Text(
              'Save',
              style: TextStyle(fontSize: 17.sp, color: Colors.green),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: ListView(
          children: [
            SizedBox(height: 2.h),

            // ------------ Add Logo -------------
            DottedBorder(
              color: Colors.grey.shade400,
              dashPattern: const [6, 4],
              strokeWidth: 1.2,
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              child: InkWell(
                onTap: () {
                  /* pick image */
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 17.h,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.image,
                        size: 28.sp,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Add Logo',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 3.h),

            Text(
              'Business Contacts',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade500),
            ),
            SizedBox(height: 1.2.h),

            // ------------ Card with fields -----
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _InputRow(label: 'Name', controller: _nameController),
                  _InputRow(label: 'Phone', controller: _phoneController),
                  _InputRow(
                    label: 'E-Mail',
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                  ),
                  _InputRow(label: 'Address', controller: _addressController),
                ],
              ),
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboard;
  const _InputRow({
    required this.label,
    required this.controller,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 4.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: .8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 28.w,
            child: Text(
              label,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboard,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: 'Optional',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16.sp,
                ),
              ),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
