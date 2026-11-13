vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_23
vlib questa_lib/msim/processing_system7_vip_v1_0_25
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_23 questa_lib/msim/axi_vip_v1_1_23
vmap processing_system7_vip_v1_0_25 questa_lib/msim/processing_system7_vip_v1_0_25
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L processing_system7_vip_v1_0_25 -L xilinx_vip "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_23  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L processing_system7_vip_v1_0_25 -L xilinx_vip "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/4d28/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_25  -incr -mfcu  -sv -L axi_vip_v1_1_23 -L processing_system7_vip_v1_0_25 -L xilinx_vip "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" \
"../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/df05/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../AIFES_1.gen/sources_1/bd/design_1/ipshared/df05/hdl" "+incdir+../../../../../../../../../AMDDesignTools/2026.1/Vivado/data/rsb/busdef" "+incdir+C:/AMDDesignTools/2026.1/Vivado/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

