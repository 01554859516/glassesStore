import 'package:flutter/material.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/products/glasseschildren.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/products/glassesmen.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/products/glasseswomen.dart';

class SelectionGlasses extends StatelessWidget {
  const SelectionGlasses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 9, 211),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GlassesMen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "images/men.jpg",
                          ),
                        ),
                      ),
                      height: 220,
                      width: 400,
                    ),
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Men's glasses",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GlassesChildren(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "images/children.jpg",
                          ),
                        ),
                      ),
                      height: 220,
                      width: 400,
                    ),
                    Positioned.fill(
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Children's glasses",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GlassesWomen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "images/women.jpg",
                          ),
                        ),
                      ),
                      height: 220,
                      width: 400,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Women's glasses",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black87,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
