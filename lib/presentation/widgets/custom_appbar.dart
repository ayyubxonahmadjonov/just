import 'package:real_project/core/constants/app_imports.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? route; // ❗️ optional qildik

  const CustomAppBar({super.key, this.route});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: false,
      backgroundColor: AppColors.primaryColor,
      title: InkWell(
        onTap: () {
          if (widget.route != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => widget.route!),
              (route) => false,
            );
          } else {
            Navigator.pop(context);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.navigate_before, color: Colors.white, size: 28.sp),
            SizedBox(width: 4.w),
            Text(
              'Ortga',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
