/**
 * @file    uart_v_reg_test_sequence.sv
 * @author  CIP Application Team
 # @brief   uart sequence UVM test .
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
//`define SYSTEMDOMAIN_D1

class uart_v_reg_test_sequence extends cip_base_sequence;

    `uvm_object_utils(uart_v_reg_test_sequence)

    function new(string name="uart_v_reg_test_sequence");
        super.new(name);
    endfunction

    virtual task body();
        super.body;

`ifdef SYSTEMDOMAIN_D2
        uvm_reg_hw_reset_seq     D2_reg_rst_seq;
        uvm_reg_access_seq       D2_reg_access_seq;

        `uvm_info("UVM_SEQ","register reset sequence started",UVM_LOW)
        D2_reg_rst_seq = new();
        for (int n=0; n< 3; n++) begin
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].THR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].FCR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].STHR[i].get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            end

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].RFW.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);

            D2_reg_rst_seq.model = p_sequencer.u_soc_reg_model.D2_UART[n];
            D2_reg_rst_seq.start(p_sequencer);
        end

        `uvm_info("UVM_SEQ","register reset sequence finished",UVM_LOW)

        `uvm_info("UVM_SEQ","register access sequence started",UVM_LOW)
        D2_reg_access_seq = new();
        for (int n=0; n< 3; n++) begin
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].THR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].FCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].LCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].MCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].LSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].MSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SRBR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].STHR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].FAR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].TFR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].RFW.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].USR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].TFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].RFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRTS.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SBCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SDMAM.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SFE.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRT.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.STET.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].HTX.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].DMASA.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].DLF.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].CPR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].UCV.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].CTR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);

            D2_reg_access_seq.model = p_sequencer.u_soc_reg_model.D2_UART[n];
            D2_reg_access_seq.start(p_sequencer);
        end

        `uvm_info("UVM_SEQ","register access sequence finished",UVM_LOW)
`endif //SYSTEMDOMAIN_D2

`ifdef SYSTEMDOMAIN_D1
        uvm_reg_hw_reset_seq     D1_reg_rst_seq;
        uvm_reg_access_seq       D1_reg_access_seq;

        `uvm_info("UVM_SEQ","register reset sequence started",UVM_LOW)
        D1_reg_rst_seq = new();
        for (int n=0; n< 3; n++) begin
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].THR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].FCR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].STHR[i].get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            end

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].RFW.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SRR.get_full_name()},"NO_REG_HW_RESET_TEST",1,this);

            D1_reg_rst_seq.model = p_sequencer.u_soc_reg_model.D1_UART[n];
            D1_reg_rst_seq.start(p_sequencer);
        end

        `uvm_info("UVM_SEQ","register reset sequence finished",UVM_LOW)

        `uvm_info("UVM_SEQ","register access sequence started",UVM_LOW)
        D1_reg_access_seq = new();
        for (int n=0; n< 3; n++) begin
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].THR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].FCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].LCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].MCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].LSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].MSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SRBR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].STHR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].FAR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].TFR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].RFW.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].USR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].TFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].RFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRTS.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SBCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SDMAM.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SFE.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.SRT.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].SHADOW.STET.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].HTX.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].DMASA.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].DLF.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].CPR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].UCV.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D2_UART[n].CTR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].THR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].FCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].LCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].MCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].LSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].MSR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SRBR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            for (int i=0; i< 8; i++) begin
                uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].STHR[i].get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            end

            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].FAR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].TFR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].RFW.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].USR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].TFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].RFL.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SRR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SRTS.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SBCR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SDMAM.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SFE.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.SRT.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].SHADOW.STET.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].HTX.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].DMASA.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].DLF.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].CPR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].UCV.get_full_name()},"NO_REG_ACCESS_TEST",1,this);
            uvm_resource_db#(bit)::set({"REG::",p_sequencer.u_soc_reg_model.D1_UART[n].CTR.get_full_name()},"NO_REG_ACCESS_TEST",1,this);

            D1_reg_access_seq.model = p_sequencer.u_soc_reg_model.D1_UART[n];
            D1_reg_access_seq.start(p_sequencer);
        end

        `uvm_info("UVM_SEQ","register access sequence finished",UVM_LOW)
`endif //SYSTEMDOMAIN_D1

    endtask: body

endclass:uart_v_reg_test_sequence
