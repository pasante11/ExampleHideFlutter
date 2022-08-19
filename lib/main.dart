import "package:flutter/material.dart";

void main() {
  runApp(ControlleApp());
}

class ControlleApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        visibilityTag = visibility;
      }
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF26C6DA)),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            child: FlutterLogo(size: 100.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                visibilityObs ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Expanded(
                      flex: 11,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "Observation",
                          isDense: true
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        color: Colors.grey[400],
                        icon: const Icon(Icons.cancel, size: 22.0,),
                        onPressed: () {
                          _changed(false, "obs");
                        },
                      ),
                    ),
                  ],
                ) : Container(),

                visibilityTag ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Expanded(
                      flex: 11,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: "Tags",
                          isDense: true
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        color: Colors.grey[400],
                        icon: const Icon(Icons.cancel, size: 22.0,),
                        onPressed: () {
                          _changed(false, "tag");
                        },
                      ),
                    ),
                  ],
                ) : Container(),
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  visibilityObs ? null : _changed(true, "obs");
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.comment, color: visibilityObs ? Colors.grey[400] : Colors.grey[600]),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Observation",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilityObs ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(width: 24.0),
              InkWell(
                onTap: () {
                  visibilityTag ? null : _changed(true, "tag");
                },
                child: Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.local_offer, color: visibilityTag ? Colors.grey[400] : Colors.grey[600]),
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Tags",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilityTag ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          )                    
        ],
      )
    );
  }
}