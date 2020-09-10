# Scripts

Any scripts I write and want to keep for any reason.

### MAC Rename

A Windows batch script to take in a CSV file containing MAC addresses and computer names and when it is run on a computer.  If that computers MAC address is in the list, it will be set to the corresponding name. e.g.

```
MAC-Address,Name
00-00-00-00-00-01,PC-1
00-00-00-00-00-02,PC-2
00-00-00-00-00-03,PC-3
00-00-00-00-00-04,PC-4
```

If run on the computer with the MAC address `00-00-00-00-00-01`, the name of that computer will be set to `PC-1` using the Compname.exe

### MiFARE Conversion

Take a MiFARE RFID, decimalises, removes digits for one and then reverses the number and does the same for the other.  Command line and RESTful versions.

i.e. `56291629` ->	`29162956` ->	`689318230`, `1445533225` -> `45533225` ->	`0#45533225`
