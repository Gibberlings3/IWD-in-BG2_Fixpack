EXTEND_BOTTOM dorrick 14 
IF ~GlobalGT("Chapter","GLOBAL",1)~ THEN REPLY ~Actually, can we see the items you had to offer when we first arrived in Kuldahar?~ DO ~StartStore("KUOrk1",Protagonist)~ EXIT
IF ~GlobalGT("Chapter","GLOBAL",3)~ THEN REPLY ~Can we have another look at the items you had to offer partway through our stay here?~ DO ~StartStore("KUOrk2",Protagonist)~ EXIT
END 