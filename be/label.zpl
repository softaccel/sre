^XA
^FX Second section with recipient address and permit information.
^CFA,25
^FO75,25,0^FDVorrichtung Traverse FSC-Tech / ^FS
^FO75,50,0^FDkurz / Fine Side Cover /^FS

^CFA,30

^FO75,125,0^FDBN: D12542357^FS
^FO75,150,0^FDNC: A171^FS
^FO75,175,0^FDZN: 1335620^FS
^FO75,200,0^FDTN: 3812930^FS


^FX Third section with bar code.
^FX DACA MARIMEA DE LA BY(PRIMUL PAR) = 3, incap 9 caractere. daca e = 2, incap 12 +-
^BY2,3.0,150
^FX la ^BC (bar code) ce ar fi intre virgule este inaltimea si ce e fix urmatorul este [Y/N] = afiseaza sau nu string-ul sub
^FO750,100,1^BCN,,Y,N,N^FD3812930123^FS
^XZ

^FX http://labelary.com/viewer.html

^FX command: cat label.zpl > /dev/usb/lp0
