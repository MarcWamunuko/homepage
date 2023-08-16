// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage/utilities/task_tile.dart';

import '../utilities/emoticon_face.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                // Intro ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //welcome user
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Marc",
                          style: GoogleFonts.workSans(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "14th Jan 2006",
                          style:
                              GoogleFonts.workSans(color: Colors.purple[200]),
                        )
                      ],
                    ),

                    //Notify
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 91, 24, 172),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // Step tracker bar row
                Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 91, 24, 172),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions_run,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Steps:",
                          style: GoogleFonts.workSans(color: Colors.white),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 25,
                ),
                // How you feel

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How are you feeling?",
                      style: GoogleFonts.workSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),

                //Emoji Selection for mood

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //bad
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: "😶",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Bad",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    //decent
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: "😒",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Decent",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    //good
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: "🙂",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Good",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    //excellent
                    Column(
                      children: [
                        EmoticonFace(
                          emoticonFace: "😁",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Excellent",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: Container(
                padding: EdgeInsets.all(25),
                color: Colors.white,
                child: Center(
                  child: Column(children: [
                    // Task Heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tasks",
                          style: GoogleFonts.workSans(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Listview for tasks
                    Expanded(
                      child: ListView(
                        children: [
                          TaskTile(
                            icon: Icons.favorite,
                            taskName: "Physics Homework",
                            taskdes: "Research Report",
                            color: Colors.orange,
                          ),
                          TaskTile(
                              icon: Icons.book,
                              taskName: "Daily reading",
                              taskdes: "Read this certain book page 57",
                              color: Colors.green),
                          TaskTile(
                              icon: Icons.shopping_bag,
                              taskName: "Shopping",
                              taskdes: "Buy food",
                              color: Colors.pink),
                          TaskTile(
                              icon: Icons.gamepad,
                              taskName: "Chill",
                              taskdes: "Play some games",
                              color: Colors.blue),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
