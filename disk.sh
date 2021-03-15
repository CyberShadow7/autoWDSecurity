#!/bin/bash
# Copyright 2020-2021 CyberShadow
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Disk Decryption automation tool."
echo ""
echo "Requires wdpassport-utils [https://github.com/KenMacD/wdpassport-utils] to work. \nIt also requires wdpassport-utils to be in the directory '/home/parrot/'"
echo ""
echo ""

if [[ $EUID > 0 ]]
then echo "Please run as root"
    exit
fi

# TODO: Find a better way to select the encrypted disk. If you plug the drive after the kernel has reached a time higher than 9.9999999... There will be an error. Open to suggestions. Fixed in Linux 5.10.

TEST=`dmesg | grep scsi | grep "type 13"`
TEST2=`echo "$TEST" | awk '{print $8}'`

DISK=$TEST2

echo "$DISK"
# TODO: Make the script search for wdpassport-utils and cd to that directory.
# Do NOT tamper with the code under the 'cd' statement since it is the same in most Debian distros. Only if the path-to-disk is wrong try to fix it, although modern Linux doesn't have such problem.
cd ~/wdpassport-utils/
sg_raw -s 40 -i password.bin /dev/$DISK c1 e1 00 00 00 00 00 00 28 00
partprobe
sg_raw -r 32 /dev/$DISK c0 45 00 00 00 00 00 00 30

echo "If the 4th digit is '2' (Ex.: 40 00 00 02), the disk in unlocked"
