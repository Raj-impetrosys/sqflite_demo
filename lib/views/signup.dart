import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_demo/db/db.dart';
import 'package:sqflite_demo/db/entity.dart';
import 'package:sqflite_demo/views/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: CustomPainter2(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Register Now",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 80,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 30,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              color: Colors.black54,
                              width: 1,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      labelText: "Username",
                      hintText: "Enter your username",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      labelStyle:
                          const TextStyle(color: Colors.brown, fontSize: 22)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 30,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.alternate_email,
                              color: Colors.black54,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              color: Colors.black54,
                              width: 1,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      labelText: "Email",
                      hintText: "Enter your Email Address",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      labelStyle:
                          const TextStyle(color: Colors.brown, fontSize: 22)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.black54,
                            width: 1,
                            height: 40,
                          )
                        ],
                      ),
                    ),
                    labelText: "Password",
                    hintText: "Enter your password",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
                    labelStyle:
                        const TextStyle(color: Colors.brown, fontSize: 22),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                RawMaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  fillColor: Colors.red,
                  onPressed: () async {
                    // Navigator.of(context)
                    //     .pushReplacement(createRoute(Login()));
                    final database = await $FloorAppDatabase
                        .databaseBuilder('app_database.db')
                        .build();

                    final personDao = database.personDao;
                    final person = Person(1, 'Frank');

                    await personDao.insertPerson(person);
                    final result = personDao.findPersonById(1);
                    print(result);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const Login());
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => const Login()));
                    },
                    child: const Text("Already have an account? Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xffFFA958).withOpacity(0.9),
          const Color(0xffcc4958).withOpacity(0.9),
        ],
      ).createShader(Rect.fromLTRB(size.width, 10, 10, 10))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final paint1 = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xff3333ff).withOpacity(0.8),
          const Color(0xff2381ff).withOpacity(0.8),
        ],
      ).createShader(Rect.fromLTRB(size.width / 2, 400, 0, 10))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(size.width / 2, size.height / 1.5, 300, size.height / 10,
          size.width, size.height / 3)
      ..lineTo(size.width, 0)
      ..close();

    final path1 = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(size.width / 3, size.height / 4, 270, size.height / 3 + 30,
          size.width, size.height / 3 + 30)
      ..cubicTo(0, 600, 0, size.height * 1.2, size.width, size.height * 1.0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 3 * 0, 0)
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
