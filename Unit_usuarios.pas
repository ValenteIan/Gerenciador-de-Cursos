unit Unit_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_usuarios = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
  end;

var
  Form_usuarios: TForm_usuarios;

implementation

{$R *.dfm}

end.
