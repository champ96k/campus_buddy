import 'package:campus_buddy/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final Size size = MediaQuery.of(context).size;
    CollectionReference info =
        FirebaseFirestore.instance.collection(Constants.collectionName);
    return FutureBuilder<DocumentSnapshot>(
      future: info.doc(Constants.documentName).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        try {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Something went wrong"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            var response = data['jobs'];
            print("Data: ${data['jobs']}");
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 1 : 3,
                childAspectRatio: 16 / 9,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      margin: EdgeInsets.all(6),
                      elevation: 2.75,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.1),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Container(
                              child: ListTile(
                                leading: Icon(
                                  Icons.ac_unit,
                                  size: size.height * 0.036,
                                ),
                                title: Text(
                                  response[index]['companyName'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  response[index]['lastDate'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            size: size.height * 0.036,
                                          ),
                                          title: Text(
                                            Constants.lookingFor,
                                            style: TextStyle(
                                                fontSize: size.height * 0.0176,
                                                color: Colors.grey),
                                          ),
                                          subtitle: Text(
                                            response[index]['roll'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: size.height * 0.019,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.location_on,
                                            size: size.height * 0.036,
                                          ),
                                          title: Text(
                                            Constants.location,
                                            style: TextStyle(
                                                fontSize: size.height * 0.0176,
                                                color: Colors.grey),
                                          ),
                                          subtitle: Text(
                                            response[index]['location'],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: size.height * 0.019,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            size: size.height * 0.036,
                                          ),
                                          title: Text(
                                            Constants.salary,
                                            style: TextStyle(
                                                fontSize: size.height * 0.0176,
                                                color: Colors.grey),
                                          ),
                                          subtitle: Text(
                                            response[index]['salary'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: size.height * 0.0196,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.location_on,
                                            size: size.height * 0.036,
                                          ),
                                          title: Text(
                                            Constants.batch,
                                            style: TextStyle(
                                                fontSize: size.height * 0.0176,
                                                color: Colors.grey),
                                          ),
                                          subtitle: Text(
                                            response[index]['batch'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: size.height * 0.019,
                                                color: Colors.green),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: response.length,
              ),
            );
          }
          return Scaffold(
                      body: Center(
              child: Text("loading"),
            ),
          );
        } catch (e) {
          print(e);
          return Scaffold(
            body: Center(
              child: Text("Something went wrong")
              )
            );
        }
      },
    );
  }
}
