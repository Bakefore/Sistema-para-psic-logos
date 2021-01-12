import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistema_para_psicologos/app/usuarios/CadastrarUsuarios.dart';
import 'package:sistema_para_psicologos/app/usuarios/UsuarioVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _realizarLogin(BuildContext context) async{
    QuerySnapshot snapshot = await Firestore.instance.collection("usuarios").getDocuments();    
    
    setState(() {
      snapshot.documents.forEach((element) {
        if((emailController.text == element.data["email"]) && (senhaController.text == element.data["senha"])){
          // MyApp.usuarioLogado = UsuarioVO.toUsuario(element);
          MyApp.idUsuarioLogado = element["id"];
          Navigator.pushReplacementNamed(context, 'dashboard');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auxiliar para Psicólogos"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("lib/images/psicologia128px.png"),
              ),
              TextFormField(
                //autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: emailController,
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira seu E-mail!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: senhaController,
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira sua senha!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _realizarLogin(context);
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                      child: Text(
                          "Cadastrar-se",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>CadastrarUsuario()
                          )
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
