program Academico;

uses
  Forms,
  Unit_logon in 'Unit_logon.pas' {Form_logon},
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_splash in 'Unit_splash.pas' {Form_splash},
  Unit_usuarios in 'Unit_usuarios.pas' {Form_usuarios},
  Unit_pesquisa in 'Unit_pesquisa.pas' {Form_pesquisa},
  Unit_permissoes in 'Unit_permissoes.pas' {Form_permissoes};

{$R *.res}

begin
  Form_splash:=Tform_splash.Create(application);
  Form_splash.Show;
  Form_splash.Update;

  Application.Initialize;
  Application.CreateForm(TForm_logon, Form_logon);
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_usuarios, Form_usuarios);
  Application.CreateForm(TForm_pesquisa, Form_pesquisa);
  Application.CreateForm(TForm_permissoes, Form_permissoes);
  //Application.CreateForm(TForm_splash, Form_splash);

  if Form_logon.autenticacao = false then
    Application.Terminate;

  Form_splash.Hide;
  Form_splash.Destroy;
  Application.Run;
end.
