program Academico;

uses
  Forms,
  Unit_logon in 'Unit_logon.pas' {Form_logon};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_logon, Form_logon);
  Application.Run;
end.
