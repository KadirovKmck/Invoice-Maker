import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:invoice_maker/src/components/custom_scaffold.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({super.key});

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount>
    with SingleTickerProviderStateMixin {
  final String _userName = 'Yulia Kartavenko';
  final String _email = 'mymail@sample.com';

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.5.h),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(CupertinoIcons.chevron_back),
                  onPressed: () => Navigator.of(context).maybePop(),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Personal',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.ellipsis_circle, size: 6.w),
                  onPressed: _openMoreMenu,
                ),
              ],
            ),
          ),

          /// CARD WITH NAME & MAIL
          FadeTransition(
            opacity: CurvedAnimation(
              parent: _controller,
              curve: const Interval(.1, .45, curve: Curves.easeOut),
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: .8, end: 1).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(.1, .45, curve: Curves.easeOutBack),
                ),
              ),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.symmetric(vertical: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      _userName,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(_email, style: TextStyle(fontSize: 18.sp)),
                  ],
                ),
              ),
            ),
          ),

          /// DESCRIPTION
          FadeTransition(
            opacity: CurvedAnimation(
              parent: _controller,
              curve: const Interval(.45, .8, curve: Curves.easeOut),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 6.h, 8.w, 0),
              child: Text(
                'All your invoices are now synced to your accounts. '
                'Remind yourself to log in when reinstalling the app',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, height: 1.35),
              ),
            ),
          ),

          const Spacer(),

          /// LOG OUT
          FadeTransition(
            opacity: CurvedAnimation(
              parent: _controller,
              curve: const Interval(.7, 1, curve: Curves.easeOut),
            ),
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
              onPressed: _logout,
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(124, 0, 0, 0),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  void _openMoreMenu() async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    // ignore: unused_local_variable
    final result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(overlay.size.width - 60, 90, 16, 0),
      color: Colors.transparent,
      elevation: 0,
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              _confirmDelete();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Delete account',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.delete, color: Colors.red),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.delete_forever,
                  size: 48,
                  color: Colors.redAccent,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Delete Account?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                const Text(
                  'This action cannot be undone.\nAre you sure you want to continue?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey[700],
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Account deleted')),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _logout() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
