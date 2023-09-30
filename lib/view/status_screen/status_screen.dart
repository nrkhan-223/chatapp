import '../../consts/consts.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: deepPurple,
              child: Image.asset(
                person,
                color: Colors.white,
              ),
            ),
            title: "My status".text.size(15).semiBold.black.make(),
            subtitle: "tap to add status update"
                .text
                .size(13.5)
                .color(gray)
                .semiBold
                .make(),
          ),
          8.heightBox,
          const Divider(
            thickness: 1,
          ),
          10.heightBox,
          "recent updates".text.semiBold.size(17).black.make(),
          10.heightBox,
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: deepPurple,
                        child: Image.asset(
                          person,
                          color: Colors.white,
                        ),
                      ),
                      title: "Username".text.size(15).semiBold.black.make(),
                      subtitle: "Today, 12:12"
                          .text
                          .size(13.5)
                          .color(gray)
                          .semiBold
                          .make(),
                    );
                  }))
        ],
      ),
    );
  }
}
