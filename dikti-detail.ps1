
$id = $args[0]

$url = 'https://api-pddikti.kemdiktisaintek.go.id/detail/mhs/'
$ref = 'https://pddikti.kemdiktisaintek.go.id/'
$ori = 'https://pddikti.kemdiktisaintek.go.id'

$ip = $(iwr https://api.ipify.org/).Content

iwr -Uri "$url$id" -Method Options -Headers @{'Referer'= $ref; 'Origin'=$ori } | Out-Null
irm -Uri "$url$id" -Method Get -ContentType 'application/json' -Headers @{'Referer'= $ref; 'X-User-IP'=$ip; 'Origin'=$ori }

"https://pddikti.kemdiktisaintek.go.id/detail-mahasiswa/$id"
''


