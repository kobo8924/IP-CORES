#!/bin/sh

PRJ_NAME=sample2
TOP_NAME=ff_para_tb
WORK_DIR=work

# Modelsim UImode argument(CUI(-c) or GUI(-g))
MODE=$1

# Create work directory
if [ ! -d $WORK_DIR ]; then
    vlib $WORK_DIR
    vmap $PRJ_NAME "./$WORK_DIR"
fi

# Compile
vlog  -work $PRJ_NAME -sv -incr ff_para.sv ff_para_tb.sv

#COMENTOUT
# Run modelsim
# Select Modelsim UImode(-c or -g).
if [ $MODE = -c ]; then
    echo "=====  CUI MODE ====="
    vsim $TOP_NAME -c -lib $PRJ_NAME -do "run -all;quit"
else
    echo "=====  GUI MODE ====="
    vsim  $TOP_NAME -lib $PRJ_NAME -do "add wave -position insertpoint sim:/$TOP_NAME/*"
fi
#COMENTOUT

