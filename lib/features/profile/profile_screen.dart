import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_routes.dart';
import 'package:grad_project/core/style/app_colors.dart';
import 'package:grad_project/core/style/app_styles.dart';
import 'package:grad_project/features/profile/cubit/profile_cubit.dart';
import 'package:grad_project/features/profile/cubit/states.dart';
import 'package:grad_project/features/profile/widgets/profile_option.dart';
import 'package:grad_project/features/profile/widgets/signout_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppStyles.black18SemiBold.copyWith(fontSize: 20.sp),
        ),
        actions: [
          BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              if (state is ProfileLoadedState && state.isEditing) {
                return TextButton(
                  onPressed: () {
                    context.read<ProfileCubit>().saveProfile(
                      nameController.text,
                      emailController.text,
                    );
                  },
                  child: const Text("Save"),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocConsumer<ProfileCubit, ProfileStates>(
                    listener: (context, state) {
                      if (state is ProfileLoadedState && !state.isEditing) {
                        nameController.text = state.name;
                        emailController.text = state.email;
                      }

                      if (state is ProfileErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ProfileLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ProfileLoadedState) {
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 60.r,
                                    backgroundImage: state.imageFile != null
                                        ? FileImage(state.imageFile!)
                                              as ImageProvider
                                        : NetworkImage(state.profileImageUrl),
                                  ),
                                ),
                                if (state.isEditing)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(3.w),
                                      child: CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor:
                                            AppColors.darkGreenColor,
                                        child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<ProfileCubit>()
                                                .pickImage();
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.white,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            state.isEditing
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                    ),
                                    child: TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )
                                : Text(
                                    state.name,
                                    style: AppStyles.black18SemiBold,
                                  ),
                            state.isEditing
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 8.h,
                                    ),
                                    child: TextField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  )
                                : Text(state.email, style: AppStyles.gray14Reg),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  SizedBox(height: 60.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        ProfileOption(
                          onTap: () {
                            context.read<ProfileCubit>().toggleEditing();
                          },
                          leading: CupertinoIcons.person,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Edit Profile",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.privacy);
                          },
                          leading: Icons.security,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Privacy & Security",
                        ),
                        Divider(),
                        ProfileOption(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.support);
                          },
                          leading: Icons.help_outline,
                          trailing: Icons.arrow_forward_ios,
                          trailingSize: 15,
                          title: "Help & Support",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h),
                  BlocConsumer<ProfileCubit, ProfileStates>(
                    listener: (context, state) {
                      if (state is ProfileSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.login,
                          (route) => false,
                        );
                      } else if (state is ProfileErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return SignoutButton(
                        isLoading: state is ProfileLoadingState,
                        onPressed: () => context.read<ProfileCubit>().signOut(),
                      );
                    },
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
