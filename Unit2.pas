unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit;

type
  TfrmCreateNew = class(TForm)
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edt1: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateNew: TfrmCreateNew;

implementation

{$R *.dfm}

end.
