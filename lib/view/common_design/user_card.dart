import 'package:flutter/cupertino.dart';

import '../../consts/consts.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: (){},
        child: ListTile(
          leading: const CircleAvatar(child: Icon(CupertinoIcons.person_alt),),
          title: "hifhgfuhf".text.semiBold.make(),
          subtitle: "oahhdoiha".text.maxLines(1).make(),

          trailing: "32:33".text.color(Colors.black54).make(),
        ),
      ),
    );
  }
}
