
$search = $args[0] -replace ' ', '+'

$url = 'https://api-pddikti.kemdiktisaintek.go.id/pencarian/mhs/'
$ref = 'https://pddikti.kemdiktisaintek.go.id/'
$ori = 'https://pddikti.kemdiktisaintek.go.id'

$ip = $(iwr https://api.ipify.org/).Content

iwr -Uri $url -Method Options -Headers @{'Referer'= $ref; 'Origin'=$ori } | Out-Null
$result = irm -Uri "$url$search" -Method Get -ContentType 'application/json' -Headers @{'Referer'= $ref; 'X-User-IP'=$ip; 'Origin'=$ori }

$result | %{ $_; "`e[A`e[2Khttps://pddikti.kemdiktisaintek.go.id/detail-mahasiswa/$($_.id)`n" }



