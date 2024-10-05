import 'dart:developer';
import 'package:gita_app/controller/data.dart';
import 'package:gita_app/headers.dart';
import 'package:gita_app/modal/helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    slokacontroller mutable = Provider.of<slokacontroller>(context);
    slokacontroller unmutable =
        Provider.of<slokacontroller>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("श्रीमद् भागवत गीता",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(252, 181, 3, 1),
        foregroundColor: Colors.black,
        actions: [
          Consumer<slokacontroller>(builder: (context, Provider, child) {
            return IconButton(
                onPressed: () {
                  Provider.listchange();
                },
                icon: Icon(Provider.list ? Icons.list : Icons.grid_view));
          })
        ],
      ),
      body: FutureBuilder(
        future: JsonHelper.jsonHelper.getSloka(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return unmutable.list
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Object data = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("Sloka_Page", arguments: data);
                          },
                          title: Text(
                            "${snapshot.data![index]["name"]}",
                          ),
                          subtitle: Text(
                            "${snapshot.data![index]["name_translation"]}\n${snapshot.data![index]['verses_count']} श्लोक",
                          ),
                          tileColor: Color.fromRGBO(255, 195, 11, 0.5),
                          leading: Container(
                            margin: const EdgeInsets.all(10),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                color: Color.fromRGBO(244, 216, 109, 0.5)),
                            child: Center(
                              child: Text(
                                "${snapshot.data![index]["id"]}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(252, 181, 3, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Object data = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("Sloka_Page", arguments: data);
                        },
                        child: Card(
                          color: Color.fromRGBO(255, 195, 11, 0.5),
                          margin: const EdgeInsets.all(10),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      color:
                                          Color.fromRGBO(244, 216, 109, 0.5)),
                                  child: Center(
                                    child: Text(
                                      "${snapshot.data![index]["id"]}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child:
                                      Text("${snapshot.data![index]["name"]}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          )),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
