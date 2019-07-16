//
DefinitionBlock ("", "SSDT", 2, "hack", "OCWork", 0)
{
    External (_SB.ACOS, IntObj)
    External (_SB.ACSE, IntObj)
   
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            \_SB.ACOS = 0x80
            \_SB.ACSE = 0 //0:win7,,1:win8,,2:win81
        }
    }
}