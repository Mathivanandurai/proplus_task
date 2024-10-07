import '../../../main_export.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {super.key,
      required this.list,
      required this.initialIndex,
      required this.onChange});

  final List<String> list;
  final int initialIndex;
  final Function(int index) onChange;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var index = 0; index < list.length; index++)
            Padding(
              padding: EdgeInsets.only(right: index < list.length - 1 ? 12 : 0),
              child: InkWell(
                onTap: (){
                  onChange(index);
                },
                child: BranchCard(
                  title: list[index],
                  isSelected: index == initialIndex,
                ),
              ),
            )
        ],
      ),
    );
  }
}

class BranchCard extends StatelessWidget {
  const BranchCard({super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color:
              isSelected ? ConstantColor.textColor : ConstantColor.greyF3F4FF,
          borderRadius: BorderRadius.circular(43)),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: isSelected ? 14 : 16,
            color:
                isSelected ? ConstantColor.white : ConstantColor.primary5F607E),
      ),
    );
  }
}
