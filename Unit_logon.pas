unit Unit_logon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_logon = class(TForm)
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_logon: TForm_logon;

implementation

{$R *.dfm}

end.
