// Overriding BTNV
// In config ACPI, BTNV to XTNV(dell-Insert)
// Find:     42 54 4E 56 02
// Replace:  58 54 4E 56 02
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "Insert", 0)
{
#endif
    External(_SB.PCI9.FNOK, IntObj)
    External(_SB.XTNV, MethodObj)
    
    Scope (_SB)
    {
        Method (BTNV, 2, NotSerialized)
        {
            If ((_OSI ("Darwin"))&&(Arg0 == 2))
            {
                \_SB.PCI9.FNOK =1
            }
            \_SB.XTNV(Arg0, Arg1)
        }
    } 
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF