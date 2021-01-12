import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistema_para_psicologos/app/bairro/BairroBO.dart';
import 'package:sistema_para_psicologos/app/bairro/BairroVO.dart';
import 'package:sistema_para_psicologos/app/cidade/CidadeBO.dart';
import 'package:sistema_para_psicologos/app/cidade/CidadeVO.dart';
import 'package:sistema_para_psicologos/app/endereco/EnderecoBO.dart';
import 'package:sistema_para_psicologos/app/endereco/EnderecoVO.dart';
import 'package:sistema_para_psicologos/app/estado/EstadoBO.dart';
import 'package:sistema_para_psicologos/app/estado/EstadoVO.dart';
import 'package:sistema_para_psicologos/app/usuarios/UsuarioVO.dart';

import 'UsuarioBO.dart';

class CadastrarUsuario extends StatefulWidget {
  @override
  _CadastrarUsuarioState createState() => _CadastrarUsuarioState();
}

class _CadastrarUsuarioState extends State<CadastrarUsuario> {
  UsuarioBO usuarioBO = UsuarioBO();
  EnderecoBO enderecoBO = EnderecoBO();
  BairroBO bairroBO = BairroBO();
  CidadeBO cidadeBO = CidadeBO();
  EstadoBO estadoBO = EstadoBO();

  UsuarioVO usuarioVO;
  EstadoVO estadoVO;
  CidadeVO cidadeVO;
  BairroVO bairroVO;
  EnderecoVO enderecoVO;

  TextEditingController nomeController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();  
  String sexoDropdownValue;
  TextEditingController formacaoProfissionalController = TextEditingController();

  TextEditingController telefoneController = TextEditingController();  

  TextEditingController cepController = TextEditingController();
  String ufDropdownValue;
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _userEdited = false;

  TextFormField criar_form_field(String textoLabel, bool obscuro, TextEditingController controlador, String textoValidador, tipoDeTeclado){
    return TextFormField(
      keyboardType: tipoDeTeclado,
      obscureText: obscuro,
      decoration: InputDecoration(
          labelText: textoLabel,
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
      ),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controlador,
      onChanged: (text){
        _userEdited = true;
      },
      validator: (value) {
        if(value.isEmpty){
          return textoValidador;
        }
      },
    );
  } 

  TextFormField criar_form_field_opcional(String textoLabel, bool obscuro, TextEditingController controlador, tipoDeTeclado){
    return TextFormField(
      keyboardType: tipoDeTeclado,
      obscureText: obscuro,
      decoration: InputDecoration(
          labelText: textoLabel,
          labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
      ),
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controlador,
      onChanged: (text){
        _userEdited = true;
      },
    );
  }    

  Container criar_drop_down(String tituloDropDown, String valorInicial, List<String> listaOpcoes, funcaoOnChanged){
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 0),
      child: DropdownButton<String>(
        hint: Text(tituloDropDown),
        value: valorInicial,
        isExpanded: true,
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        elevation: 16,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 25,
        ),
        underline: Container(
          height: 1,
          color: Colors.grey,
        ),
        onChanged: funcaoOnChanged,
        items: listaOpcoes
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  _cadastrarUsuario(BuildContext context) async{
    estadoVO = EstadoVO(ufDropdownValue);
    cidadeVO = CidadeVO(cidadeController.text, estadoVO);
    bairroVO = BairroVO(bairroController.text, cidadeVO);
    enderecoVO = EnderecoVO(cepController.text, ruaController.text, int.parse(numeroController.text), complementoController.text, bairroVO);
    usuarioVO = UsuarioVO(nomeController.text, nascimentoController.text, sexoDropdownValue, cpfController.text, 
      formacaoProfissionalController.text, telefoneController.text, emailController.text, senhaController.text, enderecoVO);

    await cidadeVO.estado.setId(await estadoBO.inserir(estadoVO));    
    await bairroVO.cidade.setId(await cidadeBO.inserir(cidadeVO));    
    await enderecoVO.bairro.setId(await bairroBO.inserir(bairroVO));    
    await usuarioVO.endereco.setId(await enderecoBO.inserir(enderecoVO));    
    await usuarioBO.inserir(usuarioVO);
  }

  Future<bool> _requestPop() {
    if(_userEdited){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Descartar Cadastro?"),
            content: Text("Caso saia, o seu cadastro, como usuário, não será salvo. Deseja Continuar mesmo assim?"),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, 
                child: Text("Sim")
              ),
              FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text("Cancelar")
              )
            ],
          );
        }
      );
      return Future.value(false);
    }
    else{
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar-se"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
          body: Scaffold(
            body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  // SizedBox(
                  //   width: 150,
                  //   height: 150,
                  //   child: Image.asset("lib/images/psicologia128px.png"),
                  // ),
                  criar_form_field("Nome Completo", false, nomeController, "Insira seu nome completo!", TextInputType.text),
                  criar_form_field("Data de Nascimento", false, nascimentoController, "Insira sua Data de Nascimento!", TextInputType.datetime),
                  criar_drop_down("Sexo", sexoDropdownValue, <String>['Masculino', 'Feminino'], (String newValue) {
                    setState(() {
                      sexoDropdownValue = newValue;
                    });
                  }),
                  criar_form_field("CPF", false, cpfController, "Insira seu CPF!", TextInputType.number),
                  criar_form_field("Formação Profissional", false, formacaoProfissionalController, "Insira sua formação profissional!", TextInputType.text),
                  criar_form_field("Telefone para Contato", false, telefoneController, "Insira um telefone para contato!", TextInputType.number),
                  criar_form_field("E-mail De Cadastro", false, emailController, "Insira seu E-mail de cadastro!", TextInputType.emailAddress),
                  criar_form_field("CEP", false, cepController, "Insira o CEP do seu endereço!", TextInputType.number),
                  criar_drop_down("UF", ufDropdownValue, <String>["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS",
                    "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"], (String newValue) {
                    setState(() {
                      _userEdited = true;
                      ufDropdownValue = newValue;
                    });
                  }),
                  criar_form_field("Cidade", false, cidadeController, "Insira a cidade do seu endereço!", TextInputType.text),
                  criar_form_field("Bairro", false, bairroController, "Insira o bairro do seu endereço!", TextInputType.text),
                  criar_form_field("Rua", false, ruaController, "Insira a rua do seu endereço!", TextInputType.text),
                  criar_form_field("Número", false, numeroController, "Insira seu número de endereço!", TextInputType.number),
                  criar_form_field_opcional("Complemento", false, complementoController, TextInputType.text),
                  criar_form_field("Senha", true, senhaController, "Insira a sua senha!", TextInputType.text),       
                  criar_form_field("Confirmar Senha", true, confirmarSenhaController, "Confirme sua senha!", TextInputType.text),              
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
                            
                            if(_formKey.currentState.validate()){
                              _cadastrarUsuario(context);
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("O usuário foi cadastrado com sucesso!"),
                                  duration: Duration(seconds: 3),
                                )
                              );
                              Navigator.pushReplacementNamed(context, 'login');
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ), 
      onWillPop: _requestPop
    );
  }
}
