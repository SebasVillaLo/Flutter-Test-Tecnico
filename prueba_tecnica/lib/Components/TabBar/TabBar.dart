import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica/Screen/Maquinas/MaquinasPage.dart';
import 'package:prueba_tecnica/constants.dart';

class Tabbar extends StatefulWidget {
  final int initialTab;
  const Tabbar({super.key, required this.initialTab});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int indexTab = 0;
  String title = '';

  List<String> titles = ['Maquinas', 'Transporte', 'Repuestos', 'Operadores'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexTab = widget.initialTab;
    title = titles[indexTab];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialTab,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            title,
            style: kTitlePrimaryWhite,
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            color: Colors.black,
            icon: Image.asset(
              'assets/Icon/flechaconBGW.png',
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                indexTab = index;
                title = titles[index];
              });
            },
            isScrollable: true,
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            labelStyle: const TextStyle(fontSize: 16),
            indicatorColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                text: 'Máquinas',
              ),
              Tab(
                text: 'Transporte',
              ),
              Tab(
                text: 'Repuestos',
              ),
              Tab(
                text: 'Operadores',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const MaquinaPage(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        floatingActionButton: indexTab == 0
            ? FloatingActionButton.extended(
                onPressed: () {},
                label: const Text(
                  'Crear nuevo',
                  style: TextStyle(
                    fontFamily: 'Barlow',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                isExtended: true,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: kPrimaryColor,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
