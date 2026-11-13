import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';
import 'package:grad_project/features/profile/widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: AppStyles.black18SemiBold.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            "assets/images/Sarah Jenkins.png",
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.darkGreenColor,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text("Sarah Jenkins", style: AppStyles.black18SemiBold),
                  Text("sarah.jenkins@example.com", style: AppStyles.gray14Reg),
                  SizedBox(height: 60),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ProfileOption(
                          onTap: () {},
                          leading: CupertinoIcons.person,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Edit Profile",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {},
                          leading: Icons.notifications_none,
                          trailing: Icons.toggle_on,
                          trailingSize: 40,
                          title: "Notifications",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {},
                          leading: CupertinoIcons.globe,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          trailingText: "English",
                          title: "Language",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {},
                          leading: Icons.security,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Privacy & Security",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {},
                          leading: Icons.help_outline,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Help & Support",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.exit_to_app,
                          color: AppColors.redColor,
                        ),
                      ),
                      SizedBox(width: 2),
                      Text("Sign Out", style: AppStyles.red14Medium),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
