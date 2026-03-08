import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Placeholder(),
        ),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            Text("PLACEHOLDER"),
            SizedBox(
              height: 200,
              child: PageView(
                children: List.generate(
                  10,
                  (index) => Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Placeholder(),
                    ),
                  ),
                ),
              ),
            ),
            Text("PLACEHOLDER"),
            SizedBox(
              height: 200,
              child: PageView(
                controller: PageController(viewportFraction: 0.7),
                padEnds: false,
                children: List.generate(
                  10,
                  (index) => Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Placeholder(),
                    ),
                  ),
                ),
              ),
            ),
            Text("PLACEHOLDER"),
            SizedBox(
              height: 200,
              child: PageView(
                controller: PageController(viewportFraction: 0.7),
                padEnds: false,
                children: List.generate(
                  10,
                  (index) => Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Placeholder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}