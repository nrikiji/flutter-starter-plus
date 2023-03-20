part of 'page.dart';

// 設定項目を表す共通のコンポーネント
class SettingItem<T extends Enum> extends AbstractTile {
  final String title;
  final List<T> values;
  final String Function(T) getDisplayName;
  final T currentValue;
  final void Function(T) onSelected;

  const SettingItem({
    Key? key,
    required this.title,
    required this.values,
    required this.getDisplayName,
    required this.currentValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      titleWidget: Text(title),
      subtitle: getDisplayName(currentValue),
      onPressed: (context) {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text(title),
            children: values.map((x) {
              return SimpleDialogOption(
                child: Text(getDisplayName(x)),
                onPressed: () {
                  onSelected(x);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
