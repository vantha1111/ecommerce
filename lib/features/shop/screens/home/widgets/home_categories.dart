import 'package:computer_store/data/services/shop/categories.dart';
import 'package:computer_store/features/shop/models/function/fatch_catagories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:computer_store/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:computer_store/features/shop/screens/sub_category/sub_category.dart';


class UHomeCategoies extends StatefulWidget {
  const UHomeCategoies({Key? key}) : super(key: key);

  @override
  _UHomeCategoriesState createState() => _UHomeCategoriesState();
}

class _UHomeCategoriesState extends State<UHomeCategoies> {
  late Future<List<Categories>> _futureCategories;

  @override
  void initState() {
    super.initState();
    _futureCategories = CateService().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categories>>(
      future: _futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories available'));
        } else {
          final categories = snapshot.data!;
          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                return UVerticallmageText(
                  title: category.name ?? '',
                  image: category.coverUrl ?? "",
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              },
            ),
          );
        }
      },
    );
  }
}

      