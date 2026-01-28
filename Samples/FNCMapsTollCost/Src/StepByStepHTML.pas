unit StepByStepHTML;

interface

uses
  System.SysUtils,
  System.Classes,
  Math,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCTollCost,
  VCL.TMSFNCUtils;

type
  TStepByStepHTML = class
  public
    class procedure Add(ABrowser: TTMSFNCWebBrowser; ATollCostItem: TTMSFNCTollCostItem);
  end;

implementation

class procedure TStepByStepHTML.Add(ABrowser: TTMSFNCWebBrowser; ATollCostItem: TTMSFNCTollCostItem);
const
  CSSTemplate =
        '<style>' +
        '  body {font-family: Arial, sans-serif; font-size: 0.9em; background-color: #F0F0F0;} ' +
        '  ol { list-style: none; counter-reset: item} ' +
        '  li { counter-increment: item; margin-bottom: 5px;} ' +
        '  li:before { margin-right: 10px;  margin-bottom: 10px; padding: 5px; content: counter(item); border-radius: 50%; background-color: gray; width: 1.5em; display: inline-block; color: white; text-align: center;} ' +
        '</style> ';
var
  LHTML: string;
  I: Integer;
begin
  ABrowser.LoadHTML('<h2>Step by Step</h2>');

  if not Assigned(ATollCostItem) then
    Exit;

  LHTML := '<ol>';

  for I := 0 to ATollCostItem.Steps.Count - 1 do
  begin
    LHTML := LHTML +
      '<li><b>' +
        FormatFloat('0.00', ATollCostItem.Steps[I].Distance / 1000) + ' km | ' +
        IntToStr(Round(ATollCostItem.Steps[I].Duration / 60)) + ' min </b><br>' +
        ATollCostItem.Steps[I].Instructions + '<br><br> '+
      '</li>';
  end;

  LHTML := LHTML + '</ol>';
  ABrowser.LoadHTML(CSSTemplate + LHTML);
end;

end.
