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
      backgroundColor: const Color(0xFF210635),
     appBar: AppBar(
  backgroundColor: const Color(0xFF210635),
  elevation: 0,
  leading: IconButton(
    onPressed: () {},
    icon: Icon(Icons.arrow_back,color: Colors.white,),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search, color: Colors.white),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.notifications, color: Colors.white),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.person, color: Colors.white),
    ),
  ],
),
      body: SingleChildScrollView(
        child: ListBody(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "PLACEHOLDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: PageView(
                controller: PageController(viewportFraction: 0.65),
                padEnds: false,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: InkWell(
                          onTap: () {},
                          child: Placeholder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "PLACEHOLDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: PageView(
                controller: PageController(viewportFraction: 0.65),
                padEnds: false,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: InkWell(
                          onTap: () {},
                          child: Placeholder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "PLACEHOLDER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 230,
              child: PageView(
                controller: PageController(viewportFraction: 0.65),
                padEnds: false,
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: InkWell(
                          onTap: () {},
                          child: Placeholder(),
                        ),
                      ),
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