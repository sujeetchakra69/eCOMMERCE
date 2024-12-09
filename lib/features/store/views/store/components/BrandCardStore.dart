
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brand/brandCard.dart';
import 'package:t_store/common/widgets/common_shapes.dart';


class BrandCardStore extends StatelessWidget {
  const BrandCardStore({
    super.key, required this.images,
  });
  final List<String> images;
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:180, // Set a fixed height
      child: TCircleContainer(
        showBorder: true,
        child: Column(
          children: [
            // Here, you might want to ensure that TBrandCard has proper height constraints as well.
             const TBrandCard(),
            Row(
              // Align items to the start
              children: 
                images.map((image)=>brandTopProductImageWidget(image, context)).toList(),
               
              
            ),
          ],
        ),
      ),
    );
  }
}
Widget brandTopProductImageWidget(String image, context){
  return  Expanded(
    child:TCircleContainer(showBorder: false,
    height: 100,
    padding: 1,
    child: Image(image: AssetImage(image),fit :BoxFit.contain),),

  );
}
