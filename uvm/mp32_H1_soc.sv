/**
 * @file    mp32_H1_soc.sv
 * @author  CIP Application Team
 # @brief   mp32_H1 soc struct  File.
 # @version 0.1 
 # @date    24-04-09

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

`ifndef MP32_H1_SOC
`define MP32_H1_SOC

`include "wdt.sv"
`include "dma.sv"

import uvm_pkg::*;

class ral_sys_soc extends uvm_reg_block;
    uvm_reg_map H1;
    rand ral_block_ H1_WDT;
    rand ral_block_ H1_DMA[2];
    function new(string name = "soc");
        super.new(name);
    endfunction: new

    function void build();
        this.H1 = create_map("H1", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.default_map = this.H1;
        this.H1_WDT = ral_block_::type_id::create("H1_WDT",,get_full_name());
        this.H1_WDT.configure(this, "");
        this.H1_WDT.build();
        this.H1.add_submap(this.H1_WDT.default_map, `UVM_REG_ADDR_WIDTH'h1F800800);
        this.H1_DMA[0] = ral_block_::type_id::create("H1_DMA0",,get_full_name());
        this.H1_DMA[0].configure(this, "");
        this.H1_DMA[0].build();
        this.H1.add_submap(this.H1_DMA[0].default_map, `UVM_REG_ADDR_WIDTH'h1F812000);
        this.H1_DMA[1] = ral_block_::type_id::create("H1_DMA1",,get_full_name());
        this.H1_DMA[1].configure(this, "");
        this.H1_DMA[1].build();
        this.H1.add_submap(this.H1_DMA[1].default_map, `UVM_REG_ADDR_WIDTH'h1F814000);

        uvm_config_db #(uvm_reg_block)::set(null,"","RegisterModel_Debug",this);
    endfunction : build

    `uvm_object_utils(ral_sys_soc)
endclass : ral_sys_soc

`endif
