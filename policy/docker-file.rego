package main

denyuser = ["root"]

deny[msg] {
	input[i].Cmd == "user"
	val := input[i].Value
	contains(lower(val[_]), denyuser[_])

	msg = sprintf("Running as %s is not recomended", [val])
}

denylist = [
	"curl",
	"wget",
]

deny[msg] {
	input[i].Cmd == "run"
	val := input[i].Value
	contains(lower(val[_]), denylist[_])

	msg = sprintf("Running  %s is prevented in order to prevent the supply chain attack", [val])
}