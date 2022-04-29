import 'package:dev_guide/src/core/appLocalizations.dart';
import 'package:dev_guide/src/core/responsiveUi.dart';
import 'package:dev_guide/src/domain/bloc/sliders/sliders_cubit.dart';
import 'package:dev_guide/src/presentation/resources/colorManager.dart';
import 'package:dev_guide/src/presentation/resources/valuesManager.dart';
import 'package:dev_guide/src/presentation/widgets/error_fetch_data.dart';
import 'package:dev_guide/src/presentation/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with AutomaticKeepAliveClientMixin{
  late double _width, _pixelRatio;

  late bool _xlarge;
  late ThemeData _theme;
  @override
  void initState() {
    // get data from server
    BlocProvider.of<SlidersCubit>(context).getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _width = MediaQuery.of(context).size.width;

    _pixelRatio = MediaQuery.of(context).devicePixelRatio;

    _xlarge = ResponsiveWidget.isScreenXLarge(_width, _pixelRatio);
    _theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          _slider(),
          const SizedBox(
            height: AppSize.s20,
          ),
          _courses(),
          const SizedBox(
            height: AppSize.s20,
          ),
          const Divider(),
          _mostRecently(),
          const SizedBox(
            height: AppSize.s20,
          ),
          const Divider(),
          _popular()
        ],
      ),
    );
  }

  Widget _courses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppLocalizations.of(context)!.translate("courses")!,
            style: _theme.textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        SizedBox(
          height: AppSize.s90,
          child: ListView.builder(
            itemBuilder: (context, index) => _imageView(
                "https://i.ytimg.com/vi/x0uinJvhNxI/maxresdefault.jpg"),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }

  Widget _mostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppLocalizations.of(context)!.translate("mostRecently")!,
            style: _theme.textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        SizedBox(
          height: AppSize.s90,
          child: ListView.builder(
            itemBuilder: (context, index) => _imageView(
                "https://i.ytimg.com/vi/x0uinJvhNxI/maxresdefault.jpg"),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }

  Widget _popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            AppLocalizations.of(context)!.translate("popular")!,
            style: _theme.textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        SizedBox(
          height: AppSize.s90,
          child: ListView.builder(
            itemBuilder: (context, index) => _imageView(
                "https://i.ytimg.com/vi/x0uinJvhNxI/maxresdefault.jpg"),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }

  Widget _imageView(String url) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(AppPadding.p8),
      child: ImageView(
        url: url,
        width: AppSize.s130,
      ),
    );
  }

  Widget _slider() {
    return SizedBox(
      height: AppSize.s130,
      child: BlocBuilder<SlidersCubit, SlidersState>(
  builder: (context, state) {
    if (state is SlidersLoading){
      return const Center(child:  CircularProgressIndicator());
    }
    if (state is SlidersError ){
      return const ErrorFetchData();
    }
    if (state is SlidersLoaded) {
      return  CarouselSlider.builder(
          unlimitedMode: true,
          enableAutoSlider: true,
          slideBuilder: (index) {
            return Container(
              alignment: Alignment.center,
              color: ColorManager.primary,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  state.slider[index].description!,
                  style: TextStyle(color: ColorManager.white),
                ),
              ),
            );
          },
          //slideTransform: const CubeTransform(),
          slideIndicator: CircularSlideIndicator(
            currentIndicatorColor: ColorManager.white,
            padding: const EdgeInsets.only(bottom: AppPadding.p20
            ),
          ),
          itemCount:state.slider.length );
    }
    return const Text("");


  },
),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
