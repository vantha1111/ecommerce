import 'package:computer_store/common/widgets/images/cricular_image.dart';
import 'package:computer_store/features/authentication/models/loginmodel/fetch_login.dart';
import 'package:computer_store/features/personalization/setting/model/profile-model.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UUserProfile extends StatefulWidget {
  const UUserProfile({super.key});

  @override
  _UUserProfileState createState() => _UUserProfileState();
}

class _UUserProfileState extends State<UUserProfile> {
  late Future<User?> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = AuthService().fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching user data'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No user data available'));
        } else {
          User user = snapshot.data!;
          return ListTile(
            leading: UCricularImage(
              image: user.profileImageUrl ?? UImages.user,
              width: 50,
              height: 50,
              padding: 0,
            ),
            title: Text(user.firstname ?? 'Unknown' , style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
            subtitle: Text(user.email ?? 'Unknown', style: Theme.of(context).textTheme.headlineSmall!.apply(color: UColors.white)),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit, color: UColors.white)),
          );
        }
      },
    );
  }
}
