import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:paymentcard/core/constants/radius_const.dart';
import 'package:paymentcard/core/data/images_data.dart';
import 'package:paymentcard/core/extensions/size_extension.dart';

class MydraggableWidget extends StatelessWidget {
  const MydraggableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List imgs = ImagesData.allimages;
    return Swiper(
      control: SwiperControl(),
      allowImplicitScrolling: true,
      fade: 1.0,
      indicatorLayout: PageIndicatorLayout.COLOR,
      controller: SwiperController(),
      pagination: const SwiperPagination(
          builder: SwiperPagination.dots,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(vertical: 10.0),),
      itemCount: imgs.length,
      itemBuilder: (context, index) {
        return Draggable<String>(
          data: imgs[index],
          feedback: Opacity(
            opacity: 0.85,
            child: Container(
              height: context.h * 0.12,
              width: context.h * 0.18,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusConst.small),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imgs[index],
                  ),
                ),
              ),
            ),
          ),
          childWhenDragging: Container(
            height: context.h * 0.12,
            width: context.h * 0.18,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusConst.small),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imgs[index],
                ),
              ),
            ),
          ),
          child: Container(
            height: context.h * 0.12,
            width: context.h * 0.18,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusConst.small),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imgs[index],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
