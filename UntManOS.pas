unit UntManOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls, DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmManOS = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    ToolBar1: TToolBar;
    btn_Inserir: TToolButton;
    btn_Alterar: TToolButton;
    btn_Excluir: TToolButton;
    ToolButton4: TToolButton;
    btn_Imprimir: TToolButton;
    ToolButton6: TToolButton;
    btn_Sair: TToolButton;
    Panel2: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    procedure Edit1Change(Sender: TObject);
    procedure btn_InserirClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManOS: TFrmManOS;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmManOS.btn_AlterarClick(Sender: TObject);
begin
{DM.ADODSOrdemServico.Edit;
FrmCadOrdemServico.btn_Salvar.Enabled:= true;
FrmCadOrdemServico.btn_Cancelar.Enabled:= true;
FrmCadOrdemServico.btn_Sair.Enabled:= false;
FrmCadOrdemServico.pnlFicha.Enabled:= true;
FrmCadOrdemServico.ShowModal;    }
end;

procedure TFrmManOS.btn_ExcluirClick(Sender: TObject);
var
  confExcl: integer;
begin
  confExcl := Application.MessageBox('Confirma a exclus�o deste registro?', 'Aten��o', MB_YESNO+MB_DEFBUTTON2+MB_ICONQUESTION);
  if confExcl = IDYES then
  begin
    DM.ADODSOrdemServico.Delete;
    Application.MessageBox('O registro foi exclu�do com sucesso.','Informa��o', MB_OK+MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('A exclus�o do registro foi abortada.','Informa��o', MB_OK+MB_ICONERROR);

end;

procedure TFrmManOS.btn_InserirClick(Sender: TObject);
begin
DM.ADODSOrdemServico.Insert;
{FrmCadOrdemServico.btn_Salvar.Enabled:= true;
FrmCadOrdemServico.btn_Cancelar.Enabled:= true;
FrmCadOrdemServico.btn_Sair.Enabled:= false;
FrmCadOrdemServico.pnlFicha.Enabled:= true;
FrmCadOrdemServico.ShowModal;}
end;

procedure TFrmManOS.btn_SairClick(Sender: TObject);
begin
Close;
end;

procedure TFrmManOS.Edit1Change(Sender: TObject);
begin
  DM.ADODSOrdemServico.Locate('num_os',Edit1.Text, [loCaseInsensitive,loPartialKey]);
end;

procedure TFrmManOS.FormActivate(Sender: TObject);
begin
DM.ADODSOrdemServico.Close;
DM.ADODSOrdemServico.CommandText := '';
DM.ADODSOrdemServico.CommandText := 'select * from ORDEM_SERVICOS order by data_inicio';
DM.ADODSOrdemServico.Open;
end;

end.