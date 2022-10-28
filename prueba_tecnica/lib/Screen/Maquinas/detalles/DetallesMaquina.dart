import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetallesMaquina extends StatefulWidget {
  final Map data;
  const DetallesMaquina({super.key, required this.data});

  @override
  State<DetallesMaquina> createState() => _DetallesMaquinaState();
}

class _DetallesMaquinaState extends State<DetallesMaquina> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.89, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 242, 242, 242),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(121),
        child: AppBar(
          toolbarHeight: 70,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amber,
                child: Image.asset(
                  'assets/Image/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Detalles',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.black,
          leading: Image.asset('assets/Icon/flechaconBGW.png'),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 2,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  return Container(
                    // margin: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.data['image'][index],
                        width: 277,
                        height: 220,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
