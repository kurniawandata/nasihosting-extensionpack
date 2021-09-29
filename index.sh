#!/bin/bash
#Desain front end halaman login ini dibuat oleh awan - e-mail: hermawan9815@gmail.com , untuk back end oleh kurniawan - e-mail: kurniawanajazenfone@gmail.com
echo "Content-type: text/html"
echo ""
patch=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
convert \
    -size 225x100 \
    xc:lightblue \
    -font Bookman-DemiItalic \
    -pointsize 18 \
    -fill blue \
    -gravity center \
    -draw "text 0,0 '$(cat key.txt)'" \
    image.png
convert image.png -background white -wave 4x55 image.png
sudo cp image.png /var/www/html
cat <<EOT
<!DOCTYPE html>
<html>
<head>
    <title>Pendaftaran nasihosting</title>
     <link rel="stylesheet" href="https://server3.nasihosting.com/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
    { 
        font: bold 16px;
        color:WHITE;
        background-color:BLACK;
        width:100px;border-radius: 5px;
        text-align:center;
    }
    .errmsg
    {color:#ff0000;}
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="offset-1 col-10 mt-4">
                <h3 style="text-align: center;">Registration Free Hosting</h3>
<br>
                <form action="runbaru.sh" method="get">
                <table class="table">
                    <tr>
                        <td>Nama Sub domain : </td>
                        <td>
                            <input type="text" name="name" pattern="^[a-z0-9]+$"  title="Subdomain harus huruf kecil dan jangan pakai tanda - dan .">.nasihosting.com
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Password : </td>
                        <td>
                            <input type="password" name="password" pattern="^[a-zA-Z0-9]+$" title="Password hanya mendukung huruf dan angka." class="form-control">
                        </td>
                    </tr>

                    <tr>
                        <td>Nomor whatsapp : </td>
                        <td>
                            <input type="text" name="wa" pattern="^[0-9]+$" title="Jika nomor whatsapp tidak diisi maka tidak bisa recovery password & sebagainya" class="form-control">
                        </td>
                    </tr>

                    <tr>
                       <td>
                        Captcha </td>
                       <td colspan="2"><img src="https://freehacklab.xcode.or.id/image.png?$patch">
                       </td>
                        </tr>
                     <tr>
                        <td>Type Captcha : </td>
                        <td>
                            <input type="text" name="cek" pattern="^[a-zA-Z0-9]+$" title="Captcha." class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:right;">
                            <input type="submit" value="Daftar" class="btn btn-sm btn-primary form-control"/>
                        </td>
                    </tr>
                </table>
                </form>
Teknologi captcha gambar, filter input hanya mendukung huruf dan angka dibackend dan berbagai proteksinya lainnya dibuat algoritma dan kode sumbernya oleh PT. Kode Keamanan Indonesia. Hosting dan subdomain ini 100% gratis, tidak ada biaya tersembunyi. Nomor WA harus diisi dengan benar karena jika tidak, maka password tidak bisa direcovery jika lupa password.<br><br>
            </div>
        </div>
    </div>
<br>
<br>
</body>

</html>
EOT
