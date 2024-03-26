`ifndef RAL_SOC
`define RAL_SOC

`include "uart.sv"


import uvm_pkg::*;




class ral_sys_soc extends uvm_reg_block;
   uvm_reg_map AHB;
   uvm_reg_map AXI;

   rand ral_block_DW_apb_uart UART[3];


	function new(string name = "soc");
		super.new(name);
	endfunction: new

	function void build();
      this.AHB = create_map("AHB", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.default_map = this.AHB;
      this.AXI = create_map("AXI", 0, 4, UVM_LITTLE_ENDIAN, 0);
      this.UART[0] = ral_block_DW_apb_uart::type_id::create("UART0",,get_full_name());
      this.UART[0].configure(this, "u_logic_core.u_ao_subsys.u_uart0");
      this.UART[0].build();
      this.AHB.add_submap(this.UART[0].default_map, `UVM_REG_ADDR_WIDTH'h2D0B000);
      this.UART[1] = ral_block_DW_apb_uart::type_id::create("UART1",,get_full_name());
      this.UART[1].configure(this, "u_logic_core.u_ahb_subsys.u_uart0");
      this.UART[1].build();
      this.AHB.add_submap(this.UART[1].default_map, `UVM_REG_ADDR_WIDTH'h17D01000);
      this.UART[2] = ral_block_DW_apb_uart::type_id::create("UART2",,get_full_name());
      this.UART[2].configure(this, "u_logic_core.u_ahb_subsys.u_uart1");
      this.UART[2].build();
      this.AHB.add_submap(this.UART[2].default_map, `UVM_REG_ADDR_WIDTH'h17D00000);

	  uvm_config_db #(uvm_reg_block)::set(null,"","RegisterModel_Debug",this);
	endfunction : build

	`uvm_object_utils(ral_sys_soc)
endclass : ral_sys_soc

`endif