// ===== business_information.dart (с нижней кнопкой «Add New», без иконки «+» в заголовке)
import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'business_edit_view.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  final List<Map<String, String>> _accounts = List.generate(
    4,
    (i) => {'name': 'John Doe', 'email': 'yourmail@sample.com'},
  );

  int? _selectedMenuIndex;

  Future<void> _openEditor({Map<String, String>? account, int? index}) async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BusinessEditView(account: account)),
    );
    if (res != null && res is Map<String, String>) {
      setState(() {
        if (index != null) {
          _accounts[index] = res;
        } else {
          _accounts.add(res);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              // ---------- Header ----------
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Business',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // ← иконку «+» убрали
                  const SizedBox(width: 48), // чтобы центрирование не сбилось
                ],
              ),
              SizedBox(height: 1.5.h),

              // ---------- List ----------
              Expanded(
                child: ListView.separated(
                  itemCount: _accounts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                  itemBuilder: (ctx, index) {
                    final acc = _accounts[index];
                    return GestureDetector(
                      onTap: () => _openEditor(account: acc, index: index),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 2.5.h,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // аватар-заглушка
                                Container(
                                  width: 13.w,
                                  height: 13.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/person.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        acc['name'] ?? '',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: .5.h),
                                      Text(
                                        acc['email'] ?? '',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.more_horiz),
                                  onPressed:
                                      () => setState(
                                        () =>
                                            _selectedMenuIndex =
                                                _selectedMenuIndex == index
                                                    ? null
                                                    : index,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (_selectedMenuIndex == index)
                            Positioned(
                              top: 6.w,
                              right: 7.5.h,
                              child: Material(
                                color: Colors.transparent,
                                elevation: 10,
                                borderRadius: BorderRadius.circular(14),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(14),
                                  onTap:
                                      () => setState(() {
                                        _accounts.removeAt(index);
                                        _selectedMenuIndex = null;
                                      }),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          blurRadius: 20,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Delete account',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFF75A5A),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.delete,
                                          size: 20,
                                          color: Color(0xFFF75A5A),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // ---------- Bottom «Add New» ----------
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  ),
                  onPressed: () => _openEditor(),
                  child: Text(
                    'Add New',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
            ],
          ),
        ),
      ),
    );
  }
}
