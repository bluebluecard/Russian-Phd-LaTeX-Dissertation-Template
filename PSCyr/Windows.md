Instruktsiya po ustanovke (Windows + MiKTeX):

* Razarkhivirovat *pscyr0.4d.zip*.
* Ckopirovat soderzhimoe v koren osnovnoy direktorii MiKTeX-a (naprimer,
`C:\Program Files\MiKTeX 2.9\`) — proizoydet sliyanie papok.
* Pereyti v bin-direktoriyu MiKTeX-a (naprimer,
`C:\Program Files\MiKTeX 2.9\miktex\bin\x64\`).
* Vypolnit komandu `initexmf --edit-config-file dvips` i vvesti v otkryvshiysya
bloknot `p +pscyr.map`.
* Vypolnit komandu `initexmf --edit-config-file pdftex` i vvesti v otkryvshiysya
bloknot `+pscyr.map`.
* Vypolnit komandu `initexmf --edit-config-file updmap` i vvesti v otkryvshiysya
bloknot `Map pscyr.map`.
* Vypolnit komandu `updmap`.
* Vypolnit komandu `initexmf --edit-config-file dvipdfm` i vvesti v otkryvshiysya
bloknot `f pscyr2.map`.
* Vypolnit komandu `initexmf -u`.
* Zapustit iz **menyu Pusk** programmu **Settings (Admin)** i na vkladke
**General** nazhat knopku **Refresh FNDB**.
* Vypolnit komandu `mkfntmap`.

Protestirovano: Windows 7, Windows 8, Windows 8.1.
