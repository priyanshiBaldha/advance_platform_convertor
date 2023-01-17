import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class SettingsComponent extends StatefulWidget {
  const SettingsComponent({Key? key}) : super(key: key);

  @override
  State<SettingsComponent> createState() => _SettingsComponentState();
}

class _SettingsComponentState extends State<SettingsComponent> {
  DateTime CurrentDateTime = DateTime.now();
  TimeOfDay CurrentTime = TimeOfDay.now();
  String? selectedTime;

  List AllMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'august',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${CurrentDateTime.day}, ${AllMonth[CurrentDateTime.month - 1]} ${CurrentDateTime.year}",
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: (isIOS == false)
                ? ElevatedButton(
                    child: Text(
                      "Change Date",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: CurrentDateTime,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                      );
                      setState(() {
                        if (pickedDate != null) {
                          CurrentDateTime = pickedDate;
                        }
                      });
                    },
                  )
                : CupertinoButton.filled(
                    child: Text("Change Date"),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.white,
                            height: 220,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime value) {
                                setState(() {
                                  CurrentDateTime = value;
                                });
                              },
                              backgroundColor: CupertinoColors.systemBackground,
                              initialDateTime: CurrentDateTime,
                              maximumYear: 2050,
                              minimumYear: 2000,
                              mode: CupertinoDatePickerMode.date,
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Time",
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
              SizedBox(
                height: 10,
              ),
              // (CurrentTime.period.name == 'pm')
                   (CurrentTime.hour > 12)
                      ? Text(
                          "${CurrentTime.hour-12 } : ${CurrentTime.minute} ${CurrentTime.period.name}")
                      : Text(
                          "${CurrentTime.hour} : ${CurrentTime.minute} ${CurrentTime.period.name}",
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        )
                 // :(CurrentTime.hour==0)? Text(
                   //   "${CurrentTime.hour + 12} : ${CurrentTime.minute} ${CurrentTime.period.name}",
                     // style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    //):Text("${CurrentTime.hour} : ${CurrentTime.minute} ${CurrentTime.period.name}",)
            ],
          ),
          Container(
            width: double.infinity,
            child: (isIOS == false)
                ? ElevatedButton(
                    child: Text(
                      "Change Time",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: CurrentTime,
                          builder: (context, widget) {
                            return MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: false,
                                ),
                                child: widget!);
                          });
                      setState(() {
                        if (pickedTime != null) {
                          CurrentTime = pickedTime;
                        }
                      });
                    },
                  )
                : CupertinoButton.filled(
                    child: Text("Change Time"), onPressed: () {
                      showCupertinoModalPopup(context: context, builder: (context){
                        return Container(
                          height: 250,
                          color: Colors.white,
                          child: CupertinoDatePicker(
                            initialDateTime: CurrentDateTime,
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (DateTime dateTime){
                              int hour = dateTime.hour;
                              int minute = dateTime.minute;
                              setState(() {
                                CurrentTime = TimeOfDay(hour: hour, minute: minute);
                                // CurrentTime = "${(dateTime.hour == 00) ? 12 : (dateTime.hour >= 12) ? (dateTime.hour == 12) ? 12 : dateTime.hour - 12 : dateTime.hour}:${(dateTime.minute <= 9) ? "0${dateTime.minute}" : dateTime.minute}  ${(dateTime.hour >= 12) ? "pm" : "am"}";
                              });
                            },
                            backgroundColor: CupertinoColors.systemBackground,
                          ),
                        );
                      });
            }),
          ),
        ],
      ),
    );
  }
}
