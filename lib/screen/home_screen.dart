import 'package:facebook_ui/data/local_providers.dart';
import 'package:facebook_ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late bool _showBottomBar;

  void _showBottombarScroll(BuildContext context) {
    // definimos el provider y le pasamos la variable al privado y hacemos la funcion de scroll
    final bottomBarState = Provider.of<BottomBarState>(context, listen: false);
    _showBottomBar = bottomBarState.showBottomBar;

    // consultamos en q direccion se esta scrolleando de ser asi va cambiando el valor de mostrar el navbar
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse &&
        _showBottomBar) {
      bottomBarState.showBottomBar = false;
    } else if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        !_showBottomBar) {
      bottomBarState.showBottomBar = true;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      // evitamos el cambio de tamaño
      resizeToAvoidBottomInset: false,
      body: Stack(
        // Llamamos a la funcion desde el widget Stack que tiene un escuchador y un hijo donde se puede agregar mas widgets
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              _showBottombarScroll(context);
              return true;
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverHeader extends SliverPersistentHeaderDelegate{

  CustomSliverHeader({
    required this.maxHeight,
    required this.minheight,
    required this.child,
  }): assert(maxHeight>minheight);
  // Damos los tamaños minimo y maximos
  final double maxHeight;
  final double minheight;
  final Widget child;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) =>
    SizedBox.expand(child: child);
  

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

  
} 
