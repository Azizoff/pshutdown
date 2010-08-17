unit MultiLocalizer;

interface

uses Forms,
  IniFiles,
  StdCtrls,
  ExtCtrls,
  SysUtils,
  Menus,
  ComCtrls;

type
  TForms = record
    fForm: TForm;
    fExcludeIfClear: Boolean;
    fExcludeComponents: array of string;
    procedure AddExcludeFilter(const ComponentName: string);
    function IsFiltered(const ComponentName: string): Boolean;
  end;

type
  TMultiLocalizer = class
  private
    fFilePath: string;
    fFormsList: array of TForms;
    fFormsCount: Cardinal;
  public
    constructor Create(const lFilePath: string);
    function AddForm(const lForm: TForm; const lExcludeClear: Boolean = True)
      : Integer;
    procedure AddFilter(const lIndex: Integer; const lFilter: string);
    procedure SaveToFile();
    procedure LoadFromFile();
  end;

implementation

{ TMultiLocalizer }

procedure TMultiLocalizer.AddFilter(const lIndex: Integer;
  const lFilter: string);
begin
  fFormsList[lIndex].AddExcludeFilter(lFilter);
end;

function TMultiLocalizer.AddForm(const lForm: TForm; const lExcludeClear: Boolean): Integer;
begin
  Result := fFormsCount;
  SetLength(fFormsList, fFormsCount + 1);
  fFormsList[fFormsCount].fForm := lForm;
  fFormsList[fFormsCount].fExcludeIfClear := lExcludeClear;
  Inc(fFormsCount);
end;

constructor TMultiLocalizer.Create(const lFilePath: string);
begin
  fFilePath := lFilePath;
  fFormsCount := 0;
end;

procedure TMultiLocalizer.LoadFromFile;
var
  I, J, K: Integer;
  OldIndex: Integer;
  LngFile: TIniFile;
begin
  LngFile := TIniFile.Create(fFilePath);
  try
    for I := 0 to fFormsCount - 1 do
    begin
      with fFormsList[I].fForm do
      begin
        Caption := LngFile.ReadString(Name, 'Caption', Caption);
        for J := 0 to ComponentCount - 1 do
        begin
          {$REGION 'TButton'}
          if Components[J] is TButton then
          begin
            (Components[J] as TButton).Caption :=
              LngFile.ReadString(Name + '_' + Components[J].ClassName,
              (Components[J] as TButton).Name, (Components[J] as TButton).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TCheckBox'}
          if Components[J] is TCheckBox then
          begin
            (Components[J] as TCheckBox)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TCheckBox).Name,
              (Components[J] as TCheckBox).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TComboBox'}
          if Components[J] is TComboBox then
          begin
            OldIndex := (Components[J] as TComboBox).ItemIndex;
            for K := 0 to (Components[J] as TComboBox).Items.Count - 1 do
            begin
              (Components[J] as TComboBox)
                .Items[K] := LngFile.ReadString
                (Name + '_' + Components[J].Name + '_' + Components[J]
                .ClassName, 'Item_' + IntToStr(K),
                (Components[J] as TComboBox).Items[K]);
            end;
            (Components[J] as TComboBox)
              .ItemIndex := OldIndex;
          end;
          {$ENDREGION}
          {$REGION 'TGroupBox'}
          if Components[J] is TGroupBox then
          begin
            (Components[J] as TGroupBox)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TGroupBox).Name,
              (Components[J] as TGroupBox).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TLabel'}
          if Components[J] is TLabel then
          begin
            (Components[J] as TLabel)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TLabel).Name,
              (Components[J] as TLabel).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TRadioButton'}
          if Components[J] is TRadioButton then
          begin
            (Components[J] as TRadioButton)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TRadioButton).Name,
              (Components[J] as TRadioButton).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TRadioGroup'}
          if Components[J] is TRadioGroup then
          begin
            (Components[J] as TRadioGroup).Caption := LngFile.ReadString(Name + '_' + Components[J].ClassName,
              (Components[J] as TRadioGroup).Name,
              (Components[J] as TRadioGroup).Caption);
            for K := 0 to (Components[J] as TRadioGroup).Items.Count - 1 do
            begin
              (Components[J] as TRadioGroup)
                .Items[K] := LngFile.ReadString
                (Name + '_' + Components[J].Name + '_' + Components[J]
                .ClassName, 'Item_' + IntToStr(K),
                (Components[J] as TRadioGroup).Items[K]);
            end;
          end;
          {$ENDREGION}
          {$REGION 'TMenuItem'}
          if Components[J] is TMenuItem then
          begin
            (Components[J] as TMenuItem)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TMenuItem).Name,
              (Components[J] as TMenuItem).Caption);
          end;
          {$ENDREGION}
          {$REGION 'TListView'}
          if Components[J] is TListView then
          begin
            for K := 0 to (Components[J] as TListView).Columns.Count - 1 do
            begin
              (Components[J] as TListView)
                .Columns[K].Caption := LngFile.ReadString
                (Name + '_' + Components[J].ClassName,
                (Components[J] as TListView)
                .Columns[K].ClassName + '_' + IntToStr(K),
                (Components[J] as TListView).Columns[K].Caption);
            end;
          end;
          {$ENDREGION}
          {$REGION 'TTreeView'}
          if Components[J] is TTreeView then
          begin
            for K := 0 to (Components[J] as TTreeView).Items.Count - 1 do
            begin
              (Components[J] as TTreeView)
                .Items[K].Text := LngFile.ReadString
                (Name + '_' + Components[J].Name + '_' + Components[J]
                .ClassName, 'Item_' + IntToStr(K),
                (Components[J] as TTreeView).Items[K].Text);
            end;
          end;
          {$ENDREGION}
          {$REGION 'TTabSheet'}
          if Components[J] is TTabSheet then
          begin
            (Components[J] as TTabSheet)
              .Caption := LngFile.ReadString
              (Name + '_' + Components[J].ClassName,
              (Components[J] as TTabSheet).Name,
              (Components[J] as TTabSheet).Caption);
          end;
          {$ENDREGION}
        end;
      end;
    end;
  finally
    FreeAndNil(LngFile);
  end;

