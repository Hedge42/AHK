#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000


CapsLock & Space::
InputBox, value
Process(value)
return

Process(value)
{
    coolEditorScript := "nice"
    if (value = coolEditorScript) 
    {
         Send, %coolEditorScript%
    } 

    return
}


