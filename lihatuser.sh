#!/bin/bash
echo "Lihat data pengguna user yang perlu perpanjangan hosting, paling atas yang terbaru, yang paling bawah yang terlama"
echo ""
find /home/datauser/ $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head
