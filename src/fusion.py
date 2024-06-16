'''
 Copyright (C) 2024  Faisal Shahzad

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 pysensors is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

def format(myCompass):
    
    try:
        compass_ = f"Compass: {myCompass.reading.azimuth:.2f}"
        return compass_
    except:
        return "Exception Raised"