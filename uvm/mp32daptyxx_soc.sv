/**
 * @file    mp32daptyxx_soc.sv
 * @author  CIP Application Team
 # @brief   mp32daptyxx soc struct  File.
 # @version 0.1 
 # @date    24-01-19

 *
 ******************************************************************************
 * @copyright
 *
 *  <h2><center>&copy; Copyright (c)2024 CIP United Co.

 * All rights reserved.</center></h2>
 *
 * 
 *
 ******************************************************************************

*/

`ifndef MP32DAPTYXX_SOC
`define MP32DAPTYXX_SOC

`include "CRU.sv"
`include "UART.sv"

import uvm_pkg::*;

class ral_sys_soc extends uvm_reg_block;
    uvm_reg_map D2;
    uvm_reg_map D1;
    rand ral_block_CRU D2_CRU;
    rand ral_block_DW_apb_uart D2_UART[3];
    rand ral_block_DW_apb_uart D1_UART[3];
    function new(string name = "soc");
        super.new(name);
    endfunction: new

    function void build();
        this.D2 = create_map("D2", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.default_map = this.D2;
        this.D1 = create_map("D1", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.D2_CRU = ral_block_CRU::type_id::create("CRU",,get_full_name());
        this.D2_CRU.configure(this, "U0_CRU");
        this.D2_CRU.build();
        this.D2.add_submap(this.D2_CRU.default_map, `UVM_REG_ADDR_WIDTH'h82D00000);
        this.D2_UART[0] = ral_block_DW_apb_uart::type_id::create("UART0",,get_full_name());
        this.D2_UART[0].configure(this, "asic_top.u_logic_core.u_ao_subsys.u_uart0");
        this.D2_UART[0].build();
        this.D2.add_submap(this.D2_UART[0].default_map, `UVM_REG_ADDR_WIDTH'h82D04000);
        this.D2_UART[1] = ral_block_DW_apb_uart::type_id::create("UART1",,get_full_name());
        this.D2_UART[1].configure(this, "asic_top.u_logic_core.u_ahb_subsys.u_uart0");
        this.D2_UART[1].build();
        this.D2.add_submap(this.D2_UART[1].default_map, `UVM_REG_ADDR_WIDTH'h97D01000);
        this.D2_UART[2] = ral_block_DW_apb_uart::type_id::create("UART2",,get_full_name());
        this.D2_UART[2].configure(this, "asic_top.u_logic_core.u_ahb_subsys.u_uart1");
        this.D2_UART[2].build();
        this.D2.add_submap(this.D2_UART[2].default_map, `UVM_REG_ADDR_WIDTH'h97D00000);
        this.D1_UART[0] = ral_block_DW_apb_uart::type_id::create("UART0",,get_full_name());
        this.D1_UART[0].configure(this, "asic_top.u_logic_core.u_ao_subsys.u_uart0");
        this.D1_UART[0].build();
        this.D1.add_submap(this.D1_UART[0].default_map, `UVM_REG_ADDR_WIDTH'hB1D04000);
        this.D1_UART[1] = ral_block_DW_apb_uart::type_id::create("UART1",,get_full_name());
        this.D1_UART[1].configure(this, "asic_top.u_logic_core.u_ao_subsys.u_uart0");
        this.D1_UART[1].build();
        this.D1.add_submap(this.D1_UART[1].default_map, `UVM_REG_ADDR_WIDTH'hB3D01000);
        this.D1_UART[2] = ral_block_DW_apb_uart::type_id::create("UART2",,get_full_name());
        this.D1_UART[2].configure(this, "asic_top.u_logic_core.u_ao_subsys.u_uart0");
        this.D1_UART[2].build();
        this.D1.add_submap(this.D1_UART[2].default_map, `UVM_REG_ADDR_WIDTH'hB3D00000);

        uvm_config_db #(uvm_reg_block)::set(null,"","RegisterModel_Debug",this);
    endfunction : build

    `uvm_object_utils(ral_sys_soc)
endclass : ral_sys_soc

`endif
