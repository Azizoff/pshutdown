unit MainFrame;

interface

type
  TMainFrame = class abstract
  public
    function DoAction(): Cardinal; dynamic; abstract;
  end;

implementation

end.
