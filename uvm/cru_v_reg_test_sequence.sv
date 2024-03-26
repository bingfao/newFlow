/**
 * @file    cru_v_reg_test_sequence.sv
 * @author  CIP Application Team
 # @brief   cru sequence UVM test .
 # @version 0.1 
 # @date    24-03-21

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

`define SYSTEMDOMAIN_D2

class cru_v_reg_test_sequence extends cip_base_sequence;

    `uvm_object_utils(cru_v_reg_test_sequence)

    function new(string name="cru_v_reg_test_sequence");
        super.new(name);
    endfunction

    virtual task body();
        super.body;

`ifdef SYSTEMDOMAIN_D2
        uvm_reg_hw_reset_seq     D2_reg_rst_seq;
        `uvm_info("UVM_SEQ","register reset sequence started",UVM_LOW)
        D2_reg_rst_seq = new();
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.SSCRSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.SSWRSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.D1RSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.D2RSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.C1RSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
        uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_CRU.C2RSTR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);

        D2_reg_rst_seq.model = p_sequencer.u_soc_reg_model.D2_CRU;
        D2_reg_rst_seq.start(p_sequencer);
        `uvm_info("UVM_SEQ","register reset sequence finished",UVM_LOW)

`endif //SYSTEMDOMAIN_D2

    endtask: body

endclass:cru_v_reg_test_sequence
