import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:course_store_ui/constant/fakedata.dart';
import 'constant/colors.dart';



// Course Store Ui
// Follow Me On Instagram
// @Parsanik.dev



void main() {
  runApp(const Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: AppgradiantColors.appbarcolors)),
          ),
          toolbarHeight: 200,
          actions: [
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 17),
                      child: Text(appbartext,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 233, 232, 237),
                              fontWeight: FontWeight.w500,
                              fontSize: 22)),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32, bottom: 30),
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.white38,
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.notifications,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 360,
                  height: 58,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Your topic",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          // ignore: avoid_print
                          return print("Mic Dont Work");
                        },
                        child: const Icon(
                          Icons.mic,
                          size: 25,
                          color: Color.fromARGB(255, 132, 112, 233),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.black, width: 5),
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Explore Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 125,
                      top: 25,
                    ),
                    child: InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "See All",
                            style: TextStyle(
                                color: Color.fromARGB(255, 132, 112, 233),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        )),
                  ),
                ],
              ),
              // body items builder
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 12,
                    child: GridView.builder(
                        itemCount: ItemsData.length,
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 225,
                            crossAxisSpacing: 22,
                            mainAxisSpacing: 22,
                            crossAxisCount: 2,
                            childAspectRatio: 0.2),

                        //body items
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            //Border Be Card
                            borderRadius:
                                const BorderRadius.vertical(top: Radius.circular(45)),
                            child: Card(
                                elevation: 2,
                                color: const Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                shadowColor: Colors.black,

                                //items value
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 145,
                                      width: 210,
                                      child: Image(
                                        image: AssetImage(
                                            ItemsData[index].imageUrl),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 1),
                                          child: Text(
                                            ItemsData[index].title,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 1),
                                          child: Text(
                                            ItemsData[index].hinttitle,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          );
                        }),
                  ),
                ),
              ),
              const BottomMenu()
            ],
          ),
        ),
      ),
    );
  }
}

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    super.key,
  });

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 102, 76, 231),
        unselectedItemColor: const Color.fromARGB(255, 155, 148, 148),
        unselectedIconTheme:
            const IconThemeData(color: Color.fromARGB(255, 155, 148, 148)),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.star_fill,
              size: 28,
            ),
            label: "Featured",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.play_circle,
              size: 28,
            ),
            label: "My Learning",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              size: 28,
            ),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
              size: 28,
            ),
            label: "Settings",
          ),
        ]);
  }
}
