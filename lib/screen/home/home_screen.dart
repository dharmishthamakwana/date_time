import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/home_provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  home_provider? h1true;

  @override
  Widget build(BuildContext context) {
    h1true = Provider.of<home_provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Date and Time"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                  );
                },
                child: Text("Show bottomSheet"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  h1true!.date = (await showDatePicker(
                      context: context,
                      initialDate: h1true!.currentDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030)))!;
                  h1true!.ChangeDate(h1true!.date);
                },
                child: Text("Show datePicker")),
            SizedBox(
              height: 20,
            ),
            Text("${h1true!.date}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  h1true!.time = (await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: h1true!.currentTime.hour,
                          minute: h1true!.currentTime.minute)))!;
                  h1true!.ChangeTime(h1true!.time);
                },
                child: Text("Shoe timePicker")),
            SizedBox(
              height: 20,
            ),
            Text("${h1true!.time.hour} : ${h1true!.time.minute}")
          ],
        ),
      ),
    );
  }
}
