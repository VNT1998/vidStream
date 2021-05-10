import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Download1 extends StatefulWidget {
  final String vUrl;
  final String imageUrl;
  const Download1({Key key, @required this.vUrl, @required this.imageUrl})
      : super(key: key);

  @override
  Download1State createState() {
    return new Download1State();
  }
}

class Download1State extends State<Download1> {
  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();

    downloadFile();
  }

  Future<void> downloadFile() async {
    String videoUrl = widget.vUrl;

    Dio dio = Dio();
    try {
      var dir = await getExternalStorageDirectory();
      // var dir = await getDownloadsDirectory();
      print(dir);
      print(widget.imageUrl);

      await dio.download(videoUrl, "${dir.path}/myimage.jpg",
          onReceiveProgress: (rec, total) {
        //rprint("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: downloading
            ? Container(
                height: 300.0,
                width: 300.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 200,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Text("No Data"),
      ),
    );
  }
}
