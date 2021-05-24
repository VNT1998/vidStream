import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';

//import package files

//apply this class on home: attribute at MaterialApp()
class DownloadDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DownloadDisplay();
  }
}

class _DownloadDisplay extends State<DownloadDisplay> {
  var files;

  void getFiles() async {
    // asyn function to get list of files
    // List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    // print(storageInfo);
    // var root = storageInfo[1].rootDir;
    // print(root);
    var dir = await getExternalStorageDirectory();
    //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(
      root: Directory(dir.path),
    ); //
    files = await fm.filesTree(
        //set fm.dirsTree() for directory/folder tree list
        //excludedPaths: ["/storage/emulated/0/Android"],
        //extensions: [
        //   "png",
        //   "pdf"
        // ] //optional, to filter files, remove to list all,
        //remove this if your are grabbing folder list
        );
    print(files[0].path);
    setState(() {}); //update the UI
  }

  // void deleteFile(var index) {
  //   var filePath = files[index].path;
  //   print(filePath);
  //   filePath.delete();
  //   setState(() {});
  // }
  // ignore: missing_return
  Future<int> deleteFile(var index) async {
    try {
      var filePath = files[index].path;
      final file = await filePath;

      await file.delete();
      setState(() {});
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Downloads",
              style: Theme.of(context).textTheme.headline6,
            ),
            backgroundColor: Colors.transparent),
        body: files == null
            ? Center(child: Text("Searching Files"))
            : ListView.builder(
                //if file/folder list is grabbed, then show here
                itemCount: files?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white54,
                      child: ListTile(
                        title: Text(
                          files[index].path.split('/').last,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        leading: Icon(Icons.image),
                        trailing: IconButton(
                          onPressed: () => deleteFile(index),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ));
                },
              ));
  }
}
