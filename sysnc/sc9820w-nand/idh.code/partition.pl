#!/usr/bin/perl

@param = (
   #ID              , file_path          , file_flag, check_flag, omit_flag, addr1     , addr2 
   ["FDL"           , "$outBinPath/fdl1.bin", 							0x0101   , 1        , 0        , 0x50000000, 0xFFFFFFFF  ],
   ["FDL2"          , "$outBinPath/fdl2.bin", 							0x0101   , 1        , 0        , 0x80000000, 0xFFFFFFFF  ],
   ["NV"       , "$otherBinPath/$featureValues{'NV_WLTE'}", 						1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["ProdNV"        , "$outBinPath/prodnv_b256k_p4k.img", 	1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["PhaseCheck"    , ""                 				, 0        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["EraseUBOOT"    , ""                 				, 0        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["SPLLoader"     , "$outBinPath/u-boot-spl-16k.bin", 		1        , 1        , 0        , 0x00000000, 0xFFFFFFFF  ],
   ["Modem"    , "$otherBinPath/$featureValues{'MODEM_WLTE'}", 	1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["DSP_LTE"  , "$otherBinPath/$featureValues{'DSP_WLTE_LTE'}", 						1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["DSP_TG"  , "$otherBinPath/$featureValues{'DSP_WLTE_GGE'}", 			1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["WARM"     , "$otherBinPath/$featureValues{'WARM_WLTE'}", 1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["DFS"           , "$otherBinPath/$featureValues{'DFS'}", 			1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["FDL_WCN"       , "$otherBinPath/$featureValues{'FDL_WCN'}", 					1        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["Modem_WCN"     , "$otherBinPath/$featureValues{'MODEM_WCN'}", 1        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["BOOT"          , "$outBinPath/boot.img", 							1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["Recovery"      , "$outBinPath/recovery.img", 					1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["System"        , "$outBinPath/system_b256k_p4k.img", 	1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["UserData"      , "$outBinPath/userdata_b256k_p4k.img", 1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["BootLogo"      , "$otherBinPath/$featureValues{'BOOTLOGO'}", 				1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["Fastboot_Logo" , "$otherBinPath/$featureValues{'FASTBOOT_LOGO'}", 				1        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["Cache"         , "$outBinPath/cache_b256k_p4k.img", 		1        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["FLASH_WLTE"    , ""                 , 				0        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["EraseMisc"     , ""                 , 				0        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["EraseSD"       , ""                 , 				0        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   ["UBOOTLoader"   , "$outBinPath/u-boot.bin", 						1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["ProdNV"        , "$outBinPath/prodnv_b128k_p2k.img", 	1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["System"        , "$outBinPath/system_b128k_p2k.img", 	1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["UserData"      , "$outBinPath/userdata_b128k_p2k.img", 1        , 1        , 0        , 0x0       , 0xFFFFFFFF  ],
   ["Cache"         , "$outBinPath/cache_b128k_p2k.img", 		1        , 1        , 1        , 0x0       , 0xFFFFFFFF  ],
   [""              , $config            , 				2        , 0        , 0        , 0x0       , 0xFFFFFFFF  ],
);

$binconfig = "MODEM_WCN=1\@.\\ImageFiles\\image\\$featureValues{'MODEM_WCN'}\r
BOOT=1\@.\\ImageFiles\\image\\boot.img\r
ERASESD=1\@\r
MODEM=1\@.\\ImageFiles\\image\\$featureValues{'MODEM_WLTE'}\r
NV=1\@.\\ImageFiles\\image\\$featureValues{'NV_WLTE'}\r
USERDATA=1\@.\\ImageFiles\\image\\userdata_b${blocksize}_p${pagesize}.img\r
RECOVERY=1\@.\\ImageFiles\\image\\recovery.img\r
DSP_TG=1\@.\\ImageFiles\\image\\$featureValues{'DSP_WLTE_GGE'}\r
ERASEUBOOT=1\@\r
FDL2=1\@.\\ImageFiles\\image\\fdl2.bin\r
UBOOTLOADER=1\@.\\ImageFiles\\image\\u-boot.bin\r
WARM=1\@.\\ImageFiles\\image\\$featureValues{'WARM_WLTE'}\r
FLASHE=1\@\r
FDL_WCN=1\@.\\ImageFiles\\image\\$featureValues{'FDL_WCN'}\r
FDL=1\@.\\ImageFiles\\image\\fdl1.bin\r
PHASECHECK=1\@\r
BOOTLOGO=1\@.\\ImageFiles\\image\\$featureValues{'BOOTLOGO'}\r
DFS=1\@.\\ImageFiles\\image\\$featureValues{'DFS'}\r
DSP_LTE=1\@.\\ImageFiles\\image\\$featureValues{'DSP_WLTE_LTE'}\r
FASTBOOT_LOGO=1\@.\\ImageFiles\\image\\$featureValues{'FASTBOOT_LOGO'}\r
CACHE=1\@.\\ImageFiles\\image\\cache_b${blocksize}_p${pagesize}.img\r
SYSTEM=1\@.\\ImageFiles\\image\\system_b${blocksize}_p${pagesize}.img\r
ERASEMISC=1\@\r
SPLLOADER=1\@.\\ImageFiles\\image\\u-boot-spl-16k.bin\r
PRODNV=1\@.\\ImageFiles\\image\\prodnv_b${blocksize}_p${pagesize}.img\r";

1;