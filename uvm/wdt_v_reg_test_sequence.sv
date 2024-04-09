/**
 * @file    wdt_v_reg_test_sequence.sv
 * @author  CIP Application Team
 # @brief   wdt sequence UVM test .
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

`define SYSTEMDOMAIN_H1

class wdt_v_reg_test_sequence extends cip_base_sequence;

    `uvm_object_utils(wdt_v_reg_test_sequence)

    function new(string name="wdt_v_reg_test_sequence");
        super.new(name);
    endfunction

    virtual task body();
        super.body;

`ifdef SYSTEMDOMAIN_H1
        uvm_reg_hw_reset_seq     H1_reg_rst_seq;
        `uvm_info("UVM_SEQ","register reset sequence started",UVM_LOW)
        H1_reg_rst_seq = new();
        H1_reg_rst_seq.model = p_sequencer.u_soc_reg_model.H1_WDT;
        H1_reg_rst_seq.start(p_sequencer);
        `uvm_info("UVM_SEQ","register reset sequence finished",UVM_LOW)

`endif //SYSTEMDOMAIN_H1

    endtask: body

endclass:wdt_v_reg_test_sequence
