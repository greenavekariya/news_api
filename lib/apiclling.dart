import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/getdata.dart';

class TeslaNewsScreen extends StatefulWidget {
  @override
  _TeslaNewsScreenState createState() => _TeslaNewsScreenState();
}

class _TeslaNewsScreenState extends State<TeslaNewsScreen> {
  List<dynamic> articles = [];

  Future<void> fetchNews() async {
    final String apiKey = 'e2be94146e85421d97b5d1c909c3699e';
    final String apiUrl =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-02-19&sortBy=publishedAt&apiKey=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        articles = jsonData['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tesla News'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return InkWell(
           onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(Data: articles[index]["urlToImage"].toString(), title: articles[index]['title'].toString(), Discription: articles[index]['description'].toString(),),
              ),
            );
          },
            child: Container(
              margin: EdgeInsets.all(8.0), // Adjust the margin as needed
              padding: EdgeInsets.all(8.0), // Adjust the padding as needed
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  InkWell(
                    // onTap: (){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => HomeScreen(Data: articles[index]["urlToImage"].toString(), title: articles[index]["title"].toString(),),
                    //     ),
                    //   );
                    // },
                    child: Image.network(articles[index]["urlToImage"].toString()),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    articles[index]['title'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    articles[index]['description'].toString(),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

