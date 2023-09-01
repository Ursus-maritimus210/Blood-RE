;
; Copyright (C) 2018, 2022 nukeykt
;
; This file is part of Blood-RE.
;
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
.386
.MODEL small

.DATA
lut		dd 0, 77073096h, 0EE0E612Ch, 990951BAh, 76DC419h, 706AF48Fh
		dd 0E963A535h, 9E6495A3h, 0EDB8832h, 79DCB8A4h, 0E0D5E91Eh
		dd 97D2D988h, 9B64C2Bh, 7EB17CBDh, 0E7B82D07h, 90BF1D91h
		dd 1DB71064h, 6AB020F2h, 0F3B97148h, 84BE41DEh, 1ADAD47Dh
		dd 6DDDE4EBh, 0F4D4B551h, 83D385C7h, 136C9856h, 646BA8C0h
		dd 0FD62F97Ah, 8A65C9ECh, 14015C4Fh, 63066CD9h, 0FA0F3D63h
		dd 8D080DF5h, 3B6E20C8h, 4C69105Eh, 0D56041E4h, 0A2677172h
		dd 3C03E4D1h, 4B04D447h, 0D20D85FDh, 0A50AB56Bh, 35B5A8FAh
		dd 42B2986Ch, 0DBBBC9D6h, 0ACBCF940h, 32D86CE3h, 45DF5C75h
		dd 0DCD60DCFh, 0ABD13D59h, 26D930ACh, 51DE003Ah, 0C8D75180h
		dd 0BFD06116h, 21B4F4B5h, 56B3C423h, 0CFBA9599h, 0B8BDA50Fh
		dd 2802B89Eh, 5F058808h, 0C60CD9B2h, 0B10BE924h, 2F6F7C87h
		dd 58684C11h, 0C1611DABh, 0B6662D3Dh, 76DC4190h, 1DB7106h
		dd 98D220BCh, 0EFD5102Ah, 71B18589h, 6B6B51Fh, 9FBFE4A5h
		dd 0E8B8D433h, 7807C9A2h, 0F00F934h, 9609A88Eh, 0E10E9818h
		dd 7F6A0DBBh, 86D3D2Dh, 91646C97h, 0E6635C01h, 6B6B51F4h
		dd 1C6C6162h, 856530D8h, 0F262004Eh, 6C0695EDh, 1B01A57Bh
		dd 8208F4C1h, 0F50FC457h, 65B0D9C6h, 12B7E950h, 8BBEB8EAh
		dd 0FCB9887Ch, 62DD1DDFh, 15DA2D49h, 8CD37CF3h, 0FBD44C65h
		dd 4DB26158h, 3AB551CEh, 0A3BC0074h, 0D4BB30E2h, 4ADFA541h
		dd 3DD895D7h, 0A4D1C46Dh, 0D3D6F4FBh, 4369E96Ah, 346ED9FCh
		dd 0AD678846h, 0DA60B8D0h, 44042D73h, 33031DE5h, 0AA0A4C5Fh
		dd 0DD0D7CC9h, 5005713Ch, 270241AAh, 0BE0B1010h, 0C90C2086h
		dd 5768B525h, 206F85B3h, 0B966D409h, 0CE61E49Fh, 5EDEF90Eh
		dd 29D9C998h, 0B0D09822h, 0C7D7A8B4h, 59B33D17h, 2EB40D81h
		dd 0B7BD5C3Bh, 0C0BA6CADh, 0EDB88320h, 9ABFB3B6h, 3B6E20Ch
		dd 74B1D29Ah, 0EAD54739h, 9DD277AFh, 4DB2615h, 73DC1683h
		dd 0E3630B12h, 94643B84h, 0D6D6A3Eh, 7A6A5AA8h, 0E40ECF0Bh
		dd 9309FF9Dh, 0A00AE27h, 7D079EB1h, 0F00F9344h, 8708A3D2h
		dd 1E01F268h, 6906C2FEh, 0F762575Dh, 806567CBh, 196C3671h
		dd 6E6B06E7h, 0FED41B76h, 89D32BE0h, 10DA7A5Ah, 67DD4ACCh
		dd 0F9B9DF6Fh, 8EBEEFF9h, 17B7BE43h, 60B08ED5h, 0D6D6A3E8h
		dd 0A1D1937Eh, 38D8C2C4h, 4FDFF252h, 0D1BB67F1h, 0A6BC5767h
		dd 3FB506DDh, 48B2364Bh, 0D80D2BDAh, 0AF0A1B4Ch, 36034AF6h
		dd 41047A60h, 0DF60EFC3h, 0A867DF55h, 316E8EEFh, 4669BE79h
		dd 0CB61B38Ch, 0BC66831Ah, 256FD2A0h, 5268E236h, 0CC0C7795h
		dd 0BB0B4703h, 220216B9h, 5505262Fh, 0C5BA3BBEh, 0B2BD0B28h
		dd 2BB45A92h, 5CB36A04h, 0C2D7FFA7h, 0B5D0CF31h, 2CD99E8Bh
		dd 5BDEAE1Dh, 9B64C2B0h, 0EC63F226h, 756AA39Ch, 26D930Ah
		dd 9C0906A9h, 0EB0E363Fh, 72076785h, 5005713h, 95BF4A82h
		dd 0E2B87A14h, 7BB12BAEh, 0CB61B38h, 92D28E9Bh, 0E5D5BE0Dh
		dd 7CDCEFB7h, 0BDBDF21h, 86D3D2D4h, 0F1D4E242h, 68DDB3F8h
		dd 1FDA836Eh, 81BE16CDh, 0F6B9265Bh, 6FB077E1h, 18B74777h
		dd 88085AE6h, 0FF0F6A70h, 66063BCAh, 11010B5Ch, 8F659EFFh
		dd 0F862AE69h, 616BFFD3h, 166CCF45h, 0A00AE278h, 0D70DD2EEh
		dd 4E048354h, 3903B3C2h, 0A7672661h, 0D06016F7h, 4969474Dh
		dd 3E6E77DBh, 0AED16A4Ah, 0D9D65ADCh, 40DF0B66h, 37D83BF0h
		dd 0A9BCAE53h, 0DEBB9EC5h, 47B2CF7Fh, 30B5FFE9h, 0BDBDF21Ch
		dd 0CABAC28Ah, 53B39330h, 24B4A3A6h, 0BAD03605h, 0CDD70693h
		dd 54DE5729h, 23D967BFh, 0B3667A2Eh, 0C4614AB8h, 5D681B02h
		dd 2A6F2B94h, 0B40BBE37h, 0C30C8EA1h, 5A05DF1Bh, 2D02EF8Dh


.CODE


PUBLIC CRC32_
CRC32_ PROC
	mov eax,0ffffffffh
	xor ebx,ebx
	shr ecx,1
	jnb short L1
	mov bl,[esi]
	xor bl,al
	shr eax,8
	inc esi
	mov edx,lut[ebx*4]
	xor eax,edx
L1:	jecxz short L3
L2:	mov bl,[esi]
	xor bl,al
	shr eax,8
	inc esi
	mov edx,lut[ebx*4]
	xor eax,edx
	mov bl,[esi]
	xor bl,al
	shr eax,8
	inc esi
	mov edx,lut[ebx*4]
	xor eax,edx
	dec ecx
	jnz short L2
L3:	not eax
	retn
ENDP

END