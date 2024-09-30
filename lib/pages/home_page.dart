import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  final String username;

  const PageHome({
    super.key,
    required this.username,
  });

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: _appBar(),
      ),
      body: Column(
        children: [
          ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.4,
                  child: Image.network(
                    "https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/banner/bg_banner.webp",
                  ),
                ),
              ),
              _homeText(
                text: "Makan",
              ),
        ],
      ),
           
    );
  }

  Widget _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Selamat datang, ${widget.username}!"),
        const Text("Mau makan apa hari ini?"),
      ],
    );
  }
  Widget _homeText({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
