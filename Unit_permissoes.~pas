unit Unit_permissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  TForm_permissoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cb_funcoes: TComboBox;
    btn_inserir: TBitBtn;
    btn_retirar: TBitBtn;
    btn_fechar: TBitBtn;
    adoquery_permissoes: TADOQuery;
    adoquery_aux: TADOQuery;
    ds_permissoes: TDataSource;
    grid_permissoes: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cb_funcoesEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_permissoes: TForm_permissoes;

implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_permissoes.FormShow(Sender: TObject);
begin
  adoquery_permissoes.SQL.Text:= 'SELECT FUNCOES.NOME '+
                                  'FROM FUNCOES INNER JOIN PERMISSOES ON '+
                                  'FUNCOES.COD_FUNCAO = PERMISSOES.COD_FUNCAO ' +
                                  'WHERE PERMISSOES.USUARIO = ' +QuotedStr(usuario) +
                                  'ORDER BY FUNCOES.NAME';
  adoquery_permissoes.Open;
end;

procedure TForm_permissoes.cb_funcoesEnter(Sender: TObject);
begin
  cb_funcoes.Clear;
  adoquery_aux.SQL.Text:= 'SELECT NOME FROM FUNCOES ' +
                          'WHERE COD_FUNCAO NOT IN ' +
                          '(SELECT COD_FUNCAO FROM PERMISSOES ' +
                          ' WHERE USUARIO = ' + QuotedStr(usuario) + ')' +
                          'ORDER BY NAME';
  adoquery_aux.Open;
  while not adoquery_aux.Eof do
  begin
    cb_funcoes.Items.Add(adoquery_aux.fieldbyname('NOME').AsString;
    adoquery_aux.Next;
  end;
  adoquery_aux.Close;  
end;

end.
