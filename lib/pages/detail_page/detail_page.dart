import 'package:gita_app/controller/data.dart';
import 'package:gita_app/headers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    slokacontroller mutable = Provider.of<slokacontroller>(context);
    slokacontroller unmutable =
        Provider.of<slokacontroller>(context, listen: false);
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(252, 181, 3, 1),
        foregroundColor: Colors.black,
        title: Text(
          "श्लोक:${data["verse_number"]}",
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                unmutable.languageChange();
              },
              icon: Icon(Icons.translate))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/image/bg.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText("श्लोक:${data["verse_number"]}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              SelectableText(
                  "${mutable.translate ? data["text"] : data["transliteration"]}",
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
