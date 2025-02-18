
$search = $args[0] -replace ' ', '+'
#$search

$url = 'https://api-pddikti.kemdiktisaintek.go.id/pencarian/mhs/'
$ref = 'https://pddikti.kemdiktisaintek.go.id/'
$ori = 'https://pddikti.kemdiktisaintek.go.id'

$ip = $(irm https://api.ipify.org/?format=json).ip

$a = iwr -Uri $url -Method Options -Headers @{'Referer'= $ref; 'Origin'=$ori }
$b = irm -Uri "$url$search" -Method Get -ContentType 'application/json' -Headers @{'Referer'= $ref; 'X-User-IP'=$ip; 'Origin'=$ori }


#$b = iwr -Uri "$url$search" -Method Get -ContentType 'application/json' -Headers @{'Referer'= $ref; 'X-User-IP'=$ip; 'Origin'=$ori }

$b



