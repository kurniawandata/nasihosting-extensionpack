#!/bin/bash
#Desain front end halaman login ini dibuat oleh awan - e-mail: hermawan9815@gmail.com, untuk back end oleh kurniawan - e-mail: kurniawanajazenfone@gmail.com
#pattern dan title dibuat oleh Aziz Alfian - https://github.com/aalfiann
echo "Content-type: text/html"
echo ""
cat <<EOT
<!DOCTYPE html>
<html>
<head>
    <title>Pendaftaran</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
    .captcha
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
    <script>        
        function createCaptcha(){
            for(i=0; i<6 ; i++){
                if(i %2 ==0){
                    captcha[i] = String.fromCharCode(Math.floor((Math.random()*26)+65));
                }else{      
                    captcha[i] = Math.floor((Math.random()*10)+0);
                }
            }
            var thecaptcha=captcha.join("");
            var elm = document.getElementById('captcha');
            elm.innerHTML="<span class='captcha'> " + thecaptcha+ " </span>" + "&nbsp; <a onclick='createCaptcha()' class='badge badge-warning' href='#'>recaptcha</a>";
        }
        var captcha= new Array ();

        function validateRecaptcha(){
            var recaptcha= document.getElementById("recaptcha").value;;
            var validRecaptcha=0;
            for(var j=0; j<6; j++){
                if(recaptcha.charAt(j)!= captcha[j]){
                    validRecaptcha++;
                }
            }
            if (recaptcha == ""){
                document.getElementById('errCaptcha').innerHTML = 'Re-Captcha must be filled';
                document.getElementById("btnDaftar").disabled = true;
            } else if (validRecaptcha>0 || recaptcha.length>6){
                document.getElementById('errCaptcha').innerHTML = 'Sorry, Wrong Re-Captcha';
                document.getElementById("btnDaftar").disabled = true;
            } else{
                document.getElementById('errCaptcha').innerHTML = 'OK';
                document.getElementById("btnDaftar").disabled = false;
            }
        }

        
    </script>
    <div class="container">
        <div class="row">
            <div class="offset-1 col-10 mt-4">
                <h3 style="text-align: center;">Registration (Nomor WA harus diisi dengan benar karena jika tidak, maka password tidak bisa direcovery jika lupa password)</h3>
                <form action="run-httponly.sh" method="get">
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
                            <input type="text" name="wa" class="form-control">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Captcha : </td>
                        <td id="captcha" colspan="2">
                            <script> createCaptcha(); </script>
                        </td>
                    </tr>

                    <tr>
                        <td>Type Captcha : </td>
                        <td>
                            <input onkeyup="validateRecaptcha()" type="text" name="recaptcha" id="recaptcha" placeholder="Type the captcha" class="form-control"/>
                        </td>
                        <td id="errCaptcha" class="errmsg"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:right;">
                            <input disabled id="btnDaftar" type="submit" value="Daftar" class="btn btn-sm btn-primary form-control"/>
                        </td>
                    </tr>
                </table>
                </form>

            </div>
        </div>
    </div>
    
</body>

</html>
EOT
