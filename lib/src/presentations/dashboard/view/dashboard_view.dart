import 'package:flutter/material.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';
import 'package:invoice_maker/src/presentations/dashboard/utils/dashboard_texts.dart';
import 'package:invoice_maker/src/presentations/dashboard/widgets/containers_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedTab = 0;

  final List<String> tabs = ['All', 'Outstanding', 'Paid'];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const ContainersWidgets(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3.5.h,
                      backgroundImage: const AssetImage(
                        'assets/images/ava.png',
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning Yulia',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 0.4.h),
                        Text(
                          'Your Daily Invoice Goals',
                          style: TextStyle(
                            fontSize: 15.5.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset('assets/images/settings.png'),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              height: 6.5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedTab == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedTab = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 6.w : 0,
                        vertical: 1.2.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: isSelected ? Colors.white : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 5.h),
            if (selectedTab != 2)
              Center(
                child: Column(
                  children: [
                    Text(
                      DashboardTexts.getTitle(selectedTab),
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      DashboardTexts.getSubtitle(selectedTab),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),

            if (selectedTab != 2) SizedBox(height: 3.h),

            Expanded(
              child: SingleChildScrollView(
                child:
                    selectedTab == 2
                        ? const PaidTabContent()
                        : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaidTabContent extends StatelessWidget {
  const PaidTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(
          'Total Invoice',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2.h),

        /// Total Paid / Unpaid Row
        Container(
          padding: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _totalBox(
                color: Colors.red,
                title: 'Total Unpaid',
                amount: '-\$653,65.00',
                time: 'Last 7 Days',
              ),
              Container(width: 1, height: 10.h, color: Colors.grey.shade300),
              _totalBox(
                color: Colors.green,
                title: 'Total paid',
                amount: '\$653,65.00',
                time: 'Last Month',
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),

        /// Invoices title
        Text(
          'Invoices Paid',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2.h),

        /// Invoice cards
        Wrap(
          spacing: 3.w,
          runSpacing: 2.h,
          children: List.generate(4, (index) {
            final isPaid = index % 2 == 0;
            return _invoiceCard(
              isPaid: isPaid,
              name: 'Kartavenko Yulia',
              amount: '\$73,72.00',
            );
          }),
        ),
      ],
    );
  }

  Widget _totalBox({
    required Color color,
    required String title,
    required String amount,
    required String time,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          SizedBox(height: 1.5.h),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
          ),
          SizedBox(height: 0.5.h),
          Text(
            amount,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
              ),
              Icon(Icons.expand_more, size: 18.sp, color: Colors.grey.shade500),
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoiceCard({
    required bool isPaid,
    required String name,
    required String amount,
  }) {
    return Container(
      width: 42.w,
      padding: EdgeInsets.all(2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/ava.png'),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            'Total  $amount',
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color:
                      isPaid
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  isPaid ? 'Paid' : 'Unpaid',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: isPaid ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey.shade100,
                child: const Icon(
                  Icons.arrow_outward_rounded,
                  color: Colors.black54,
                  size: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
