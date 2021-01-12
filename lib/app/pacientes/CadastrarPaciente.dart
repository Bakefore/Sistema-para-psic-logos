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
import 'package:sistema_para_psicologos/app/pacientes/PacienteBO.dart';
import 'package:sistema_para_psicologos/app/pacientes/PacienteVO.dart';
import 'package:sistema_para_psicologos/main.dart';

class CadastrarPaciente extends StatefulWidget {
  @override
  _CadastrarPacienteState createState() => _CadastrarPacienteState();
}

class _CadastrarPacienteState extends State<CadastrarPaciente> {
  PacienteBO pacienteBO = PacienteBO();
  EnderecoBO enderecoBO = EnderecoBO();
  BairroBO bairroBO = BairroBO();
  CidadeBO cidadeBO = CidadeBO();
  EstadoBO estadoBO = EstadoBO();

  PacienteVO pacienteVO;
  EstadoVO estadoVO;
  CidadeVO cidadeVO;
  BairroVO bairroVO;
  EnderecoVO enderecoVO;

  TextEditingController nomeController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();  
  String sexoDropdownValue;
  TextEditingController profissaoController = TextEditingController();
  TextEditingController nomeDoPaiController = TextEditingController();
  TextEditingController nomeDaMaeController = TextEditingController();
  String corRacaDropdownValue;

  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController cepController = TextEditingController();
  String ufDropdownValue;
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();

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
      }
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

  _cadastrarPaciente(BuildContext context) async {
    estadoVO = EstadoVO(ufDropdownValue);
    cidadeVO = CidadeVO(cidadeController.text, estadoVO);
    bairroVO = BairroVO(bairroController.text, cidadeVO);
    enderecoVO = EnderecoVO(cepController.text, ruaController.text, int.parse(numeroController.text), complementoController.text, bairroVO);
    pacienteVO = PacienteVO(nomeController.text, nascimentoController.text, sexoDropdownValue, cpfController.text, profissaoController.text, 
      nomeDoPaiController.text, nomeDaMaeController.text, corRacaDropdownValue, telefoneController.text, emailController.text, enderecoVO, 
      MyApp.idUsuarioLogado);

    await cidadeVO.estado.setId(await estadoBO.inserir(estadoVO));    
    await bairroVO.cidade.setId(await cidadeBO.inserir(cidadeVO));    
    await enderecoVO.bairro.setId(await bairroBO.inserir(bairroVO));    
    await pacienteVO.endereco.setId(await enderecoBO.inserir(enderecoVO));    
    await pacienteBO.inserir(pacienteVO);
  }

  Future<bool> _requestPop() {
    if(_userEdited){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Descartar Paciente?"),
            content: Text("Caso saia, o cadastro do novo Paciente não será salvo. Deseja Continuar mesmo assim?"),
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
          title: Text("Cadastrar Paciente"),
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
                // SizedBox(
                //   width: 150,
                //   height: 150,
                //   child: Image.asset("lib/images/psicologia128px.png"),
                // ),
                criar_form_field("Nome Completo", false, nomeController, "Insira o nome completo do paciente!", TextInputType.text),
                criar_form_field("Data de Nascimento", false, nascimentoController, "Insira a Data de Nascimento do paciente!", TextInputType.datetime),
                criar_drop_down("Sexo", sexoDropdownValue, <String>['Masculino', 'Feminino'], (String newValue) {
                  setState(() {
                    _userEdited = true;
                    sexoDropdownValue = newValue;
                  });
                }),
                criar_form_field("CPF", false, cpfController, "Insira o CPF do paciente!", TextInputType.number),
                criar_form_field("Profissão", false, profissaoController, "Insira a profissão do paciente!", TextInputType.text),
                criar_form_field("Nome do Pai", false, nomeDoPaiController, "Insira o nome do Pai do paciente!", TextInputType.text),
                criar_form_field("Nome da Mãe", false, nomeDaMaeController, "Insira o nome da Mãe do paciente!", TextInputType.text),              
                criar_drop_down("Cor/Raça", corRacaDropdownValue, <String>['Branca', 'Preta', 'Parda', 'Amarela', 'Indígena'], (String newValue) {
                  setState(() {
                    _userEdited = true;
                    corRacaDropdownValue = newValue;
                  });
                }),
                criar_form_field("Telefone para Contato", false, telefoneController, "Insira telefone do paciente!", TextInputType.number),
                criar_form_field_opcional("E-mail para Contato", false, emailController, TextInputType.emailAddress),
                criar_form_field("CEP", false, cepController, "Insira o CEP do paciente!", TextInputType.number),
                criar_drop_down("UF", ufDropdownValue, <String>["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS",
                  "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"], (String newValue) {
                  setState(() {
                    _userEdited = true;
                    ufDropdownValue = newValue;
                  });
                }),
                criar_form_field("Cidade", false, cidadeController, "Insira a cidade do endereço do paciente!", TextInputType.text),
                criar_form_field("Bairro", false, bairroController, "Insira o bairro do endereço do paciente!", TextInputType.text),
                criar_form_field("Rua", false, ruaController, "Insira a rua do endereço do paciente!", TextInputType.text),
                criar_form_field("Número", false, numeroController, "Insira o número do endereço do paciente!", TextInputType.number),
                criar_form_field_opcional("Complemento", false, complementoController, TextInputType.text),              
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
                            "Cadastrar Paciente",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _cadastrarPaciente(context);
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
      ), 
      onWillPop: _requestPop
    );
  }
}
