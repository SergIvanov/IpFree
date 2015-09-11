unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  PlatformDefaultStyleActnCtrls, Grids, DBGrids, DB, DBClient, DBGridEhGrouping,
  GridsEh, DBGridEh,Unit2, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient;

type
  TForm1 = class(TForm)
    actmgr1: TActionManager;
    act1OpenFile: TAction;
    actGreate: TAction;
    actSaveAs: TAction;
    actmmb1: TActionMainMenuBar;
    ds1: TClientDataSet;
    ds2: TDataSource;
    dbgrdh1: TDBGridEh;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    act1: TAction;
    idcmpclnt1: TIdIcmpClient;
    procedure actGreateExecute(Sender: TObject);
    procedure act1OpenFileExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure idcmpclnt1Reply(ASender: TComponent;
      const AReplyStatus: TReplyStatus);
  private
    { Private declarations }
  public
    { Public declarations }

    OpenNet:Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}





procedure TForm1.act1Execute(Sender: TObject);

begin
  if OpenNet=True then
    begin

            ds1.First();
            while not ds1.Eof do
            begin



              try
                with idcmpclnt1 do
                begin
                  Host := ds1.FieldByName('Ip').Value;
                  ReceiveTimeout:=999;
                  Ping('32');

                end;
              finally
               //ShowMessage('Херь');
              end;
            ds1.Next();
            end;
    end
   else   ShowMessage('Нужно выбрать сеть!');

end;

procedure TForm1.act1OpenFileExecute(Sender: TObject);
begin
dlgOpen1.InitialDir:=GetCurrentDir;
if dlgOpen1.Execute then
  try
        ds1.Active:=False;
        ds1.LoadFromFile(dlgOpen1.FileName);
        ds1.IndexFieldNames:='PP_KEY';
        OpenNet:=True;
  except
  Application.MessageBox('Проверьте формат файла!','Ошибка');

  end;


end;

procedure TForm1.actGreateExecute(Sender: TObject);
var frmCreateNew : TfrmCreateNew;
  I: Integer; NetName:string;
  begin

         frmCreateNew:=TfrmCreateNew.Create(Application.MainForm);
          if frmCreateNew.ShowModal=mrOk then
           begin

             with ds1.FieldDefs do
             begin
                with AddFieldDef do
                begin
                  Name:='PP_KEY';
                  DataType:=ftAutoInc;
                end;

                with AddFieldDef do
                begin
                  Name:='IP';
                  DataType:=ftString;
                end;

                with AddFieldDef do
                begin
                  Name:='STATUS';
                  DataType:=ftBoolean;
                end;

                with AddFieldDef do
                begin
                  Name:='TIMECHANG';
                  DataType:=ftDateTime;
                end;
             end;

             ds1.CreateDataSet;

             NetName:=frmCreateNew.edt1.Text;
             for I := 1 to 254 do
               begin
                ds1.Append();
                ds1.FieldByName('Status').Value := True;
                ds1.FieldByName('Ip').Value := NetName+'.'+IntToStr(i);
                ds1.Post();
               end;
             OpenNet:=True;
           end;

  end;

procedure TForm1.actSaveAsExecute(Sender: TObject);
var s:string;
begin
  dlgSave1.InitialDir:=GetCurrentDir;
  if dlgSave1.Execute  then
  begin
    s:=dlgSave1.FileName+'.xml';
    ds1.SaveToFile(s,dfXML)


  end;



end;

procedure TForm1.dbgrdh1TitleClick(Column: TColumnEh);
begin

ds1.IndexFieldNames:=Column.FieldName;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
OpenNet:=False;
end;

procedure TForm1.idcmpclnt1Reply(ASender: TComponent;
  const AReplyStatus: TReplyStatus);
begin

   ds1.Edit();
if idcmpclnt1.Host=AReplyStatus.FromIpAddress then  ds1.FieldByName('Status').Value := True else ds1.FieldByName('Status').Value := False;


                 // if ReplyStatus.ReplyStatusType<>rsEcho Then  ds1.FieldByName('Status').Value := False else ds1.FieldByName('Status').Value := True;

end;

end.
