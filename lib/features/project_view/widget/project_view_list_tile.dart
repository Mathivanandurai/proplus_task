import 'package:flutter_svg/svg.dart';

import '../../../main_export.dart';

class ProjectViewListTile extends StatelessWidget {
  const ProjectViewListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.userName});

  final String title;
  final String subTitle;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ConstantColor.greyF6F5FE))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ConstantColor.redFFF5EB,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: SvgPicture.asset(SvgPath.folder),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GetTextStyle.styleS16W500TextColor,
                ),
                const SizedBox(height: 3),
                Text(
                  subTitle,
                  style:
                      GetTextStyle.styleS16W400Primary5f60?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgPath.person,
                      width: 12,
                      height: 14,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      userName,
                      style: GetTextStyle.styleS16W400Primary5f60
                          ?.copyWith(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
