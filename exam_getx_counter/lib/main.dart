import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        body: Center(
            child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
          onPressed: c.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${c.count}"),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Get.back(), child: const Text("Go back")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Get.off(Other2()), child: const Text("Go off")),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Get.changeTheme(ThemeData.light()),
                  child: const Text("Light theme")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () => Get.changeTheme(ThemeData.dark()),
                  child: const Text("Dark theme")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => Get.dialog(Center(
                    child: Container(
                      width: 400,
                      height: 400,
                      child: Text("Dialog"),
                    ),
                  )),
              child: Text("Pop dialog"))
        ],
      ),
    ));
  }
}

class Other2 extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Popping!!")),
    );
  }
}
