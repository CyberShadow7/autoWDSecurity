Copyright 2021 CyberShadow7

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements
In order for the program to run flawlessly with any WD drive which can be [un]locked with WD-Security application for Windows / MacOS, you need to download and follow all the instructions in [KenMacD's wdpassport-utils] (https://github.com/KenMacD/wdpassport-utils) github page (and README).

While going through the instructions stated above make sure to name the password as 'password.bin'. If not you'll have to modify the script yourself.

## Final Steps
After installing wdpassport-utils, and creating a file of 40 bytes containing the password[^1], you can safely run the script.

# *WARNING : *
**The wdpassport-utils folder MUST be in whichever directory your bash thinks as '~' when running as root.**
*If* you have downloaded it to another folder the script will return an error.


# Also, run the disk.sh script **as root only.**

**Feel free to contribute by taking up tasks commented in the code as "TODO:"**

[^1]: You can check that the file size is the intended one by running `ls -l` inside the wdpassport-utils folder. If it says '40' next to the file called 'password.bin', you're good to go.

Feel free to redistribute as long as the following file is provided : 
The Apache License 2.0 notice (found at the top) **AND** this README.md file.
Also make changes to this file if there is a need.
