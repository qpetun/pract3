import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentImageIndex=0;
  List<String> _imageUrls=[
    "https://traveltimes.ru/wp-content/uploads/2021/09/7c20839d1cbe4993ba7d13ec77159050.max-1200x800-1.jpg",
    "https://crosti.ru/patterns/00/26/6c/70_picture_a6b2e933.jpg",
    "https://sportishka.com/uploads/posts/2022-11/1667558932_1-sportishka-com-p-samoe-glubokoe-ozero-baikal-krasivo-1.jpg",
    "https://sportishka.com/uploads/posts/2022-11/1667490288_22-sportishka-com-p-ozero-baikal-turizm-krasivo-25.jpg",
    "http://storage.yandexcloud.net/storage.yasno.media/nat-geo/images/2019/9/29/f9a733f5ce1b4bf28636f728bd553fd6.max-1200x800.jpg",
    "https://vsegda-pomnim.com/uploads/posts/2022-03/1647367459_6-vsegda-pomnim-com-p-ozero-khantaiskoe-foto-6.jpg"
  ];

  List<String> _nameUrls=[
    "Горы Алтая",
    "Озеро Байкал",
    "Хантайское озеро"
  ];
  int _str_counter = 0;
  String str='Первый текст';

  @override
  Widget build(BuildContext context) {


    void changeUp(){
      setState(() {
        if (_str_counter<_nameUrls.length-1){
          _str_counter++;
        }
        else{
          _str_counter=0;
        }
        if (_currentImageIndex<_imageUrls.length-2){
          _currentImageIndex++;
          _currentImageIndex++;
        }
        else{
          _currentImageIndex=0;
        }
      });
    }
    void changeDown(){
      setState(() {
        if (_str_counter>0){
          _str_counter--;
        }
        else{
          _str_counter=_nameUrls.length-1;
        }
        if (_currentImageIndex>0){
          _currentImageIndex--;
          _currentImageIndex--;
        }
        else{
          _currentImageIndex=_imageUrls.length-2;
        }
      });
    }




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Практическая №3"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Природные достопримечательности России",
                  textAlign: TextAlign.center,
                  style: TextStyle(color:Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _nameUrls[_str_counter],
                  textAlign: TextAlign.center,
                  style: TextStyle(color:Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: changeDown, style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15)), child: const Text('Назад')),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: changeUp, style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15)), child: const Text('Вперед')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
               const Spacer(),
                Column(
                  children: [
                    Image.network(
                      _imageUrls[_currentImageIndex],
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Image.network(
                      _imageUrls[_currentImageIndex+1],
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const Spacer(),
              ]
            ),

          ],
        ),
      ),
    );
  }
}


