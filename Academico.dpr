program Academico;

uses
  Forms,
  Unit_logon in 'Unit_logon.pas' {Form_logon},
  Unit_menu in 'Unit_menu.pas' {Form_menu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_logon, Form_logon);
  Application.CreateForm(TForm_menu, Form_menu);
  Application.Run;
end.
