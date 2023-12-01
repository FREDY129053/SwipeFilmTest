import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget{
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>
{
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    // адаптивка
    double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
    const mainTextColor = Color.fromRGBO(135, 59, 49, 1);
    return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xFFF5F0E1),

          body: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      //звезда сверху
                      Transform.translate(
                        offset: Offset(-160, 220),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(30 / 360),
                          child: Opacity(
                            opacity: 0.5,
                            child: SvgPicture.asset('assets/svg/mainmenu_star2.svg'),
                          ),
                        ),
                      ),

                      // звезда снизу
                      Transform.translate(
                        offset: Offset(170, 550),
                        child: ScaleTransition(
                          scale: AlwaysStoppedAnimation(0.8),
                          child: Opacity(
                            opacity: 0.5,
                            child: SvgPicture.asset('assets/svg/mainmenu_star2.svg'),
                          ),
                        ),
                      ),

                      // логотип
                      Container(
                        alignment: Alignment.topCenter,
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: deviceHeight(context)*0.07),
                        child: SvgPicture.asset('assets/svg/app_logo.svg'),
                      ),

                      // первый текст
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: deviceHeight(context)*0.18),
                            child: Text('Войти',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway
                                (fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: mainTextColor),
                            ),
                          )
                      ),

                      // второй текст
                      Container(
                        margin: EdgeInsets.only(top: deviceHeight(context)*0.23),
                        child: Text('Войдите в свой аккаунт, чтобы\nпользоваться приложением',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway
                            (fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: mainTextColor),
                        ),
                      ),

                      //колонка из полей
                      Container(
                          //width: 350,
                          padding: EdgeInsets.only(
                              top: deviceHeight(context)*0.3,
                              left:deviceWidth(context)*0.07,
                              right: deviceWidth(context)*0.07),
                          child: Column(
                            children: [

                              // логин
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Text('Логин',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway
                                    (fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                      color: mainTextColor),
                                ),
                              ),

                              // поле для ввода логина
                              TextFormField(
                                style: TextStyle(
                                    color: Color.fromRGBO(186, 151, 161, 1)),
                                decoration: InputDecoration(
                                    fillColor: Color.fromRGBO(255, 248, 246, 1),
                                    filled: true,
                                    hintText: 'Введите логин',
                                    hintStyle: const TextStyle(
                                        color: Color.fromRGBO(186, 151, 161, 1)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),
                              // подпись об ошибке
                              Container(
                                padding: EdgeInsets.only(top: 5, left: 10),
                                alignment: Alignment.centerLeft,
                                  child: Text('Неверный логин!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway
                                      (fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color.fromRGBO(172, 31, 31, 1)),
                                  ),
                              ),

                              // отступ
                              const SizedBox(
                                height: 20,
                              ),

                              // пароль
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Text('Пароль',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway
                                    (fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                      color: mainTextColor),
                                ),
                              ),

                              // поле для ввода пароля
                              TextFormField(
                                obscureText: _obsecureText,
                                //obscuringCharacter: "*",
                                style: const TextStyle(
                                    color: Color.fromRGBO(186, 151, 161, 1)),
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: (){
                                        setState(() {
                                          _obsecureText =! _obsecureText;
                                        });
                                      }, icon: Icon(_obsecureText? Icons.visibility: Icons.visibility_off),
                                    ),
                                    suffixIconColor: Color.fromRGBO(186, 151, 161, 1),
                                    fillColor: Color.fromRGBO(255, 248, 246, 1),
                                    filled: true,
                                    hintText: 'Введите пароль',
                                    hintStyle: const TextStyle(
                                        color: Color.fromRGBO(186, 151, 161, 1)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    )
                                ),
                              ),


                              // кнопка под паролем и подпись
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerLeft,
                                    child: Text('Неверный пароль!',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway
                                        (fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color.fromRGBO(172, 31, 31, 1)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child:  TextButton(
                                      child: Text('Забыли пароль?'),
                                      style: TextButton.styleFrom(
                                          foregroundColor: mainTextColor
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),


                              // кнопка входа
                              Container(
                                  margin: EdgeInsets.only(top: deviceHeight(context)*0.05),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Color.fromRGBO(184, 9, 72, 0.25),
                                      elevation: 10,
                                      backgroundColor: Color.fromRGBO(231, 104, 56, 1),
                                      minimumSize: Size(350, 55),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('/main');
                                    },
                                    child: Text('Войти',
                                      style: GoogleFonts.raleway
                                        (fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  )
                              ),

                              //ряд для текста и кнопки
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // текст
                                  Padding(
                                    padding: EdgeInsets.only(top: deviceHeight(context)*0.01),
                                    child: Text('Нет аккаунта?',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway
                                        (fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: mainTextColor),
                                    ),
                                  ),

                                  // кнопка для регистрации
                                  Padding(
                                    padding: EdgeInsets.only(top: deviceHeight(context)*0.01),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                          foregroundColor: Color.fromRGBO(231, 104, 56, 1)
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pushNamed('/sign_up');
                                      },
                                      child: Text('Зарегистрируйтесь',
                                        style: GoogleFonts.raleway
                                          (fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                    ],
                  ),

                ],
              ),
      );
  }
}