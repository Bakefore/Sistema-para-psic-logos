import 'package:sistema_para_psicologos/app/endereco/EnderecoVO.dart';

class PacienteVO {
  
  String _id;
  String _nome, _nascimento, _sexo, _cpf, _profissao, _pai, _mae, _corRaca, _telefone, _email;    
  EnderecoVO _endereco;
  String _idUsuario;
    
  PacienteVO(String nome, String nascimento, String sexo, String cpf, String profissao, String pai, 
    String mae, String corRaca, String telefone, String email, EnderecoVO endereco, String idUsuario){
    
    this._nome = nome;
    this._nascimento = nascimento;
    this._sexo = sexo; 
    this._cpf = cpf; 
    this._profissao = profissao; 
    this._pai = pai; 
    this._mae = mae; 
    this._corRaca = corRaca; 
    this._telefone = telefone; 
    this._email = email;     
    this._endereco = endereco;
    this._idUsuario = idUsuario;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['nascimento'] = nascimento;
    data['sexo'] = sexo;
    data['cpf'] = cpf;
    data['profissao'] = profissao;
    data['pai'] = pai;
    data['mae'] = mae;
    data['corRaca'] = corRaca;
    data['telefone'] = telefone;
    data['email'] = email;    
    data['idEndereco'] = endereco.id;
    data['idUsuario'] = idUsuario;
    return data;
  } 

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

  String get profissao => _profissao;

  setProfissao(String profissao){
    this._profissao = profissao;
  }

  String get pai => _pai;

  setPai(String pai){
    this._pai = pai;
  }

  String get mae => _mae;

  setMae(String mae){
    this._mae = mae;
  }

  String get corRaca => _corRaca;

  setCorRaca(String corRaca){
    this._corRaca = corRaca;
  }

  String get telefone => _telefone;

  setTelefone(String telefone){
    this._telefone = telefone;
  }

  String get email => _email;

  setEmail(String email){
    this._email = email;
  }

  EnderecoVO get endereco => _endereco;  

  String get idUsuario => _idUsuario;
}