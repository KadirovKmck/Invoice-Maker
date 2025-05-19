import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:invoice_maker/src/presentations/items/model/item_model.dart';
import 'item_edit_view.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  final List<Item> _items = [Item(name: 'Yulia', price: 2000)];

  String _query = '';

  List<Item> get _filtered =>
      _query.isEmpty
          ? _items
          : _items
              .where((e) => e.name.toLowerCase().contains(_query.toLowerCase()))
              .toList();

  void _openEditor({Item? item, int? index}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => ItemEditView(
              initialItem: item,
              onSave: (edited) {
                setState(() {
                  if (index != null) {
                    _items[index] = edited;
                  } else {
                    _items.add(edited);
                  }
                });
              },
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  const Spacer(),
                  const Text(
                    'Items',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _openEditor(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.mic_none),
                    onPressed: () {}, 
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _filtered.length,
                separatorBuilder:
                    (_, __) => const Divider(height: 1, thickness: .5),
                itemBuilder: (context, i) {
                  final item = _filtered[i];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text(
                      item.price.toStringAsFixed(2).replaceAll('.', ',') + r'$',
                      style: const TextStyle(
                        color: Color(0xFF8888AA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () => _openEditor(item: item, index: i),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
