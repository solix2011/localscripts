set $i=0
while ($i < 44)
	set $x = reg[$i]
	p/x $x
	set $i = $i + 1
end
