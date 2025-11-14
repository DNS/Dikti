
$search = $args[0] -replace ' ', '+'

$url = 'https://api-pddikti.kemdiktisaintek.go.id/pencarian/mhs/'
$ref = 'https://pddikti.kemdiktisaintek.go.id/'
$ori = 'https://pddikti.kemdiktisaintek.go.id'

$ip = $(iwr https://api.ipify.org/).Content


$header = @{
	'Referer' = $ref;
	'Origin' = $ori;
	'Sec-Fetch-Dest' = 'empty';
	'Sec-Fetch-Mode' = 'cors';
	'X-User-IP' = $ip;
}

iwr -Uri $url -Method Options -Headers $header | Out-Null

$result = irm -Uri "$url$search" -Method Get -ContentType 'application/json' -Headers $header

$result | %{ $_; "`e[A`e[2Khttps://pddikti.kemdiktisaintek.go.id/detail-mahasiswa/$($_.id)`n" }

