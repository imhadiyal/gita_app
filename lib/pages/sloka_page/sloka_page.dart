import 'package:gita_app/headers.dart';
import 'package:gita_app/modal/helper.dart';

class SlokaPage extends StatelessWidget {
  const SlokaPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${data['name']}"),
        backgroundColor: const Color.fromRGBO(252, 181, 3, 1),
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder(
          future: JsonHelper.jsonHelper.getSloka1(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('Detail_Page',
                                arguments: snapshot.data![index]);
                          },
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 195, 11, 0.5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(2, 2),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Text(
                              "श्लोक:${snapshot.data![index]["verse_number"]}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("Error:${snapshot.error}");
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
