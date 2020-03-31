unit Unit_logon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_logon = class(TForm)
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    ConexaoBD: TADOConnection;
    adoquery_aux: TADOQuery;
    procedure btn_okClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario_logado, senha_usuario : string;

    function autenticacao: boolean;
    function validacao (usuario, senha:string) : boolean;
    function criptografia (texto : string) : string;
    function descriptografa (texto : string) : string;
    function ErroBD(msg: string; texto : string) : string;
  end;

var
  Form_logon: TForm_logon;

implementation

uses Unit_menu;

{$R *.dfm}

{ TForm_logon }

function TForm_logon.autenticacao: boolean;
begin
  ConexaoBD.ConnectionString := ' Provider=SQLOLEDB.1; '+
                                ' Initial Catalog=Academico; '+
                                ' Data Source=DESKTOP-HR2SECH\SQLEXPRESS';
  try
    ConexaoBD.Open('admin_academico','valente123');
    result:=true;
  except
    ShowMessage('N�o foi poss�vel se conectar ao servidor');
    result:=false;
  end;
end;

function TForm_logon.criptografia(texto: string): string;
var
    i : integer;
    cripto : string;
    cod_ascii : string;
begin
  cripto := '';

  for i := length(texto) downto 1 do
  begin
      cod_ascii := IntToStr(Ord(texto[i]));
      cod_ascii := StringOfChar('0',3-Length(cod_ascii)) + cod_ascii;
      cripto := cripto + cod_ascii;
  end;
  result := cripto;    

end;

function TForm_logon.descriptografa(texto: string): string;
var
   i : integer;
   descripto : string;
   cod_ascii : integer;
begin
  i:=length(texto)+1;
  while i > 1 do
  begin
      i:=i-3;
      cod_ascii := StrToInt(Copy(texto,i,3));
      descripto := descripto + Chr(cod_ascii);
  end;

  result := descripto;
end;

function TForm_logon.validacao(usuario, senha: string): boolean;
begin
  adoquery_aux.SQL.Text:=' SELECT SENHA FROM USUARIOS ' +
                          ' WHERE USUARIO = ' + QuotedStr(usuario);
  adoquery_aux.Open;

  if adoquery_aux.IsEmpty then
    begin
      showmessage('Usu�rio n�o cadastrado');
      Result := false;
    end
  else
    begin
    senha_usuario := adoquery_aux.fieldbyname('SENHA').AsString;
    senha_usuario := descriptografa(senha_usuario);
    if senha_usuario <> senha then
      begin
        showmessage('Senha n�o confere!');
        Result := false;
      end
    else
      begin
        usuario_logado := usuario;
        result := true;
      end;
    end;
    adoquery_aux.Close;
end;

procedure TForm_logon.btn_okClick(Sender: TObject);
begin
  if validacao(edt_usuario.Text, edt_senha.Text) = true then
  begin
    hide;
    form_menu.showmodal;
  end;  
end;

procedure TForm_logon.btn_fecharClick(Sender: TObject);
begin
Close;
end;

function TForm_logon.ErroBD(msg, texto: string): string;
var
posi:byte;
begin
  posi := Pos(texto, msg);
  if posi <> 0 then
    begin
      result:='Sim';
    end
  else
      result:='N�o';
end;

end.
