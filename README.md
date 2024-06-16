# PySensors
![PySensors Logo](assets/logo.png)


PySensors is a sample Ubuntu Touch App that shows how to write Ubuntu Touch/Liomiri Apps using Python. 

## Introduction

It is a very basic example showing getting Compass data from your smartphone running Ubuntu Touch (20.04). The current version only shows how to extract compass data.

## Installation

You need a working installation of Ubunut Touch on any supported device with integrated sensors e.g. Compass. A computer with working installation of clickable software is also require. If you need help on this then follow forums/website of Ubports/Ubuntu Touch.

Once these requirements are met, then clone this repository on your system. 

```bash
$ git@github.com:pybodensee/pysensors.git
$ clickable install
```

Do not forget to activate the respective Python Virtual environment, if you haven't already done so. Also, your Ubuntu phone should be in debug/developer mode and connected to your computer with a USB drive.

## Hardware Tests

The current version has been tested on the Xiaomi Redmi Pro 9 (EEA), as shown below.

![PySensors Running on Xiaomi Redmi Pro 9 with Ubunut Touch/Liomiri ](assets/screnshot_dark.png)

## Implementation Details

This app has two implementation restrictions.

- At the moment only the Compass sensor value is processed or shown on the App interface.

- Technically, there are two approaches to run the background process to process Sensor values in the background.
    - Running Timer in QML File as an element and then calling Python functions at desired intervals. The current implementation uses this approach. This is not a clean solution as it mixes logic and GUI and separation in bigger programs can be difficult.
    - Background thread or timer can be executed in the background and then the pyotherside package can be used to trigger events for communication with main windows (Future Plan). 


## License

Copyright (C) 2024  Faisal Shahzad

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License version 3, as published by the
Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranties of MERCHANTABILITY, SATISFACTORY
QUALITY, or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.
