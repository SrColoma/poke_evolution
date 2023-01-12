import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PokeProvider with ChangeNotifier{
  int _index = 1;
  int get index => _index;

  void increment() {
    _index++;
    print(index);
    notifyListeners();
  }
  void decrement() {
    _index--;
    print(index);
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Material App',
      home: Page(),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: CustomScrollView(
        
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.red.shade400,
            flexibleSpace: FadeIn(child: Cabecera()),
            expandedHeight: 200,
            elevation: 0,
            pinned: true,
            collapsedHeight: 200,
          ),
          SliverFillRemaining(
            child: Padding(
              // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              padding: EdgeInsets.only(left: 10,bottom: 10),
              child: Cuerpo(),
            ),
          ),
        ],
      ),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(1),
        border: BorderDirectional(
          start: BorderSide(color: Colors.red.shade900, width: 10),
          bottom: BorderSide(color: Colors.red.shade900, width: 10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FadeInDown(child: pantalla()),
            SizedBox(
              height: 20,
            ),
            FadeInUp(child: botonera()),
          ],
        ),
      ),
    );
  }
}

class botonera extends StatelessWidget {
  const botonera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.shade900,

              ),
              height: 10,
              width: 100,
            ),
            SizedBox(width: 20,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade900,

              ),
              height: 10,
              width: 100,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.power_settings_new, color: Colors.blue),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.black, // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,

                    ),
                    height: 100,
                    width: 200,
                  ),

                ],
              ),
              Container(
                height: 200,
                width: 200,
                // color: Colors.blue,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)

                      ),
                      height: double.infinity,
                      width: 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)

                      ),
                      width: double.infinity,
                      height: 80,
                    ),
                    Positioned(
                      bottom: 150,
                      child: IconButton(
                        icon: Icon(Icons.north),
                        color: Colors.grey.shade700, 
                        onPressed: () {  

                        },
                        )
                    ),
                    Positioned(
                      left: 150,
                      child: IconButton(
                        icon: Icon(Icons.east,),
                        color: Colors.grey.shade700, 
                        onPressed: () {  
                          context.read<PokeProvider>().increment();

                        },
                      )
                    ),
                    Positioned(
                      top: 150,
                      child: IconButton(
                        icon: Icon(Icons.south,),
                        color: Colors.grey.shade700, 
                        onPressed: () {  

                        },
                      )
                    ),
                    Positioned(
                      right: 150,
                      child: IconButton(
                        icon: Icon(Icons.west),
                        color: Colors.grey.shade700, 
                        onPressed: () {  
                          context.read<PokeProvider>().decrement();

                        },
                        )
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}

class pantalla extends StatelessWidget {
  const pantalla({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(95),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(color: Colors.red.shade900,width: 5)
      ),
      height: 350,
      width: 420,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LuzLed(Colors.red),
              SizedBox(width: 10,),
              LuzLed(Colors.red),
              SizedBox(width: 10,),
              LuzLed(Colors.red),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
              height: 230,
              width: 320,
              child: StatefulBuilder(builder: (context, setState) {
                var tmpIndex = context.watch<PokeProvider>().index;
                return BounceInUp(
                  child: Image.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${tmpIndex}.png',
                    fit: BoxFit.fitHeight,
                    height: 120,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress==null
                      ? BounceInUp(child: child,)
                      : FadeIn(child: Image.asset('assets/logoRIDE.png'));
                    },
                  ),
                );
              },)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LuzLed(Colors.red),
                SizedBox(width: 100,),
                Container(
                  height: 30,
                  width: 30,
                  child: Column(
                    children: [
                      Divider(height: 10,color: Colors.black,thickness: 5,),
                      Divider(height: 10,color: Colors.black,thickness: 5,),
                      Divider(height: 10,color: Colors.black,thickness: 5,),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ] 
      ),
    );
  }
}

class Cabecera extends StatelessWidget {
  const Cabecera({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //cabecera
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            border: BorderDirectional(
              bottom: BorderSide(color: Colors.red.shade900, width: 10),
            ),
          ),
          height: 200,
          width: double.infinity,
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Lente(),
        ),
        Positioned(
          top: 25,
          left: 160,
          child: LuzLed(Colors.red),
        ),
        Positioned(
          top: 25,
          left: 200,
          child: LuzLed(Colors.yellow),
        ),
        Positioned(
          top: 25,
          left: 240,
          child: LuzLed(Colors.green),
        ),
        Positioned(
          top: 130,
          left: 200,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              border: Border.all(color: Colors.red.shade900, width: 10),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(80),
              )
            ),
            height: 100,
            width: 1000,
          ),
        ),
      ],
    );
  }
}

class LuzLed extends StatelessWidget {
  final Color color;
  
  const LuzLed(
    this.color,
    {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue, width: 1),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      height: 30,
      width: 30,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue, width: 1),
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
          height: 22,
          width: 22,
        ),
      ),
    );
  }
}

class Lente extends StatelessWidget {
  const Lente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      height: 100,
      width: 100,
      child: Center(
        child:Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(color: Colors.lightBlue, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          height: 70,
          width: 70,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}