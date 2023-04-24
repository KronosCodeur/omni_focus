import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omni_focus/models/task.dart';
import 'package:omni_focus/providers/task_provider.dart';
import 'package:omni_focus/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  static String routeName = "/Tasks-Screen";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    List<Task> listOfAllTaks = context.watch<TaskState>().listOfAllTasks;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffe5faff),
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tasks",
          style: GoogleFonts.urbanist(
              color: const Color(0xff0f102c),
              fontWeight: FontWeight.w800,
              fontSize: 35),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddTaskScreen.routeName);
              },
              icon: const Icon(
                Icons.add_task_rounded,
                color: Color(0xff1772ff),
                size: 30,
              ))
        ],
      ),
      backgroundColor: const Color(0xffe5faff),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView.builder(
          itemCount: listOfAllTaks.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              //height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xff0f102c).withAlpha(75),
                        blurRadius: 5.0,
                        offset: const Offset(0, 3),
                        spreadRadius: 1.0)
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfAllTaks[index].title,
                    style: GoogleFonts.urbanist(
                        color: const Color(0xff0f102c),
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  const Gap(5),
                  Text(
                    listOfAllTaks[index].description,
                    style: GoogleFonts.urbanist(
                        color: const Color(0xff0f102c),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        listOfAllTaks[index].date.toString().substring(0, 16),
                        style: GoogleFonts.urbanist(
                            color: const Color(0xff0f102c).withAlpha(150),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<TaskState>()
                              .removeTask(listOfAllTaks[index]);
                        },
                        child: Icon(
                          Icons.delete_rounded,
                          size: 25,
                          color: Colors.red.shade900,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
