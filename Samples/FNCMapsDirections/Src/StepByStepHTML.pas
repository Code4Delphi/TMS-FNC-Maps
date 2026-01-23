unit StepByStepHTML;

interface

uses
  System.SysUtils,
  System.Classes,
  Math,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCDirections,
  VCL.TMSFNCUtils;

type
  TStepByStepHTML = class
  public
    class procedure Add(ABrowser: TTMSFNCWebBrowser; ADirectionsItem: TTMSFNCDirectionsItem);
  end;

implementation

class procedure TStepByStepHTML.Add(ABrowser: TTMSFNCWebBrowser; ADirectionsItem: TTMSFNCDirectionsItem);
const
  CSSTemplate =
    'body {' + sLineBreak +
    '    background-color: #ffffff;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'ol.border {' + sLineBreak +
    '    list-style-type: none;' + sLineBreak +
    '    list-style-type: decimal !ie;     ' + sLineBreak +
    '    margin: 0;' + sLineBreak +
    '    margin-left: 3em;' + sLineBreak +
    '    font-family: ''Abel'';' + sLineBreak +
    '    padding: 0;     ' + sLineBreak +
    '    counter-reset: li-counter;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'ol.border > li{' + sLineBreak +
    '    position: relative;' + sLineBreak +
    '    margin-bottom: 20px;' + sLineBreak +
    '    padding-left: 0.5em;' + sLineBreak +
    '    font-size: 18px;' + sLineBreak +
    '    min-height: 3em;' + sLineBreak +
    '    border-bottom: 1px solid #CCCCCC;' + sLineBreak +
    '    border-left: 2px solid #CCCCCC;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'ol.border > li:before {' + sLineBreak +
    '    position: absolute;' + sLineBreak +
    '    top: 0;' + sLineBreak +
    '    left: -1.2em;' + sLineBreak +
    '    width: 0.8em;     ' + sLineBreak +
    '    font-size: 28px;' + sLineBreak +
    '    line-height: 1;' + sLineBreak +
    '    font-weight: bold;' + sLineBreak +
    '    text-align: right;' + sLineBreak +
    '    color: #FF8C00; ' + sLineBreak +
    '    content: counter(li-counter);' + sLineBreak +
    '    counter-increment: li-counter;' + sLineBreak +
    '}';

  HTMLTemplate =
    '<html>' + sLineBreak +
    '<head>' + sLineBreak +
    '<link href=''https://fonts.googleapis.com/css?family=Abel'' rel=''stylesheet''>' + sLineBreak +
    '<style>' + sLineBreak +
    CSSTemplate + sLineBreak +
    '</style>' + sLineBreak +
    '</head>' + sLineBreak +
    '<body>' + sLineBreak +
    '%TEMPLATE%' + sLineBreak +
    '</body>' + sLineBreak +
    '</html>';
var
  LHTML: string;
begin
  ABrowser.LoadHTML('<h2>Step by Step</h2>');

  if not Assigned(ADirectionsItem) then
    Exit;

  LHTML := '<h4>Total Distance: ' + TTMSFNCUtils.FloatToStrDot(Ceil(ADirectionsItem.Distance / 1000)) + ' km</h4>';
  LHTML := LHTML + '<h4>Total Duration: ' + TimeToStr(ADirectionsItem.Duration / SecsPerDay) + '</h4>';

  for var i := 0 to Pred(ADirectionsItem.Steps.Count) do
  begin
    LHTML := LHTML + '<li>';
    LHTML := LHTML + '  <b>Distance</b>: ' + TTMSFNCUtils.FloatToStrDot(Ceil(ADirectionsItem.Steps[i].Distance / 1000)) + ' km ';
    LHTML := LHTML + '  <b>Duration</b>: ' + TimeToStr(ADirectionsItem.Steps[i].Duration / SecsPerDay);
    LHTML := LHTML + '  <br/>' + ADirectionsItem.Steps[i].Instructions;
    LHTML := LHTML + '</li>';
  end;

  LHTML := '<ol class="border">' + LHTML + '</ol>';

  ABrowser.LoadHTML(StringReplace(HTMLTemplate, '%TEMPLATE%', LHTML, [rfReplaceAll]));
end;

end.
