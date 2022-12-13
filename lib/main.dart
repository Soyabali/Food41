import 'package:flutter/material.dart';
import 'package:food41/fruits.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: (){},
                  icon: Icon(Icons.menu,color: Colors.grey)),
              Container(
                height: 50.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )

                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(Icons.search,color: Colors.grey)
                  ),
                ),

              ),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.shopping_cart,color: Colors.grey,))
              

              
            ],
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('All fruits',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 25.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.6),
                isScrollable:true,
                tabs: <Widget>[
                  Tab(
                    child: Text('Avocado',style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Tab(
                    child: Text('Grapes',style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Tab(
                    child: Text('Apple',style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Tab(
                    child: Text('Grapefruit',style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold
                    ),),
                  ),
              
            ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height -375.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new FruitsPage(),
                new FruitsPage(),
                new FruitsPage(),
                new FruitsPage()
              ],
            ),

          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Sales',style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 20.0)),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                // here you call a bottom card
                _buildFoodItem('assets/greenapple.png', '80', '\$13.88'),
                _buildFoodItem('assets/lemon.png', '75', '\$15.00'),
                _buildFoodItem('assets/orange.png', '89', '\$11.86'),
                _buildFoodItem('assets/greenapple.png', '80', '\$13.88'),
                _buildFoodItem('assets/lemon.png', '75', '\$15.00'),
                _buildFoodItem('assets/orange.png', '89', '\$11.86')
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildFoodItem(String imgPath,String discount,String price){
    return Padding(padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 125.0,
            width: 125.0,
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 25.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD2691F),
                  borderRadius: BorderRadius.circular(7.0)
                ),
              )),
          Positioned(
              top: 7.0,
              child: Container(
                height: 110.0,
                width: 125.0,
                decoration: BoxDecoration(
                  color: Color(0xFFAAC2A5),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                    Image.asset(imgPath,fit: BoxFit.cover,
                    height: 70.0,
                    ),
                    Text(price,style: TextStyle(
                     fontFamily: 'Quicksand',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white


                    ),)

                  ],
                ),

              )),
          Positioned(
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE9741),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0),
                  bottomRight: Radius.circular(7.0),
                    bottomLeft: Radius.circular(7.0)
                  )


                ),
                child: Center(
                  child: Text(
                    discount + '%',style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 9.0,
                    color: Colors.white
                  ),
                  ),
                ),

              ))
        ],
      ),
    );
  }
}


