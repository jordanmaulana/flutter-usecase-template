import '../../../base/export_view.dart';
import '../../../components/styles.dart';
import '../../../components/version_text.dart';

import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    const VText('Logout'),
                    SizedBox(width: context.mdPadding),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLogout01,
                      size: 12.0,
                      color: VColor.primary,
                    ),
                  ],
                ),
              ),
            ],

            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              if (value == 1) {
                controller.logout();
              }
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: GetBuilder(
        builder: (ProfileController controller) {
          return ListView(
            padding: EdgeInsets.all(context.screenPadding),
            children: [
              const SizedBox(height: 60.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: '${controller.profile?.username}',
                        child: VText(
                          '${controller.profile?.username}',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: context.smPadding),
                      VText(
                        '${controller.profile?.firstname} ${controller.profile?.lastname}',
                        fontSize: 12.0,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.mdPadding),
              Container(
                padding: EdgeInsets.all(context.mdPadding),
                decoration: VStyle.boxShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedMail01,
                      size: 12.0,
                      color: VColor.primary,
                    ),
                    SizedBox(height: context.smPadding),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedPhoneOff01,
                      size: 12.0,
                      color: VColor.primary,
                    ),
                    const Divider(height: 48.0),
                    InkWell(
                      // onTap: () => Get.toNamed(RouteName.updateProfile),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HugeIcon(
                            icon: HugeIcons.strokeRoundedEdit01,
                            size: 12.0,
                            color: VColor.primary,
                          ),
                          SizedBox(width: context.smPadding),
                          const VText('Sunting akun', fontSize: 12.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 64.0),
              const VersionText(),
            ],
          );
        },
      ),
    );
  }
}
