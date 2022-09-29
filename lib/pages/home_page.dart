import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/cubit/app_cubit_states.dart';
import 'package:purple/cubit/app_cubits.dart';
import 'package:purple/widgets/app_large_texts.dart';
import 'package:purple/widgets/app_texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images ={
    "Access_Cards.jpg" : "Access Cards",
    "clean_kit.jpg" : "Cleaning kit",
    "PVC.png" : "PVC Cards",
    "Ribbon.jpg" : "Ribbons",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 30, color: Colors.black,),
                      Expanded(child: Container(),),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),
                // Trending text
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: 'Trending Products') ,
                ),

                SizedBox(height: 20,),
                //tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(color: Colors.blue, radius: 4),
                      tabs: const [
                        Tab(text: 'Evolis Printers',),
                        Tab(text: 'Smart Printers',),
                        Tab(text: 'Lanyards',),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount:info.length,
                        scrollDirection:Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                          image: AssetImage(
                          'assets/images/evolisprinter.png'
                          ),
                          fit:BoxFit.cover,
                          ),
                          ),
                          );
                        },

                      ),
                      Text('there'),
                      Text('bye'),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: 'Explore More',size: 22,),
                      AppText(text: 'see all', color: Colors.lightBlueAccent,)
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index){

                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.center,
                            children:  [
                              Container(
                                // margin: const EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images'+images.keys.elementAt(index),
                                    ),
                                    fit: BoxFit.cover,
                                  ),

                                ),
                              ),
                              SizedBox(height:10,),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }else{
            return Container();
          }
        },
      )

    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double  radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double  radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset =Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+ circleOffset , radius, _paint);
    // TODO: implement paint
  }

}
