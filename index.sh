#!/bin/bash
echo "Content-type: text/html"
echo ""
cat <<EOT
<!DOCTYPE html>
<html>
<head>
        <title>Daftar nasihosting</title>
</head>
<body>
        <p>Silahkan masukkan nama subdomain dan password, password yang dimasukkan hanya mendukung huruf dan angka</p>
        <form action="run.sh" method="get">
                <label>Nama Sub domain</label>
                <input type="text" name="name">@nasihosting.com
                <br>
                <label>Password</label>
                <input type="password" name="password">
                <br>
                <button type="submit">OK</button>
        </form>
</body>
</html>
EOT
