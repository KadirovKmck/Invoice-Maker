import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaidTabContentView extends StatelessWidget {
  const PaidTabContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Done', style: TextStyle(fontSize: 16.sp)),
                Text(
                  'Preview',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Customize', style: TextStyle(fontSize: 16.sp)),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Yulia Kartavenko',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'INVOICE',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            '#001',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Issued 05/05/2025',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FROM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            'Yulia Kartavenko',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Text(
                        'BILL TO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text('', style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                  SizedBox(height: 2.h),

                  Table(
                    border: TableBorder.all(color: Colors.grey.shade300),
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[100]),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'QTY',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Price, UAH',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Amount, UAH',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(''),
                          ),
                        ),
                      ),
                      TableRow(
                        children: [
                          const SizedBox(),
                          const SizedBox(),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text('UAH 0.00'),
                          ),
                        ],
                      ),
                    ],
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