end;

procedure TMultiLocalizer.SaveToFile;
var
  I, J, K: Integer;
  LngFile: TIniFile;
begin
  LngFile := TIniFile.Create(fFilePath);
  LngFile.WriteString('Language_File', 'Language', 'LanguageName');
  LngFile.WriteString('Language_File', 'Author', 'AuthorsName');
  try
    for I := 0 to fFormsCount - 1 do
    begin
      with fFormsList[I].fForm do
      begin
        LngFile.WriteString(Name, 'Caption', Caption);
        for J := 0 to ComponentCount - 1 do
        begin
          if not fFormsList[I].IsFiltered(Components[J].Name) then
          begin
            {$REGION 'Tlabel'}
            if Components[J] is TLabel then
            begin
              if (not (fFormsList[I].fExcludeIfClear)) or
                (fFormsList[I].fExcludeIfClear and
                (Length((Components[J] as TLabel).Caption) > 0)) then
              begin
                LngFile.WriteString(Name + '_' + Components[J].ClassName,
                  Components[J].Name, (Components[J] as TLabel).Caption);
              end;
            end;
            {$ENDREGION}
            {$REGION 'TButton'}
            if Components[J] is TButton then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name, (Components[J] as TButton).Caption);
            end;
            {$ENDREGION}
            {$REGION 'TRadioButton'}
            if Components[J] is TRadioButton then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name, (Components[J] as TRadioButton).Caption);
            end;
            {$ENDREGION}
            {$REGION 'TGroupBox'}
            if Components[J] is TGroupBox then
            begin
              if (not (fFormsList[I].fExcludeIfClear)) or
                (fFormsList[I].fExcludeIfClear and
                (Length((Components[J] as TGroupBox).Caption) > 0)) then
              begin
                LngFile.WriteString(Name + '_' + Components[J].ClassName,
                  Components[J].Name, (Components[J] as TGroupBox).Caption);
              end;
            end;
            {$ENDREGION}
            {$REGION 'TCheckBox'}
            if Components[J] is TCheckBox then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name, (Components[J] as TCheckBox).Caption);
            end;
            {$ENDREGION}
            {$REGION 'TRadioGroup'}
            if (Components[J] is TRadioGroup) then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name,
                (Components[J] as TRadioGroup).Caption);
              for K := 0 to (Components[J] as TRadioGroup).Items.Count - 1 do
              begin
                LngFile.WriteString
                  (Name + '_' + Components[J].Name + '_' +
                  Components[J].ClassName, 'Item_' + IntToStr(K),
                  (Components[J] as TRadioGroup).Items[K]);
              end;
            end;
            {$ENDREGION}
            {$REGION 'TMenuItem'}
            if (Components[J] is TMenuItem) then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name, (Components[J] as TMenuItem).Caption);
            end;
            {$ENDREGION}
            {$REGION 'TTabSheet'}
            if (Components[J] is TTabSheet) then
            begin
              LngFile.WriteString(Name + '_' + Components[J].ClassName,
                Components[J].Name, (Components[J] as TTabSheet).Caption);
            end;
            {$ENDREGION}
            {$REGION 'TListView'}
            if (Components[J] is TListView) then
            begin
              for K := 0 to (Components[J] as TListView).Columns.Count - 1 do
              begin
                LngFile.WriteString(Name + '_' + Components[J].ClassName,
                  (Components[J] as TListView).Columns[K].ClassName + '_' +
                  IntToStr(K), (Components[J] as TListView).Columns[K].Caption);
              end;
            end;
            {$ENDREGION}
            {$REGION 'TComboBox'}
            if (Components[J] is TComboBox) then
            begin
              for K := 0 to (Components[J] as TComboBox).Items.Count - 1 do
              begin
                LngFile.WriteString(Name + '_' + Components[J].Name + '_' +
                Components[J].ClassName, 'Item_' + IntToStr(K),
                (Components[J] as TComboBox).Items[K]);
              end;
            end;
            {$ENDREGION}
            {$REGION 'TTreeView'}
            if (Components[J] is TTreeView) then
            begin
              for K := 0 to (Components[J] as TTreeView).Items.Count - 1 do
              begin
                LngFile.WriteString(Name + '_' + Components[J].Name + '_' +
                Components[J].ClassName, 'Item_' + IntToStr(K),
                (Components[J] as TTreeView).Items[K].Text);
              end;
            end;
            {$ENDREGION}
          end; // if Filtered
        end; // for J
      end; // with
    end; // for I
  finally
    FreeAndNil(LngFile);
  end;
end;

{ TForms }

procedure TForms.AddExcludeFilter(const ComponentName: string);
var
  ECLen: Integer;
begin
  ECLen := Length(fExcludeComponents);
  SetLength(fExcludeComponents, ECLen + 1);
  fExcludeComponents[ECLen] := ComponentName;
end;

function TForms.IsFiltered(const ComponentName: string): Boolean;
var
  ECLen: Integer;
begin
  ECLen := Length(fExcludeComponents) - 1;
  while (ECLen > -1) and (fExcludeComponents[ECLen] <> ComponentName) do
  begin
    Dec(ECLen);
  end;
  Result := (ECLen > -1);
end;

end.

