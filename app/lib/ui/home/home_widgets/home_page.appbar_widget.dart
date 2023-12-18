part of '../home_page.dart';

class _HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.current.whiteColor,
      surfaceTintColor: AppColors.current.whiteColor,
      automaticallyImplyLeading: false,
      leadingWidth: Dimens.d200.responsive(),
      leading: Container(
        padding: EdgeInsets.only(
          left: Dimens.d16.responsive(),
        ),
        alignment: Alignment.centerLeft,
        child: Assets.images.leganewsLogo.svg(
          width: Dimens.d134.responsive(),
          height: Dimens.d24.responsive(),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        )
      ],
      shadowColor: Colors.grey.shade200,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimens.d50.responsive());
}
