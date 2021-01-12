import 'package:flutter/material.dart';

abstract class TelaSTL extends StatelessWidget {
  chamarNavigator(BuildContext context, destino){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>destino
        )
    );
  }

  Padding criar_btn(String textoBotao, String caminhoIcone, funcao){
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        height: 55.0,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: SizedBox(
                    child: Image.asset(caminhoIcone),
                    height: 40,
                    width: 40,
                  ),
                ),
                Text(
                  textoBotao,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            onPressed: funcao,
          ),
        ),
      ),
    );
  }

  Padding criar_btn_sem_icone(String textoBotao, funcao){
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        height: 55.0,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color.fromRGBO(107,142,35, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: SizedBox.expand(
          child: FlatButton(
            child: Text(
              textoBotao,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: funcao,
          ),
        ),
      ),
    );
  }

  TextFormField criar_form_field(String textoLabel, bool obscuro, TextEditingController controlador, String textoValidador, tipoDeTeclado){
    return TextFormField(
      keyboardType: tipoDeTeclado,
      obscureText: obscuro,
      decoration: InputDecoration(
          labelText: textoLabel,
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controlador,
      validator: (value) {
        if(value.isEmpty){
          return textoValidador;
        }
      },
    );
  }
}
