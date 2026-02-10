Dannyy skript pozvolyaet generirovat konverty formata S5 dlya rassylki avtoreferata.

Dannye dlya zapolneniya nakhodyatsya v fayle `source.tsv` v formate
```
Indeks	Gorod	Adres	Predpriyatie	Adresat (esli est)
```
V fayle **5 kolonok**, oni razdeleny **znakom tabulyatsii (`\t`)**.

Informatsiyu ob otpravitele `letters.tex`,
v sektsii `Dannye otpravitelya`

Zapuskat generatsiyu komandoy
```bash
./generate source.tsv
```

Dlya raboty skripta takzhe trebuetsya programma `pdftk`.
Neobkhodimye dlya raboty shrifty nakhodyatsya v pake `fonts`.
