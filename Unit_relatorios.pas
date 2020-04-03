unit Unit_relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons;

type
  TForm_relatorios = class(TForm)
    btn_rel_curso: TBitBtn;
    btn_rel_turmas: TBitBtn;
    btn_rel_alunos: TBitBtn;
    btn_rel_faltas: TBitBtn;
    btn_rel_aulas: TBitBtn;
    btn_fechar: TBitBtn;
    adoquery_rel_cursos: TADOQuery;
    rel_cursos: TRvProject;
    ds_rel_cursos: TRvDataSetConnection;
    procedure btn_rel_cursoClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relatorios: TForm_relatorios;

implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_relatorios.btn_rel_cursoClick(Sender: TObject);
begin
  adoquery_rel_cursos.Open;
  rel_cursos.ProjectFile := GetCurrentDir + '\rel_cursos.rav';
  rel_cursos.Execute;
  adoquery_rel_cursos.Close;
end;

procedure TForm_relatorios.btn_fecharClick(Sender: TObject);
begin
close;
end;

end.
