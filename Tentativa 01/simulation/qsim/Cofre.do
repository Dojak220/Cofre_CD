onerror {quit -f}
vlib work
vlog -work work Cofre.vo
vlog -work work Cofre.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Cofre_vlg_vec_tst
vcd file -direction Cofre.msim.vcd
vcd add -internal Cofre_vlg_vec_tst/*
vcd add -internal Cofre_vlg_vec_tst/i1/*
add wave /*
run -all
