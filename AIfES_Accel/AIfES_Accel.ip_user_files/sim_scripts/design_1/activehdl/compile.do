transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_23
vlib activehdl/processing_system7_vip_v1_0_25
vlib activehdl/xil_defaultlib
vlib activehdl/axi_datamover_v5_1_38
vlib activehdl/axi_sg_v4_1_21
vlib activehdl/axi_dma_v7_1_38
vlib activehdl/smartconnect_v1_0
vlib activehdl/proc_sys_reset_v5_0_17
vlib activehdl/axi_register_slice_v2_1_37
vlib activehdl/xbip_utils_v3_0_16
vlib activehdl/axi_utils_v2_0_12
vlib activehdl/xbip_pipe_v3_0_12
vlib activehdl/xbip_dsp48_wrapper_v3_0_7
vlib activehdl/mult_gen_v12_0_25
vlib activehdl/floating_point_v7_1_22
vlib activehdl/generic_baseblocks_v2_1_2
vlib activehdl/fifo_generator_v13_2_15
vlib activehdl/axi_data_fifo_v2_1_37
vlib activehdl/axi_protocol_converter_v2_1_38

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 activehdl/axi_vip_v1_1_23
vmap processing_system7_vip_v1_0_25 activehdl/processing_system7_vip_v1_0_25
vmap xil_defaultlib activehdl/xil_defaultlib
vmap axi_datamover_v5_1_38 activehdl/axi_datamover_v5_1_38
vmap axi_sg_v4_1_21 activehdl/axi_sg_v4_1_21
vmap axi_dma_v7_1_38 activehdl/axi_dma_v7_1_38
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap proc_sys_reset_v5_0_17 activehdl/proc_sys_reset_v5_0_17
vmap axi_register_slice_v2_1_37 activehdl/axi_register_slice_v2_1_37
vmap xbip_utils_v3_0_16 activehdl/xbip_utils_v3_0_16
vmap axi_utils_v2_0_12 activehdl/axi_utils_v2_0_12
vmap xbip_pipe_v3_0_12 activehdl/xbip_pipe_v3_0_12
vmap xbip_dsp48_wrapper_v3_0_7 activehdl/xbip_dsp48_wrapper_v3_0_7
vmap mult_gen_v12_0_25 activehdl/mult_gen_v12_0_25
vmap floating_point_v7_1_22 activehdl/floating_point_v7_1_22
vmap generic_baseblocks_v2_1_2 activehdl/generic_baseblocks_v2_1_2
vmap fifo_generator_v13_2_15 activehdl/fifo_generator_v13_2_15
vmap axi_data_fifo_v2_1_37 activehdl/axi_data_fifo_v2_1_37
vmap axi_protocol_converter_v2_1_38 activehdl/axi_protocol_converter_v2_1_38

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/AMDDesignTools/2026.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_25  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work axi_datamover_v5_1_38 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/0f0c/hdl/axi_datamover_v5_1_rfs.vhd" \

vcom -work axi_sg_v4_1_21 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/b193/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_38 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/5b02/hdl/axi_dma_v7_1_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_axi_dma_0_0/sim/design_1_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/sim/bd_afc3.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \

vcom -work proc_sys_reset_v5_0_17 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/9438/hdl/proc_sys_reset_v5_0_rfs.vhd" \

vcom -work smartconnect_v1_0 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/21d5/hdl/sc_ultralite_v1_0_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ip/design_1_axi_smc_0/bd_0/ip/ip_0/sim/bd_afc3_sc_ul_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/3d9a/hdl/sc_mmu_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/7785/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/3051/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/sc_node_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/0848/hdl/sc_switchboard_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/852f/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/fca9/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/c7d2/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work axi_register_slice_v2_1_37  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/8c55/hdl/axi_register_slice_v2_1_rfs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ip/design_1_axi_smc_0/sim/design_1_axi_smc_0.sv" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_rst_ps7_0_100M_0/sim/design_1_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/sim/design_1.v" \

vcom -work xbip_utils_v3_0_16 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/xbip_utils_v3_0_rfs.vhd" \

vcom -work axi_utils_v2_0_12 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_12 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/xbip_pipe_v3_0_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_25 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/mult_gen_v12_0_rfs.vhd" \

vcom -work floating_point_v7_1_22 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/hdl/floating_point_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_acc/sim/fp_acc.vhd" \
"../../../bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/src/fp_mul/sim/fp_mul.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ipshared/51e7/src/MAC_Dense_Layer.v" \
"../../../bd/design_1/ip/design_1_MAC_Dense_Layer_0_0/sim/design_1_MAC_Dense_Layer_0_0.v" \

vlog -work generic_baseblocks_v2_1_2  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/0c28/hdl/generic_baseblocks_v2_1_rfs.v" \

vlog -work fifo_generator_v13_2_15  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/084a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_15 -93  \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/084a/hdl/fifo_generator_v13_2_vh_sim_rfs.vhd" \

vlog -work fifo_generator_v13_2_15  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/084a/hdl/fifo_generator_v13_2_vl_sim_rfs.v" \

vlog -work axi_data_fifo_v2_1_37  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/a62a/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_38  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/b706/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/f0b6/hdl/verilog" "+incdir+../../../../AIfES_Accel.gen/sources_1/bd/design_1/ipshared/00fe/hdl/verilog" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" -l xilinx_vip -l xpm -l axi_infrastructure_v1_1_0 -l axi_vip_v1_1_23 -l processing_system7_vip_v1_0_25 -l xil_defaultlib -l axi_datamover_v5_1_38 -l axi_sg_v4_1_21 -l axi_dma_v7_1_38 -l smartconnect_v1_0 -l proc_sys_reset_v5_0_17 -l axi_register_slice_v2_1_37 -l xbip_utils_v3_0_16 -l axi_utils_v2_0_12 -l xbip_pipe_v3_0_12 -l xbip_dsp48_wrapper_v3_0_7 -l mult_gen_v12_0_25 -l floating_point_v7_1_22 -l generic_baseblocks_v2_1_2 -l fifo_generator_v13_2_15 -l axi_data_fifo_v2_1_37 -l axi_protocol_converter_v2_1_38 \
"../../../bd/design_1/ip/design_1_axi_mem_intercon_imp_auto_pc_0/sim/design_1_axi_mem_intercon_imp_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

