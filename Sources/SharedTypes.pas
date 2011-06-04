unit SharedTypes;

interface
type
  TLanguages = (lngAAR, { Afar }
    lngABK, { Abkhazian }
    lngACE, { Achinese }
    lngACH, { Acoli }
    lngADA, { Adangme }
    lngAFA, { Afro-Asiatic (Other) }
    lngAFH, { Afrihili }
    lngAFR, { Afrikaans }
    lngAKA, { Akan }
    lngAKK, { Akkadian }
    lngALB, { Albanian }
    lngALE, { Aleut }
    lngALG, { Algonquian Languages }
    lngAMH, { Amharic }
    lngAPA, { Apache Languages }
    lngARA, { Arabic }
    lngARC, { Aramaic }
    lngARM, { Armenian }
    lngARN, { Araucanian }
    lngARP, { Arapaho }
    lngART, { Artificial (Other) }
    lngARW, { Arawak }
    lngASM, { Assamese }
    lngATH, { Athapascan Languages }
    lngAVA, { Avaric }
    lngAVE, { Avestan }
    lngAWA, { Awadhi }
    lngAYM, { Aymara }
    lngAZE, { Azerbaijani }
    lngBAD, { Banda }
    lngBAI, { Bamileke Languages }
    lngBAK, { Bashkir }
    lngBAL, { Baluchi }
    lngBAM, { Bambara }
    lngBAN, { Balinese }
    lngBAQ, { Basque }
    lngBAS, { Basa }
    lngBAT, { Baltic (Other) }
    lngBEJ, { Beja }
    lngBEL, { Byelorussian }
    lngBEM, { Bemba }
    lngBEN, { Bengali }
    lngBER, { Berber (Other) }
    lngBHO, { Bhojpuri }
    lngBIH, { Bihari }
    lngBIK, { Bikol }
    lngBIN, { Bini }
    lngBIS, { Bislama }
    lngBLA, { Siksika }
    lngBNT, { Bantu (Other) }
    lngBOD, { Tibetan }
    lngBRA, { Braj }
    lngBRE, { Breton }
    lngBUA, { Buriat }
    lngBUG, { Buginese }
    lngBUL, { Bulgarian }
    lngBUR, { Burmese }
    lngCAD, { Caddo }
    lngCAI, { Central American Indian (Other) }
    lngCAR, { Carib }
    lngCAT, { Catalan }
    lngCAU, { Caucasian (Other) }
    lngCEB, { Cebuano }
    lngCEL, { Celtic (Other) }
    lngCES, { Czech }
    lngCHA, { Chamorro }
    lngCHB, { Chibcha }
    lngCHE, { Chechen }
    lngCHG, { Chagatai }
    lngCHI, { Chinese }
    lngCHM, { Mari }
    lngCHN, { Chinook jargon }
    lngCHO, { Choctaw }
    lngCHR, { Cherokee }
    lngCHU, { Church Slavic }
    lngCHV, { Chuvash }
    lngCHY, { Cheyenne }
    lngCOP, { Coptic }
    lngCOR, { Cornish }
    lngCOS, { Corsican }
    lngCRE, { Cree }
    lngCRP, { Creoles and Pidgins (Other) }
    lngCUS, { Cushitic (Other) }
    lngCYM, { Welsh }
    lngCZE, { Czech }
    lngDAK, { Dakota }
    lngDAN, { Danish }
    lngDEL, { Delaware }
    lngDEU, { German }
    lngDIN, { Dinka }
    lngDIV, { Divehi }
    lngDOI, { Dogri }
    lngDRA, { Dravidian (Other) }
    lngDUA, { Duala }
    lngDUT, { Dutch }
    lngDYU, { Dyula }
    lngDZO, { Dzongkha }
    lngEFI, { Efik }
    lngEGY, { Egyptian (Ancient) }
    lngEKA, { Ekajuk }
    lngELX, { Elamite }
    lngENG, { English }
    lngEPO, { Esperanto }
    lngESK, { Eskimo (Other) }
    lngESL, { Spanish }
    lngEST, { Estonian }
    lngEUS, { Basque }
    lngEWE, { Ewe }
    lngEWO, { Ewondo }
    lngFAN, { Fang }
    lngFAO, { Faroese }
    lngFAS, { Persian }
    lngFAT, { Fanti }
    lngFIJ, { Fijian }
    lngFIN, { Finnish }
    lngFIU, { Finno-Ugrian (Other) }
    lngFON, { Fon }
    lngFRA, { French }
    lngFRE, { French }
    lngFRY, { Frisian }
    lngFUL, { Fulah }
    lngGAA, { Ga }
    lngGAE, { Gaelic (Scots) }
    lngGAI, { Irish }
    lngGAY, { Gayo }
    lngGDH, { Gaelic (Scots) }
    lngGEM, { Germanic (Other) }
    lngGEO, { Georgian }
    lngGER, { German }
    lngGEZ, { Geez }
    lngGIL, { Gilbertese }
    lngGLG, { Gallegan }
    lngGON, { Gondi }
    lngGOT, { Gothic }
    lngGRB, { Grebo }
    lngGRE, { Greek, Modern (1453-) }
    lngGRN, { Guarani }
    lngGUJ, { Gujarati }
    lngHAI, { Haida }
    lngHAU, { Hausa }
    lngHAW, { Hawaiian }
    lngHEB, { Hebrew }
    lngHER, { Herero }
    lngHIL, { Hiligaynon }
    lngHIM, { Himachali }
    lngHIN, { Hindi }
    lngHMO, { Hiri Motu }
    lngHUN, { Hungarian }
    lngHUP, { Hupa }
    lngHYE, { Armenian }
    lngIBA, { Iban }
    lngIBO, { Igbo }
    lngICE, { Icelandic }
    lngIJO, { Ijo }
    lngIKU, { Inuktitut }
    lngILO, { Iloko }
    lngINA, { Interlingua (International Auxiliary language Association) }
    lngINC, { Indic (Other) }
    lngIND, { Indonesian }
    lngINE, { Interlingue }
    lngIPK, { Inupiak }
    lngIRA, { Iranian (Other) }
    lngIRI, { Irish }
    lngIRO, { Iroquoian uages }
    lngISL, { Icelandic }
    lngITA, { Italian }
    lngJAV, { Javanese }
    lngJAW, { Javanese }
    lngJPN, { Japanese }
    lngJPR, { Judeo-Persian }
    lngJRB, { Judeo-Arabic }
    lngKAA, { Kara-Kalpak }
    lngKAB, { Kabyle }
    lngKAC, { Kachin }
    lngKAL, { Greenlandic }
    lngKAM, { Kamba }
    lngKAN, { Kannada }
    lngKAR, { Karen }
    lngKAS, { Kashmiri }
    lngKAT, { Georgian }
    lngKAU, { Kanuri }
    lngKAW, { Kawi }
    lngKAZ, { Kazakh }
    lngKHA, { Khasi }
    lngKHI, { Khoisan (Other) }
    lngKHM, { Khmer }
    lngKHO, { Khotanese }
    lngKIK, { Kikuyu }
    lngKIN, { Kinyarwanda }
    lngKIR, { Kirghiz }
    lngKOK, { Konkani }
    lngKOM, { Komi }
    lngKON, { Kongo }
    lngKOR, { Korean }
    lngKPE, { Kpelle }
    lngKRO, { Kru }
    lngKRU, { Kurukh }
    lngKUA, { Kuanyama }
    lngKUM, { Kumyk }
    lngKUR, { Kurdish }
    lngKUS, { Kusaie }
    lngKUT, { Kutenai }
    lngLAD, { Ladino }
    lngLAH, { Lahnda }
    lngLAM, { Lamba }
    lngLAO, { Lao }
    lngLAT, { Latin }
    lngLAV, { Latvian }
    lngLEZ, { Lezghian }
    lngLIN, { Lingala }
    lngLIT, { Lithuanian }
    lngLOL, { Mongo }
    lngLOZ, { Lozi }
    lngLTZ, { Letzeburgesch }
    lngLUB, { Luba-Katanga }
    lngLUG, { Ganda }
    lngLUI, { Luiseno }
    lngLUN, { Lunda }
    lngLUO, { Luo (Kenya and Tanzania) }
    lngMAC, { Macedonian }
    lngMAD, { Madurese }
    lngMAG, { Magahi }
    lngMAH, { Marshall }
    lngMAI, { Maithili }
    lngMAK, { Macedonian }
    lngMAL, { Malayalam }
    lngMAN, { Mandingo }
    lngMAO, { Maori }
    lngMAP, { Austronesian (Other) }
    lngMAR, { Marathi }
    lngMAS, { Masai }
    lngMAX, { Manx }
    lngMAY, { Malay }
    lngMEN, { Mende }
    lngMIC, { Micmac }
    lngMIN, { Minangkabau }
    lngMIS, { Miscellaneous (Other) }
    lngMKH, { Mon-Kmer (Other) }
    lngMLG, { Malagasy }
    lngMLT, { Maltese }
    lngMNI, { Manipuri }
    lngMNO, { Manobo Languages }
    lngMOH, { Mohawk }
    lngMOL, { Moldavian }
    lngMON, { Mongolian }
    lngMOS, { Mossi }
    lngMRI, { Maori }
    lngMSA, { Malay }
    lngMUL, { Multiple Languages }
    lngMUN, { Munda Languages }
    lngMUS, { Creek }
    lngMWR, { Marwari }
    lngMYA, { Burmese }
    lngMYN, { Mayan Languages }
    lngNAH, { Aztec }
    lngNAI, { North American Indian (Other) }
    lngNAU, { Nauru }
    lngNAV, { Navajo }
    lngNBL, { Ndebele, South }
    lngNDE, { Ndebele, North }
    lngNDO, { Ndongo }
    lngNEP, { Nepali }
    lngNEW, { Newari }
    lngNIU, { Niuean }
    lngNLA, { Dutch }
    lngNOR, { Norwegian }
    lngNSO, { Sotho, Northern }
    lngNUB, { Nubian Languages }
    lngNYA, { Nyanja }
    lngNYM, { Nyamwezi }
    lngNYN, { Nyankole }
    lngNYO, { Nyoro }
    lngNZI, { Nzima }
    lngOCI, { Langue }
    lngOJI, { Ojibwa }
    lngORI, { Oriya }
    lngORM, { Oromo }
    lngOSA, { Osage }
    lngOSS, { Ossetic }
    lngOTO, { Otomian Languages }
    lngPAA, { Papuan-Australian (Other) }
    lngPAG, { Pangasinan }
    lngPAL, { Pahlavi }
    lngPAM, { Pampanga }
    lngPAN, { Panjabi }
    lngPAP, { Papiamento }
    lngPAU, { Palauan }
    lngPER, { Persian }
    lngPHN, { Phoenician }
    lngPLI, { Pali }
    lngPOL, { Polish }
    lngPON, { Ponape }
    lngPOR, { Portuguese }
    lngPRA, { Prakrit uages }
    lngPUS, { Pushto }
    lngQUE, { Quechua }
    lngRAJ, { Rajasthani }
    lngRAR, { Rarotongan }
    lngROA, { Romance (Other) }
    lngROH, { Rhaeto-Romance }
    lngROM, { Romany }
    lngRON, { Romanian }
    lngRUM, { Romanian }
    lngRUN, { Rundi }
    lngRUS, { Russian }
    lngSAD, { Sandawe }
    lngSAG, { Sango }
    lngSAH, { Yakut }
    lngSAI, { South American Indian (Other) }
    lngSAL, { Salishan Languages }
    lngSAM, { Samaritan Aramaic }
    lngSAN, { Sanskrit }
    lngSCO, { Scots }
    lngSCR, { Serbo-Croatian }
    lngSEL, { Selkup }
    lngSEM, { Semitic (Other) }
    lngSHN, { Shan }
    lngSID, { Sidamo }
    lngSIN, { Singhalese }
    lngSIO, { Siouan Languages }
    lngSIT, { Sino-Tibetan (Other) }
    lngSLA, { Slavic (Other) }
    lngSLK, { Slovak }
    lngSLO, { Slovak }
    lngSLV, { Slovenian }
    lngSMI, { Sami Languages }
    lngSMO, { Samoan }
    lngSNA, { Shona }
    lngSND, { Sindhi }
    lngSOG, { Sogdian }
    lngSOM, { Somali }
    lngSON, { Songhai }
    lngSOT, { Sotho, Southern }
    lngSPA, { Spanish }
    lngSQI, { Albanian }
    lngSRD, { Sardinian }
    lngSRR, { Serer }
    lngSSA, { Nilo-Saharan (Other) }
    lngSSW, { Siswant, Swazi }
    lngSUK, { Sukuma }
    lngSUN, { Sudanese }
    lngSUS, { Susu }
    lngSUX, { Sumerian }
    lngSVE, { Swedish }
    lngSWA, { Swahili }
    lngSWE, { Swedish }
    lngSYR, { Syriac }
    lngTAH, { Tahitian }
    lngTAM, { Tamil }
    lngTAT, { Tatar }
    lngTEL, { Telugu }
    lngTEM, { Timne }
    lngTER, { Tereno }
    lngTGK, { Tajik }
    lngTGL, { Tagalog }
    lngTHA, { Thai }
    lngTIB, { Tibetan }
    lngTIG, { Tigre }
    lngTIR, { Tigrinya }
    lngTIV, { Tivi }
    lngTLI, { Tlingit }
    lngTMH, { Tamashek }
    lngTOG, { Tonga (Nyasa) }
    lngTON, { Tonga (Tonga Islands) }
    lngTRU, { Truk }
    lngTSI, { Tsimshian }
    lngTSN, { Tswana }
    lngTSO, { Tsonga }
    lngTUK, { Turkmen }
    lngTUM, { Tumbuka }
    lngTUR, { Turkish }
    lngTUT, { Altaic (Other) }
    lngTWI, { Twi }
    lngTYV, { Tuvinian }
    lngUGA, { Ugaritic }
    lngUIG, { Uighur }
    lngUKR, { Ukrainian }
    lngUMB, { Umbundu }
    lngUND, { Undetermined }
    lngURD, { Urdu }
    lngUZB, { Uzbek }
    lngVAI, { Vai }
    lngVEN, { Venda }
    lngVIE, { Vietnamese }
    lngVOL, { Volapuk }
    lngVOT, { Votic }
    lngWAK, { Wakashan }
    lngWAL, { Walamo }
    lngWAR, { Waray }
    lngWAS, { Washo }
    lngWEL, { Welsh }
    lngWEN, { Sorbian }
    lngWOL, { Wolof }
    lngXHO, { Xhosa }
    lngYAO, { Yao }
    lngYAP, { Yap }
    lngYID, { Yiddish }
    lngYOR, { Yoruba }
    lngZAP, { Zapotec }
    lngZEN, { Zenaga }
    lngZHA, { Zhuang }
    lngZHO, { Chinese }
    lngZUL, { Zulu }
    lngZUN { Zuni }
    );

type
  TVersion = packed record
    Magor: Integer;
    Minor: Integer;
    Release: Integer;
    Build: Integer;
  end;

type

  TPluginInfo = packed record
    Name: PWideChar;
    Author: PWideChar;
    Description: PWideChar;
    HasSettings: Boolean;
    Version: TVersion;
  end;

  TDoAction = function: Cardinal; stdcall;
  TGetPluginInfo = function: TPluginInfo; stdcall;
  TShowSettings = function: Cardinal; stdcall;

function SetVersion(const lMagor, lMinor, lRelease, lBuild: Integer): TVersion;

implementation

function SetVersion(const lMagor, lMinor, lRelease, lBuild: Integer): TVersion;
begin
  with Result do
  begin
    Magor := lMagor;
    Minor := lMinor;
    Release := lRelease;
    Build := lBuild;
  end;
end;

end.
