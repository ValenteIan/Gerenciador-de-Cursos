unit Unit_rel_alunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons;

type
  TForm_rel_alunos = class(TForm)
    Label1: TLabel;
    edt_turma: TEdit;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    btn_turma: TBitBtn;
    adoquery_rel_alunos: TADOQuery;
    adoquery_aux: TADOQuery;
    rel_alunos: TRvProject;
    ds_rel_alunos: TRvDataSetConnection;
    procedure FormShow(Sender: TObject);
    procedure btn_turmaClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_turma : string;
  end;

var
  Form_rel_alunos: TForm_rel_alunos;

implementation

uses Unit_logon, Unit_pesquisa_turmas;

{$R *.dfm}

procedure TForm_rel_alunos.FormShow(Sender: TObject);
begin
  cod_turma := '';
  edt_turma.Clear;
end;

procedure TForm_rel_alunos.btn_turmaClick(Sender: TObject);
begin
  edt_turma.Clear;
  cod_turma := '';
  Form_pesquisa_turmas.ShowModal;

  if Form_pesquisa_turmas.chave <> '' then
  begin
    cod_turma := Form_pesquisa_turmas.chave;
    edt_turma.Text := cod_turma;
  end;
end;

procedure TForm_rel_alunos.btn_okClick(Sender: TObject);
var sql : string;
begin
  if cod_turma = '' then
    showmessage('Selecione uma turma !')
  else
  begin
    sql:= 'SELECT TURMAS.COD_TURMA AS TURMA, '+
          '  ALUNOS.COD_ALUNO, ALUNOS.NOME, '+
          '  ALUNOS.IDADE, ALUNOS.TELEFONE, ALUNOS.SEXO '+
          ' FROM TURMAS '+
          ' INNER JOIN MATRICULAS '+
          '  ON TURMAS.COD_TURMA = MATRICULAS.COD_TURMA '+
          ' INNER JOIN ALUNOS '+
          '  ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO'+
          ' WHERE TURMAS.COD_TURMA = '+ QuotedStr(cod_turma) +
          ' ORDER BY ALUNOS.NOME ';

    adoquery_rel_alunos.SQL.Text := sql;
    adoquery_rel_alunos.Open;
    rel_alunos.ProjectFile := GetCurrentDir + '\rel_alunos.rav';
    rel_alunos.Execute;
    adoquery_rel_alunos.Close;
  end;

end;

procedure TForm_rel_alunos.btn_fecharClick(Sender: TObject);
begin
  close;
end;

end.
