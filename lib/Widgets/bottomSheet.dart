import 'package:flutter/material.dart';


var filters={//quest dict deve essere costruito dal database
  'Ristoranti': true,
  'Bar': true,
  'Parchi': true,
  'Scuole': true,
  'Parchi giochi': true,
};

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});

  @override
  _bottomSheetState createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {


  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
      child: Container(
        height: 300,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 0.50, color: Color(0xFFDEDEDE)),
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Scrollbar(
            child: ListView.separated(
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                itemCount: filters.keys.toList().length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Checkbox(
                            value: filters.values.toList()[index],
                            onChanged: (bool? value) {

                              setState(() {
                                filters[filters.keys.toList()[index]]=value!;
                              });
                            },
                          ),
                      // trailing: const Text(
                      //   "GFG",
                      //   style: TextStyle(color: Colors.green, fontSize: 15),
                      // ),
                      title: Text(filters.keys.toList()[index]));
                }),
          ),
        ),


        //
        //
        //
        // ListView(
        //   children: [
        //     CheckboxListTile(
        //       title: const Text('Animate Slowly'),
        //       value: false,
        //       onChanged: (bool? value) {
        //         setState(() {});
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
