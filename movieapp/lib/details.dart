import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details extends StatefulWidget {
  final String text;

  const Details({Key key, this.text}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool called = false;
  bool noResponse = false;
  String title = ' ';
  String year = '';
  String released = '';
  String runtime = '';
  String genre = '';
  String actors = '';
  String director = '';
  String imdb = '';
  String posterurl = '';
  String reply = '';

  getMovie() async {
    http.Response response = await http.get(Uri.parse(
        'https://www.omdbapi.com/?t=' + widget.text + '&apikey=91d34d7'));

    var client = jsonDecode(response.body);
    // print(client['Title']);
    // print(client['Year']);
    // print(client['Released']);
    // print(client['Runtime']);
    // print(client['Genre']);
    // print(client['Director']);
    // print(client['Actors']);
    // print(client['imdbRating']);

    setState(() {
      title = client['Title'];
      year = client['Year'];
      released = client['Released'];
      runtime = client['Runtime'];
      genre = client['Genre'];
      actors = client['Actors'];
      director = client['Director'];
      imdb = client['imdbRating'];
      posterurl = client['Poster'];
      called = true;
      reply = client['Response'];
    });

    if (reply == 'False') {
      noResponse = true;
    }
  }

  @override
  void initState() {
    getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.itim(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: noResponse
            ? Column(
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Center(
                      child: Text(
                    'You Spelled It Wrong!',
                    style: GoogleFonts.itim(
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ],
              )
            : Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 350,
                      width: 450,
                      child: called
                          ? Image.network(
                              posterurl,
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Title : ' + title,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(3.0),
                  //   child: Text(
                  //     year,
                  //     style: TextStyle(fontSize: 22),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Release Date : ' + released,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Runtime : ' + runtime,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Genre : ' + genre,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Cast : ' + actors,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'Director : ' + director,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(3.0),
                  //   child: Text(
                  //     actors,
                  //     style: TextStyle(fontSize: 22),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        'IMDB rating : ' + imdb,
                        style: GoogleFonts.itim(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
