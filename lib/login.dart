import 'package:flutter/material.dart';
import 'package:tugas_besar_1/bahan.dart';
import 'package:tugas_besar_1/tampilan_produk.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) :super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 78),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME BACK", style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),),
            SizedBox(height: 11),
            Text("Ada harga, Ada kualitas, Di sini tempat baja MURAH, MEWAH, MEGAH", style: textTextStyle.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 64),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Email",style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TextColor,
                  ),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "XXXXXXXXXXX",
                      hintStyle: secondTextStyle.copyWith(fontSize: 12, color: secondTextColor.withOpacity(0.6)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17)
                       ),
                  ),
                ),
                SizedBox(height: 15),  
                 Text("Password",style: textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: TextColor,
                  ),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      suffixIcon: Icon(Icons.visibility_off)
                       ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                
                Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(
                    color: TextColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(width: 15),
                Text("Remember Me", style: secondTextStyle.copyWith(fontSize: 12),),
                ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryButtonColor),
               onPressed: (){
                  // Implementasi login
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    // Ganti dengan validasi sesuai dengan kebutuhan
                    if (username.isNotEmpty && password == '0005') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Product_view()),
                      );
                    } else {
                      // Tampilkan pesan jika login gagal
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Login Gagal'),
                            content: Text('Username atau Password Salah'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
               },
               child: Text("LOGIN", style: textTextStyle.copyWith(fontWeight: bold),),

            ),
          ),
          

          ],
        ),
      ),
      ),
     
      
      );
    
  }
}