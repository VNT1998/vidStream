import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Download extends StatefulWidget {
  Download({
    Key key,
  }) : super(key: key);

  //final String title;

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  bool downloading = false;

  String progress = '0';

  bool isDownloaded = false;

  String uri =
      'https://file-examples.com/wp-content/uploads/2017/10/file-example_PDF_1MB.pdf'; // url of the file to be downloaded

  String filename = 'test.pdf'; // file name that you desire to keep

  // downloading logic is handled by this method

  Future<void> downloadFile(uri, fileName) async {
    setState(() {
      downloading = true;
    });

    String savePath = await getFilePath(fileName);

    Dio dio = Dio();

    dio.download(
      uri,
      savePath,
      onReceiveProgress: (rcv, total) {
        print(
            'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

        setState(() {
          progress = ((rcv / total) * 100).toStringAsFixed(0);
        });

        if (progress == '100') {
          setState(() {
            isDownloaded = true;
          });
        } else if (double.parse(progress) < 100) {}
      },
      deleteOnError: true,
    ).then((_) {
      setState(() {
        if (progress == '100') {
          isDownloaded = true;
        }

        downloading = false;
      });
    });
  }

  //gets the applicationDirectory and path for the to-be downloaded file

  // which will be used to save the file to that path in the downloadFile method

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getExternalStorageDirectory();

    path = '${dir.path}/$uniqueFileName.pdf';

    return path;
  }

  @override
  Widget build(BuildContext context) {
    print('build running');

    return Scaffold(
      appBar: AppBar(
        title: Text("Download"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$progress%'),
              isDownloaded
                  ? Text(
                      'File Downloaded! You can see your file in the application\'s directory',
                    )
                  : Text(
                      'Click the FloatingActionButton to start Downloading!'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () async {
            downloadFile(uri, filename);
          }),
    );
  }
}
