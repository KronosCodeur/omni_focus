import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omni_focus/models/task.dart';
import 'package:omni_focus/providers/task_provider.dart';
import 'package:omni_focus/screens/taks_screen.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  static String routeName = "/add-Task";
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5faff),
      appBar: AppBar(
        backgroundColor: Color(0xffe5faff),
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add a Task",
          style: GoogleFonts.urbanist(
              color: Color(0xff0f102c),
              fontWeight: FontWeight.w800,
              fontSize: 35),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, TasksScreen.routeName);
              },
              icon: Icon(
                Icons.task_rounded,
                color: Color(0xff1772ff),
                size: 30,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Gap(30),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez remplir ce Champ";
                        }
                      },
                      controller: titleCtrl,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabled: true,
                        filled: true,
                        fillColor: Color(0xff0f102c).withAlpha(25),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        hintText: "Title",
                        hintStyle: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff0f102c).withOpacity(0.5)),
                        prefixIcon: Icon(
                          Icons.title_rounded,
                          color: Color(0xff1772ff),
                          size: 25,
                        ),
                      ),
                    ),
                    Gap(30),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez remplir ce Champ";
                        }
                      },
                      maxLines: 5,
                      controller: descriptionCtrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabled: true,
                        filled: true,
                        fillColor: Color(0xff0f102c).withAlpha(25),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xff0f102c)),
                        ),
                        hintText: "Type the description of the task here..",
                        hintStyle: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff0f102c).withOpacity(0.5)),
                        prefixIcon: Icon(
                          Icons.description,
                          size: 25,
                          color: Color(0xff1772ff),
                        ),
                      ),
                    ),
                    Gap(30),
                  ],
                )),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff1772ff)),
                    elevation: MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    maximumSize: MaterialStatePropertyAll(Size(200, 60))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<TaskState>().addTask(Task(
                        titleCtrl.text, descriptionCtrl.text, DateTime.now()));
                    titleCtrl.clear();
                    descriptionCtrl.clear();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Task",
                        style: GoogleFonts.urbanist(
                            color: Color(0xff0f102c),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xff0f102c),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
