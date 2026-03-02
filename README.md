![Windows](https://img.shields.io/badge/Platform-Windows%2010%2F11-blue?style=for-the-badge\&logo=windows)
![PowerShell](https://img.shields.io/badge/Built%20With-PowerShell-5391FE?style=for-the-badge\&logo=powershell)
![Adobe Reader](https://img.shields.io/badge/Requires-Adobe%20Acrobat%20Reader-red?style=for-the-badge\&logo=adobeacrobatreader)
![Printer](https://img.shields.io/badge/Printer-Duplex%20Supported-green?style=for-the-badge\&logo=hp)
![Paper Size](https://img.shields.io/badge/Paper-Legal%20Size%20\(8.5x14\)-orange?style=for-the-badge)
![Mode](https://img.shields.io/badge/Mode-Headless%20Automatic-black?style=for-the-badge)
![License](https://img.shields.io/badge/License-Free%20to%20Use-brightgreen?style=for-the-badge)
------------------------------------------------------------------------------------------------

# Bulk PDF Print Manager (Headless Legal Duplex Printing)

# Bulk PDF Print Manager (Headless Legal Duplex Printing)


A Windows-based headless bulk printing system that prints hundreds of PDF files **one-by-one sequentially** without freezing the printer spooler.

Designed for offices handling:

* Layout / LRS / DTCP applications
* Asset records
* Insurance policies
* Court documents
* Registration office bulk printing

This project turns a normal Windows PC into a **mini print server**.

---

## Features

✔ Sequential printing (no mixed pages)
✔ Headless (runs without opening any window)
✔ Legal size printing (8.5 x 14)
✔ Automatic Duplex printing
✔ Flip on Long Edge (Book binding)
✔ Progress logging
✔ Delay between files
✔ Auto move printed files
✔ Scheduled background printing
✔ Works over USB or Network printer

---

## How It Works

1. PDFs are placed inside the **Input** folder
2. Windows Scheduled Task launches the script silently
3. Adobe Reader sends files to printer one at a time
4. Script waits until spooler finishes
5. File moves to Printed folder
6. Next file begins automatically

No manual printing required.

---

## Requirements

* Windows 10 / Windows 11
* Adobe Acrobat Reader DC
* PowerShell 5.1+
* Any duplex printer (HP / Canon / Epson / Xerox / Kyocera)

Install Adobe Reader:
https://get.adobe.com/reader/

---

## Folder Structure

Create:

C:\BulkPrint
│
├── Input
├── Printed
├── logs
├── bulk_print.ps1
└── run_silent.bat

Place all PDFs inside:

C:\BulkPrint\Input

---

## Printer Setup (VERY IMPORTANT)

Open:

Control Panel → Devices and Printers

Right Click Printer → **Printing Preferences**

Set:

Paper Size → Legal
Print on both sides → Enabled
Binding → Flip on Long Edge

Then:

Printer Properties → Advanced → Printing Defaults

Repeat same settings again.

Without this step, Windows may revert to A4.



---

## License

Free to use for offices and public sector use.

---

## Author

Created for bulk administrative printing environments.
