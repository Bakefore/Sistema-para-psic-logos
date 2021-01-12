import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sistema_para_psicologos/app/endereco/EnderecoVO.dart';

class UsuarioVO {
  
  String _id;
  String _nome, _nascimento, _sexo, _cpf, _formacaoProfissional, _telefone, _email, _senha;
  EnderecoVO _endereco;

  UsuarioVO(String nome, String nascimento, String sexo, String cpf, String formacaoProfissional, String telefone, 
    String email, String senha, EnderecoVO endereco){
    this._nome = nome;
    this._nascimento = nascimento;
    this._sexo = sexo; 
    this._cpf = cpf; 
    this._formacaoProfissional = formacaoProfissional; 
    this._telefone = telefone; 
    this._email = email;     
    this._senha = senha;
    this._endereco = endereco;    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['nascimento'] = nascimento;
    data['sexo'] = sexo;
    data['cpf'] = cpf;
    data['formacaoProfissional'] = formacaoProfissional;
    data['telefone'] = telefone;
    data['email'] = email;
    data['senha'] = senha;    
    data['idEndereco'] = endereco.id;
    return data;
  }

  // static UsuarioVO toUsuario(DocumentSnapshot usuarioEncontrado) {
  //   UsuarioVO usuario = UsuarioVO(usuarioEncontrado['nome'], usuarioEncontrado['nascimento'], usuarioEncontrado['sexo'], 
  //     usuarioEncontrado["cpf"], usuarioEncontrado['formacaoProfissional'], usuarioEncontrado['telefone'], usuarioEncontrado['email'],
  //     usuarioEncontrado['senha'], usuarioEncontrado['idEndereco']);
  //   usuario.setId(usuarioEncontrado["id"]);
    
  //   return usuario;
  // }

  String get id => _id;

  setId(String id){
    this._id = id;
  }

  String get nome => _nome;

  setNome(String nome){
    this._nome = nome;
  }

  String get nascimento => _nascimento;

  setNascimento(String nascimento){
    this._nascimento = nascimento;
  }

  String get sexo => _sexo;

  setSexo(String sexo){
    this._sexo = sexo;
  }

  String get cpf => _cpf;

  setCpf(String cpf){
    this._cpf = cpf;
  }

  String get formacaoProfissional => _formacaoProfissional;

  setFormacaoProfissional(String formacaoProfissional){
    this._formacaoProfissional = formacaoProfissional;
  }

  String get telefone => _telefone;

  setTelefone(String telefone){
    this._telefone = telefone;
  }

  String get email => _email;

  setEmail(String email){
    this._email = email;
  }

  String get senha => _senha;

  setSenha(String senha){
    this._senha = senha;
  }

  EnderecoVO get endereco => _endereco;
}