import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/input_field.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => SizedBox(
        height: 38.h,
        width: 325.w,
        child: InputField(
          hint: "Search",
          label: "Search",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list,),
          ),
        ),
      ),
    );
  }
}
