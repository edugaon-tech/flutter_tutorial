import 'dart:io';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({super.key});

  @override
  State<FileDownloadScreen> createState() => _FileDownloadScreenState();
}

class _FileDownloadScreenState extends State<FileDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          downloadingInBackground();
        }, child: Text("On Click")),
      ),
    );
  }


  downloadingInBackground()async{
    var port = ReceivePort();
    await Isolate.spawn(downloadFile, port.sendPort);
    return await port.first;
  }

  downloadFile(SendPort port)async{
    var response = await http.get(Uri.parse("http://212.183.159.230/50MB.zip"));
    if(response.statusCode == 200){
      print("downloading stated");
      var path = await getApplicationDocumentsDirectory();
      var file = File("${path.path}/downloaded_file.zip");
      await file.writeAsBytes(response.bodyBytes);
      port.send("Downloading");
    }else{
      print(response.reasonPhrase);
      port.send(response.reasonPhrase);
    }
  }

}
