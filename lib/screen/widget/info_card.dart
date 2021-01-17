import 'package:campus_buddy/screen/desc_page.dart';
import 'package:campus_buddy/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoCard extends StatefulWidget {
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(Constants.collectionName)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading events...'));
            }
            var response = snapshot.data.docs;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait
                    ? 1
                    : (size.width >= 600 && size.width <= 1100)
                        ? 2
                        : 3,
                childAspectRatio: 16 / 9,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(isPortrait ? 8 : 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext contex) =>
                                  DescPage(response: response[index])));
                    },
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
                                leading: Padding(
                                  padding: EdgeInsets.all(size.height * 0.001),
                                  child: response[index]['imageURL'] == null
                                      ? Icon(
                                          Icons.work,
                                          size: size.height * 0.030,
                                          color: Colors.black45,
                                        )
                                      : Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              response[index]['imageURL']),
                                          height: size.height * 0.030,
                                        ),
                                ),
                                title: Padding(
                                  padding: EdgeInsets.all(size.height * 0.008),
                                  child: Text(
                                    response[index]['companyName'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                                          leading: FaIcon(
                                            FontAwesomeIcons.userTie,
                                            //size: size.height * 0.028,
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
                                          leading: FaIcon(
                                            FontAwesomeIcons.mapMarkedAlt,
                                            // size: size.height * 0.028,
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
                                          leading: FaIcon(
                                            FontAwesomeIcons.rupeeSign,
                                            //  size: size.height * 0.028,
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
                                          leading: FaIcon(
                                            FontAwesomeIcons.graduationCap,
                                            //  size: size.height * 0.028,
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
                  ),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          }),
    );
  }
}
