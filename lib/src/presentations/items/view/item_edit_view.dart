import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/components.dart';
import 'package:invoice_maker/src/presentations/items/model/item_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemEditView extends StatefulWidget {
  const ItemEditView({super.key, this.initialItem, required this.onSave});

  final Item? initialItem;

  final ValueChanged<Item> onSave;

  @override
  State<ItemEditView> createState() => _ItemEditViewState();
}

class _ItemEditViewState extends State<ItemEditView> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _priceCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initialItem?.name ?? '');
    _priceCtrl = TextEditingController(
      text: widget.initialItem?.price.toStringAsFixed(2) ?? '',
    );
  }

  void _save() {
    final name = _nameCtrl.text.trim();
    final price = double.tryParse(_priceCtrl.text.replaceAll(',', '.')) ?? 0;

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Введите название')));
      return;
    }

    widget.onSave(
      widget.initialItem?.copyWith(name: name, price: price) ??
          Item(name: name, price: price),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialItem != null;
    return CustomScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(isEdit ? 'Edit item' : 'New item'),
        actions: [IconButton(icon: const Icon(Icons.check), onPressed: _save)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 3.h),
            TextField(
              controller: _priceCtrl,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Price, \$'),
            ),
          ],
        ),
      ),
    );
  }
}
