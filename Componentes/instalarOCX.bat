gacutil /u SGLibrary.dll
Tlbexp SGLibrary.dll
regasm /tlb:SGLibrary.tlb SGLibrary.dll
gacutil /i SGLibrary.dll
ECHO "INSTALANDO ADGV"
gacutil /u AdvancedDataGridView.dll
Tlbexp AdvancedDataGridView.dll
regasm /tlb:AdvancedDataGridView.tlb AdvancedDataGridView.dll
gacutil /i AdvancedDataGridView.dll
ECHO "INSTALANDO ENTITYFRAMEWORK 4 "
gacutil /u EntityFramework.dll
Tlbexp EntityFramework.dll
regasm /tlb:EntityFramework.tlb EntityFramework.dll
gacutil /i EntityFramework.dll