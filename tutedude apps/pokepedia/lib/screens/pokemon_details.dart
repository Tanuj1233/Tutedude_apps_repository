import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeDetails extends StatefulWidget {
  final tag;
  final pokedetails;
  final Color color;
  const PokeDetails({
    super.key,
    required this.tag,
    required this.pokedetails,
    required this.color,
  });

  @override
  State<PokeDetails> createState() => _PokeDetailsState();
}

class _PokeDetailsState extends State<PokeDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              "${widget.pokedetails['name']}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white30,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pokedetails['type'].join(', '),
                  style: const TextStyle(color: Colors.black26, fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.asset(
              "assets/images/pokeball.png",
              width: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 120,
            left: (width / 2) - 100,
            child: CachedNetworkImage(
              imageUrl: widget.pokedetails['img'],
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokedetails['name'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Height",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokedetails['height'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Weight",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokedetails['weight'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Spawn Time",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokedetails['spawn_time'],
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Weakness",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokedetails['weaknesses'].join(', '),
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              "Evolution",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ),
                          widget.pokedetails['next_evolution'] != null
                              ? SizedBox(
                                  height: 20,
                                  width: width * 0.5,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokedetails['next_evolution'].length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            widget.pokedetails['next_evolution']
                                                [index]['name'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }),
                                )
                              : const Text(
                                  "Maxed Out",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
