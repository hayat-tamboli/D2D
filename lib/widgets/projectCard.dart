import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    @required this.name,
    @required this.project,
    this.contributions,
    this.imageLink,
    this.issues,
    this.stars,
    this.forks,
    this.color = const Color(0xFF31D0AA),
    Key key,
  }) : super(key: key);

  final String name;
  final String project;
  final Color color;
  final int contributions;
  final int issues;
  final int stars;
  final int forks;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 180.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name/',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '$project',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    imageLink,
                    height: 42.0,
                    width: 42.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.people_outlined,
                    size: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$contributions',
                        style: TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Contributions',
                        style: TextStyle(
                          fontSize: 6.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$issues',
                        style: TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Issues',
                        style: TextStyle(
                          fontSize: 6.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.star_border_outlined,
                    size: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$stars',
                        style: TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Stars',
                        style: TextStyle(
                          fontSize: 6.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.call_split_rounded,
                    size: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$forks',
                        style: TextStyle(
                            fontSize: 8.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Forks',
                        style: TextStyle(
                          fontSize: 6.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF31D0AA),
              border: Border.all(
                width: 0.0,
                color: color,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            height: 2.0,
          ),
        ],
      ),
    );
  }
}
