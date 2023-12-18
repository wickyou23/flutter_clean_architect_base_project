part of '../match_page.dart';

class _MatchAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const _MatchAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.current.whiteColor,
      surfaceTintColor: AppColors.current.whiteColor,
      title: Text(
        S.current.match,
        style: AppTextStyles.h24Title().copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
      shadowColor: Colors.grey.shade200,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimens.d50.responsive());
}
