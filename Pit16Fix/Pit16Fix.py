import glob
import os
import zlib

for i in glob.iglob('../build/pit.bin', recursive=True):
    if os.path.getsize(i) == 0xBBA0:	# size of the pit.bin
        with open(i, 'rb+') as f:
            data = f.read(0x14)
            if data[0x0:0x6] == b'\x30\x54\x49\x50\x30\x30':
                print('PIT16Fix - pit.bin CRC16 patcher') 
				print('By ihaveahax and ChampionLeake\n')   
                print('FAMILIAR BYTES FOUND: ', data[0x0:0x6])
                print('Correcting CRC', i)
                cc = zlib.crc32(data) & 0xFFFFFFFF
                real_cc = 0xFFFFFFFF - cc
                f.seek(0)
                f.write(real_cc.to_bytes(2, 'little'))
				print('Done! Have a nice day!')