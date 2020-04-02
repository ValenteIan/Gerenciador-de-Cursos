unit Unit_lanca_aulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ComCtrls;

type
  TForm_lanca_aulas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_turma: TEdit;
    dt_aula: TDateTimePicker;
    btn_lancar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_turma: TBitBtn;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lanca_aulas: TForm_lanca_aulas;

implementation

{$R *.dfm}

end.
