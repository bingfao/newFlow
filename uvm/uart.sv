/**
 * @file    uart.sv
 * @author  CIP Application Team
 # @brief   UART Register struct Header File.
 *          This file contains:
 #           - Data structures and the address mapping for
 *             UART peripherals
 #           - Including peripheral's registers declarations and bits
 *             definition
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

`ifndef RAL_MOD_UART
`define RAL_MOD_UART

import uvm_pkg::*;


class ral_reg_DW_apb_uart_RBR extends uvm_reg;
    uvm_reg_field RBR;
    constraint RBR_cst_RBR {
    }
    function new(string name = "DW_apb_uart_RBR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.RBR = uvm_reg_field::type_id::create("RBR",,get_full_name());
        this.RBR.configure(this, 8, 0, "RO", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_RBR)

endclass : ral_reg_DW_apb_uart_RBR

class ral_reg_DW_apb_uart_DLL extends uvm_reg;
    rand uvm_reg_field DLL;
    constraint DLL_cst_DLL {
        DLL.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_DLL");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DLL = uvm_reg_field::type_id::create("DLL",,get_full_name());
        this.DLL.configure(this, 8, 0, "RW", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_DLL)

endclass : ral_reg_DW_apb_uart_DLL

class ral_reg_DW_apb_uart_THR extends uvm_reg;
    rand uvm_reg_field THR;
    constraint THR_cst_THR {
        THR.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_THR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.THR = uvm_reg_field::type_id::create("THR",,get_full_name());
        this.THR.configure(this, 8, 0, "WO", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_THR)

endclass : ral_reg_DW_apb_uart_THR

class ral_reg_DW_apb_uart_IER extends uvm_reg;
    rand uvm_reg_field ERBFI;
    rand uvm_reg_field ETBEI;
    rand uvm_reg_field ELSI;
    rand uvm_reg_field EMSI;
    rand uvm_reg_field PTIME;
    constraint IER_cst_ERBFI {
        ERBFI.value == 'h1;
    }
    constraint IER_cst_ETBEI {
        ETBEI.value == 'h1;
    }
    constraint IER_cst_ELSI {
        ELSI.value == 'h1;
    }
    constraint IER_cst_EMSI {
        EMSI.value == 'h1;
    }
    constraint IER_cst_PTIME {
        PTIME.value == 'h1;
    }
    function new(string name = "DW_apb_uart_IER");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.ERBFI = uvm_reg_field::type_id::create("ERBFI",,get_full_name());
        this.ERBFI.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.ETBEI = uvm_reg_field::type_id::create("ETBEI",,get_full_name());
        this.ETBEI.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
        this.ELSI = uvm_reg_field::type_id::create("ELSI",,get_full_name());
        this.ELSI.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.EMSI = uvm_reg_field::type_id::create("EMSI",,get_full_name());
        this.EMSI.configure(this, 1, 3, "RW", 0, 1'h0, 1, 1, 0);
        this.PTIME = uvm_reg_field::type_id::create("PTIME",,get_full_name());
        this.PTIME.configure(this, 1, 7, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_IER)

endclass : ral_reg_DW_apb_uart_IER

class ral_reg_DW_apb_uart_DLH extends uvm_reg;
    rand uvm_reg_field DLH;
    constraint DLH_cst_DLH {
        DLH.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_DLH");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DLH = uvm_reg_field::type_id::create("DLH",,get_full_name());
        this.DLH.configure(this, 8, 0, "RW", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_DLH)

endclass : ral_reg_DW_apb_uart_DLH

class ral_reg_DW_apb_uart_IIR extends uvm_reg;
    uvm_reg_field IID;
    uvm_reg_field FIFOE;
    constraint IIR_cst_IID {
        IID.value inside {'h1,'h2,'h4,'h6,'h7,'hC};
    }
    constraint IIR_cst_FIFOE {
        FIFOE.value == 'h3;
    }
    function new(string name = "DW_apb_uart_IIR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.IID = uvm_reg_field::type_id::create("IID",,get_full_name());
        this.IID.configure(this, 4, 0, "RO", 0, 4'h1, 1, 1, 0);
        this.FIFOE = uvm_reg_field::type_id::create("FIFOE",,get_full_name());
        this.FIFOE.configure(this, 2, 6, "RO", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_IIR)

endclass : ral_reg_DW_apb_uart_IIR

class ral_reg_DW_apb_uart_FCR extends uvm_reg;
    rand uvm_reg_field FIFOE;
    rand uvm_reg_field RFR;
    rand uvm_reg_field TFR;
    rand uvm_reg_field DMAM;
    rand uvm_reg_field TET;
    rand uvm_reg_field RT;
    constraint FCR_cst_FIFOE {
        FIFOE.value == 'h1;
    }
    constraint FCR_cst_RFR {
    }
    constraint FCR_cst_TFR {
    }
    constraint FCR_cst_DMAM {
        DMAM.value == 'h1;
    }
    constraint FCR_cst_TET {
        TET.value inside {'h1,'h2,'h3};
    }
    constraint FCR_cst_RT {
        RT.value inside {'h1,'h2,'h3};
    }
    function new(string name = "DW_apb_uart_FCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.FIFOE = uvm_reg_field::type_id::create("FIFOE",,get_full_name());
        this.FIFOE.configure(this, 1, 0, "WO", 0, 1'h0, 1, 1, 0);
        this.RFR = uvm_reg_field::type_id::create("RFR",,get_full_name());
        this.RFR.configure(this, 1, 1, "WO", 0, 1'h0, 1, 1, 0);
        this.TFR = uvm_reg_field::type_id::create("TFR",,get_full_name());
        this.TFR.configure(this, 1, 2, "WO", 0, 1'h0, 1, 1, 0);
        this.DMAM = uvm_reg_field::type_id::create("DMAM",,get_full_name());
        this.DMAM.configure(this, 1, 3, "WO", 0, 1'h0, 1, 1, 0);
        this.TET = uvm_reg_field::type_id::create("TET",,get_full_name());
        this.TET.configure(this, 2, 4, "WO", 0, 2'h0, 1, 1, 0);
        this.RT = uvm_reg_field::type_id::create("RT",,get_full_name());
        this.RT.configure(this, 2, 6, "WO", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_FCR)

endclass : ral_reg_DW_apb_uart_FCR

class ral_reg_DW_apb_uart_LCR extends uvm_reg;
    rand uvm_reg_field DLS;
    rand uvm_reg_field STOP;
    rand uvm_reg_field PEN;
    rand uvm_reg_field EPS;
    rand uvm_reg_field SP;
    rand uvm_reg_field BC;
    rand uvm_reg_field DLAB;
    constraint LCR_cst_DLS {
        DLS.value inside {'h1,'h2,'h3};
    }
    constraint LCR_cst_STOP {
        STOP.value == 'h1;
    }
    constraint LCR_cst_PEN {
        PEN.value == 'h1;
    }
    constraint LCR_cst_EPS {
        EPS.value == 'h1;
    }
    constraint LCR_cst_SP {
        SP.value == 'h1;
    }
    constraint LCR_cst_BC {
        BC.value == 'h1;
    }
    constraint LCR_cst_DLAB {
        DLAB.value == 'h1;
    }
    function new(string name = "DW_apb_uart_LCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DLS = uvm_reg_field::type_id::create("DLS",,get_full_name());
        this.DLS.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.STOP = uvm_reg_field::type_id::create("STOP",,get_full_name());
        this.STOP.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.PEN = uvm_reg_field::type_id::create("PEN",,get_full_name());
        this.PEN.configure(this, 1, 3, "RW", 0, 1'h0, 1, 1, 0);
        this.EPS = uvm_reg_field::type_id::create("EPS",,get_full_name());
        this.EPS.configure(this, 1, 4, "RW", 0, 1'h0, 1, 1, 0);
        this.SP = uvm_reg_field::type_id::create("SP",,get_full_name());
        this.SP.configure(this, 1, 5, "RW", 0, 1'h0, 1, 1, 0);
        this.BC = uvm_reg_field::type_id::create("BC",,get_full_name());
        this.BC.configure(this, 1, 6, "RW", 0, 1'h0, 1, 1, 0);
        this.DLAB = uvm_reg_field::type_id::create("DLAB",,get_full_name());
        this.DLAB.configure(this, 1, 7, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_LCR)

endclass : ral_reg_DW_apb_uart_LCR

class ral_reg_DW_apb_uart_MCR extends uvm_reg;
    rand uvm_reg_field DTR;
    rand uvm_reg_field RTS;
    rand uvm_reg_field OUT1;
    rand uvm_reg_field OUT2;
    rand uvm_reg_field LPBCK;
    rand uvm_reg_field AFCE;
    rand uvm_reg_field SIRE;
    constraint MCR_cst_DTR {
        DTR.value == 'h1;
    }
    constraint MCR_cst_RTS {
        RTS.value == 'h1;
    }
    constraint MCR_cst_OUT1 {
        OUT1.value == 'h1;
    }
    constraint MCR_cst_OUT2 {
        OUT2.value == 'h1;
    }
    constraint MCR_cst_LPBCK {
        LPBCK.value == 'h1;
    }
    constraint MCR_cst_AFCE {
        AFCE.value == 'h1;
    }
    constraint MCR_cst_SIRE {
        SIRE.value == 'h1;
    }
    function new(string name = "DW_apb_uart_MCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DTR = uvm_reg_field::type_id::create("DTR",,get_full_name());
        this.DTR.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.RTS = uvm_reg_field::type_id::create("RTS",,get_full_name());
        this.RTS.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
        this.OUT1 = uvm_reg_field::type_id::create("OUT1",,get_full_name());
        this.OUT1.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.OUT2 = uvm_reg_field::type_id::create("OUT2",,get_full_name());
        this.OUT2.configure(this, 1, 3, "RW", 0, 1'h0, 1, 1, 0);
        this.LPBCK = uvm_reg_field::type_id::create("LPBCK",,get_full_name());
        this.LPBCK.configure(this, 1, 4, "RW", 0, 1'h0, 1, 1, 0);
        this.AFCE = uvm_reg_field::type_id::create("AFCE",,get_full_name());
        this.AFCE.configure(this, 1, 5, "RW", 0, 1'h0, 1, 1, 0);
        this.SIRE = uvm_reg_field::type_id::create("SIRE",,get_full_name());
        this.SIRE.configure(this, 1, 6, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_MCR)

endclass : ral_reg_DW_apb_uart_MCR

class ral_reg_DW_apb_uart_LSR extends uvm_reg;
    uvm_reg_field DR;
    uvm_reg_field OE;
    uvm_reg_field PE;
    uvm_reg_field FE;
    uvm_reg_field BI;
    uvm_reg_field THRE;
    uvm_reg_field TEMT;
    uvm_reg_field RFE;
    uvm_reg_field ADDR;
    constraint LSR_cst_DR {
    }
    constraint LSR_cst_OE {
    }
    constraint LSR_cst_PE {
    }
    constraint LSR_cst_FE {
    }
    constraint LSR_cst_BI {
    }
    constraint LSR_cst_THRE {
    }
    constraint LSR_cst_TEMT {
    }
    constraint LSR_cst_RFE {
    }
    constraint LSR_cst_ADDR {
    }
    function new(string name = "DW_apb_uart_LSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DR = uvm_reg_field::type_id::create("DR",,get_full_name());
        this.DR.configure(this, 1, 0, "RO", 0, 1'h0, 1, 1, 0);
        this.OE = uvm_reg_field::type_id::create("OE",,get_full_name());
        this.OE.configure(this, 1, 1, "RC", 0, 1'h0, 1, 1, 0);
        this.PE = uvm_reg_field::type_id::create("PE",,get_full_name());
        this.PE.configure(this, 1, 2, "RC", 0, 1'h0, 1, 1, 0);
        this.FE = uvm_reg_field::type_id::create("FE",,get_full_name());
        this.FE.configure(this, 1, 3, "RC", 0, 1'h0, 1, 1, 0);
        this.BI = uvm_reg_field::type_id::create("BI",,get_full_name());
        this.BI.configure(this, 1, 4, "RC", 0, 1'h0, 1, 1, 0);
        this.THRE = uvm_reg_field::type_id::create("THRE",,get_full_name());
        this.THRE.configure(this, 1, 5, "RO", 0, 1'h1, 1, 1, 0);
        this.TEMT = uvm_reg_field::type_id::create("TEMT",,get_full_name());
        this.TEMT.configure(this, 1, 6, "RO", 0, 1'h1, 1, 1, 0);
        this.RFE = uvm_reg_field::type_id::create("RFE",,get_full_name());
        this.RFE.configure(this, 1, 7, "RC", 0, 1'h0, 1, 1, 0);
        this.ADDR = uvm_reg_field::type_id::create("ADDR",,get_full_name());
        this.ADDR.configure(this, 1, 8, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_LSR)

endclass : ral_reg_DW_apb_uart_LSR

class ral_reg_DW_apb_uart_MSR extends uvm_reg;
    uvm_reg_field DCTS;
    uvm_reg_field DDSR;
    uvm_reg_field TERI;
    uvm_reg_field DDCD;
    uvm_reg_field CTS;
    uvm_reg_field DSR;
    uvm_reg_field RI;
    uvm_reg_field DCD;
    constraint MSR_cst_DCTS {
    }
    constraint MSR_cst_DDSR {
    }
    constraint MSR_cst_TERI {
    }
    constraint MSR_cst_DDCD {
    }
    constraint MSR_cst_CTS {
    }
    constraint MSR_cst_DSR {
    }
    constraint MSR_cst_RI {
    }
    constraint MSR_cst_DCD {
    }
    function new(string name = "DW_apb_uart_MSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DCTS = uvm_reg_field::type_id::create("DCTS",,get_full_name());
        this.DCTS.configure(this, 1, 0, "RC", 0, 1'h0, 1, 1, 0);
        this.DDSR = uvm_reg_field::type_id::create("DDSR",,get_full_name());
        this.DDSR.configure(this, 1, 1, "RC", 0, 1'h0, 1, 1, 0);
        this.TERI = uvm_reg_field::type_id::create("TERI",,get_full_name());
        this.TERI.configure(this, 1, 2, "RC", 0, 1'h0, 1, 1, 0);
        this.DDCD = uvm_reg_field::type_id::create("DDCD",,get_full_name());
        this.DDCD.configure(this, 1, 3, "RC", 0, 1'h0, 1, 1, 0);
        this.CTS = uvm_reg_field::type_id::create("CTS",,get_full_name());
        this.CTS.configure(this, 1, 4, "RO", 0, 1'h0, 1, 1, 0);
        this.DSR = uvm_reg_field::type_id::create("DSR",,get_full_name());
        this.DSR.configure(this, 1, 5, "RO", 0, 1'h0, 1, 1, 0);
        this.RI = uvm_reg_field::type_id::create("RI",,get_full_name());
        this.RI.configure(this, 1, 6, "RO", 0, 1'h0, 1, 1, 0);
        this.DCD = uvm_reg_field::type_id::create("DCD",,get_full_name());
        this.DCD.configure(this, 1, 7, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_MSR)

endclass : ral_reg_DW_apb_uart_MSR

class ral_reg_DW_apb_uart_SCR extends uvm_reg;
    rand uvm_reg_field SCR;
    constraint SCR_cst_SCR {
        SCR.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_SCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SCR = uvm_reg_field::type_id::create("SCR",,get_full_name());
        this.SCR.configure(this, 8, 0, "RW", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SCR)

endclass : ral_reg_DW_apb_uart_SCR

class ral_reg_DW_apb_uart_SRBR extends uvm_reg;
    uvm_reg_field SRBR;
    constraint SRBR_cst_SRBR {
        SRBR.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_SRBR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SRBR = uvm_reg_field::type_id::create("SRBR",,get_full_name());
        this.SRBR.configure(this, 8, 0, "RO", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SRBR)

endclass : ral_reg_DW_apb_uart_SRBR

class ral_reg_DW_apb_uart_STHR extends uvm_reg;
    rand uvm_reg_field STHR;
    constraint STHR_cst_STHR {
        STHR.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_STHR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.STHR = uvm_reg_field::type_id::create("STHR",,get_full_name());
        this.STHR.configure(this, 8, 0, "WO", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_STHR)

endclass : ral_reg_DW_apb_uart_STHR

class ral_reg_DW_apb_uart_FAR extends uvm_reg;
    rand uvm_reg_field FAR;
    constraint FAR_cst_FAR {
        FAR.value == 'h1;
    }
    function new(string name = "DW_apb_uart_FAR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.FAR = uvm_reg_field::type_id::create("FAR",,get_full_name());
        this.FAR.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_FAR)

endclass : ral_reg_DW_apb_uart_FAR

class ral_reg_DW_apb_uart_TFR extends uvm_reg;
    uvm_reg_field TFR;
    constraint TFR_cst_TFR {
        TFR.value inside { ['h00:'hFF] };
    }
    function new(string name = "DW_apb_uart_TFR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.TFR = uvm_reg_field::type_id::create("TFR",,get_full_name());
        this.TFR.configure(this, 8, 0, "RO", 0, 8'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_TFR)

endclass : ral_reg_DW_apb_uart_TFR

class ral_reg_DW_apb_uart_RFW extends uvm_reg;
    rand uvm_reg_field RFWD;
    rand uvm_reg_field RFPE;
    rand uvm_reg_field RFFE;
    constraint RFW_cst_RFWD {
        RFWD.value inside { ['h00:'hFF] };
    }
    constraint RFW_cst_RFPE {
        RFPE.value == 'h1;
    }
    constraint RFW_cst_RFFE {
        RFFE.value == 'h1;
    }
    function new(string name = "DW_apb_uart_RFW");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.RFWD = uvm_reg_field::type_id::create("RFWD",,get_full_name());
        this.RFWD.configure(this, 8, 0, "WO", 0, 8'h00, 1, 1, 0);
        this.RFPE = uvm_reg_field::type_id::create("RFPE",,get_full_name());
        this.RFPE.configure(this, 1, 8, "WO", 0, 1'h0, 1, 1, 0);
        this.RFFE = uvm_reg_field::type_id::create("RFFE",,get_full_name());
        this.RFFE.configure(this, 1, 9, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_RFW)

endclass : ral_reg_DW_apb_uart_RFW

class ral_reg_DW_apb_uart_USR extends uvm_reg;
    uvm_reg_field TFNF;
    uvm_reg_field TFE;
    uvm_reg_field RFNE;
    uvm_reg_field RFF;
    constraint USR_cst_TFNF {
    }
    constraint USR_cst_TFE {
    }
    constraint USR_cst_RFNE {
    }
    constraint USR_cst_RFF {
    }
    function new(string name = "DW_apb_uart_USR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.TFNF = uvm_reg_field::type_id::create("TFNF",,get_full_name());
        this.TFNF.configure(this, 1, 1, "RO", 0, 1'h1, 1, 1, 0);
        this.TFE = uvm_reg_field::type_id::create("TFE",,get_full_name());
        this.TFE.configure(this, 1, 2, "RO", 0, 1'h1, 1, 1, 0);
        this.RFNE = uvm_reg_field::type_id::create("RFNE",,get_full_name());
        this.RFNE.configure(this, 1, 3, "RO", 0, 1'h0, 1, 1, 0);
        this.RFF = uvm_reg_field::type_id::create("RFF",,get_full_name());
        this.RFF.configure(this, 1, 4, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_USR)

endclass : ral_reg_DW_apb_uart_USR

class ral_reg_DW_apb_uart_TFL extends uvm_reg;
    uvm_reg_field TFL;
    constraint TFL_cst_TFL {
        TFL.value inside { ['h00:'h1F] };
    }
    function new(string name = "DW_apb_uart_TFL");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.TFL = uvm_reg_field::type_id::create("TFL",,get_full_name());
        this.TFL.configure(this, 6, 0, "RO", 0, 6'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_TFL)

endclass : ral_reg_DW_apb_uart_TFL

class ral_reg_DW_apb_uart_RFL extends uvm_reg;
    uvm_reg_field RFL;
    constraint RFL_cst_RFL {
        RFL.value inside { ['h00:'h1F] };
    }
    function new(string name = "DW_apb_uart_RFL");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.RFL = uvm_reg_field::type_id::create("RFL",,get_full_name());
        this.RFL.configure(this, 6, 0, "RO", 0, 6'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_RFL)

endclass : ral_reg_DW_apb_uart_RFL

class ral_reg_DW_apb_uart_SRR extends uvm_reg;
    rand uvm_reg_field UR;
    rand uvm_reg_field RFR;
    rand uvm_reg_field XFR;
    constraint SRR_cst_UR {
    }
    constraint SRR_cst_RFR {
    }
    constraint SRR_cst_XFR {
    }
    function new(string name = "DW_apb_uart_SRR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UR = uvm_reg_field::type_id::create("UR",,get_full_name());
        this.UR.configure(this, 1, 0, "WO", 0, 1'h0, 1, 1, 0);
        this.RFR = uvm_reg_field::type_id::create("RFR",,get_full_name());
        this.RFR.configure(this, 1, 1, "WO", 0, 1'h0, 1, 1, 0);
        this.XFR = uvm_reg_field::type_id::create("XFR",,get_full_name());
        this.XFR.configure(this, 1, 2, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SRR)

endclass : ral_reg_DW_apb_uart_SRR

class ral_reg_DW_apb_uart_SRTS extends uvm_reg;
    rand uvm_reg_field SRTS;
    constraint SRTS_cst_SRTS {
        SRTS.value == 'h1;
    }
    function new(string name = "DW_apb_uart_SRTS");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SRTS = uvm_reg_field::type_id::create("SRTS",,get_full_name());
        this.SRTS.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SRTS)

endclass : ral_reg_DW_apb_uart_SRTS

class ral_reg_DW_apb_uart_SBCR extends uvm_reg;
    rand uvm_reg_field SBCB;
    constraint SBCR_cst_SBCB {
        SBCB.value == 'h1;
    }
    function new(string name = "DW_apb_uart_SBCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SBCB = uvm_reg_field::type_id::create("SBCB",,get_full_name());
        this.SBCB.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SBCR)

endclass : ral_reg_DW_apb_uart_SBCR

class ral_reg_DW_apb_uart_SDMAM extends uvm_reg;
    rand uvm_reg_field SDMAM;
    constraint SDMAM_cst_SDMAM {
        SDMAM.value == 'h1;
    }
    function new(string name = "DW_apb_uart_SDMAM");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SDMAM = uvm_reg_field::type_id::create("SDMAM",,get_full_name());
        this.SDMAM.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SDMAM)

endclass : ral_reg_DW_apb_uart_SDMAM

class ral_reg_DW_apb_uart_SFE extends uvm_reg;
    rand uvm_reg_field SFE;
    constraint SFE_cst_SFE {
        SFE.value == 'h1;
    }
    function new(string name = "DW_apb_uart_SFE");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SFE = uvm_reg_field::type_id::create("SFE",,get_full_name());
        this.SFE.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SFE)

endclass : ral_reg_DW_apb_uart_SFE

class ral_reg_DW_apb_uart_SRT extends uvm_reg;
    rand uvm_reg_field SRT;
    constraint SRT_cst_SRT {
        SRT.value inside {'h1,'h2,'h3};
    }
    function new(string name = "DW_apb_uart_SRT");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SRT = uvm_reg_field::type_id::create("SRT",,get_full_name());
        this.SRT.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_SRT)

endclass : ral_reg_DW_apb_uart_SRT

class ral_reg_DW_apb_uart_STET extends uvm_reg;
    rand uvm_reg_field STET;
    constraint STET_cst_STET {
        STET.value inside {'h1,'h2,'h3};
    }
    function new(string name = "DW_apb_uart_STET");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.STET = uvm_reg_field::type_id::create("STET",,get_full_name());
        this.STET.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_STET)

endclass : ral_reg_DW_apb_uart_STET

class ral_regfile_DW_apb_uart_SHADOW extends uvm_reg_file;
    rand ral_reg_DW_apb_uart_SRR SRR;
    rand ral_reg_DW_apb_uart_SRTS SRTS;
    rand ral_reg_DW_apb_uart_SBCR SBCR;
    rand ral_reg_DW_apb_uart_SDMAM SDMAM;
    rand ral_reg_DW_apb_uart_SFE SFE;
    rand ral_reg_DW_apb_uart_SRT SRT;
    rand ral_reg_DW_apb_uart_STET STET;

    function new(string name = "DW_apb_uart_SHADOW");
        super.new(name);
    endfunction: new

    function uvm_reg_map get_topblock_map();
        return this.get_parent().default_map;
    endfunction : get_topblock_map


    virtual function void build();
        this.SRR = ral_reg_DW_apb_uart_SRR::type_id::create("SRR",,get_full_name());
        this.SRR.configure(get_block(), this, "");
        this.SRR.build();
        this.get_topblock_map().add_reg(this.SRR, `UVM_REG_ADDR_WIDTH'h88, "WO", 0);
        this.SRTS = ral_reg_DW_apb_uart_SRTS::type_id::create("SRTS",,get_full_name());
        this.SRTS.configure(get_block(), this, "");
        this.SRTS.build();
        this.get_topblock_map().add_reg(this.SRTS, `UVM_REG_ADDR_WIDTH'h8C, "RW", 0);
        this.SBCR = ral_reg_DW_apb_uart_SBCR::type_id::create("SBCR",,get_full_name());
        this.SBCR.configure(get_block(), this, "");
        this.SBCR.build();
        this.get_topblock_map().add_reg(this.SBCR, `UVM_REG_ADDR_WIDTH'h90, "RW", 0);
        this.SDMAM = ral_reg_DW_apb_uart_SDMAM::type_id::create("SDMAM",,get_full_name());
        this.SDMAM.configure(get_block(), this, "");
        this.SDMAM.build();
        this.get_topblock_map().add_reg(this.SDMAM, `UVM_REG_ADDR_WIDTH'h94, "RW", 0);
        this.SFE = ral_reg_DW_apb_uart_SFE::type_id::create("SFE",,get_full_name());
        this.SFE.configure(get_block(), this, "");
        this.SFE.build();
        this.get_topblock_map().add_reg(this.SFE, `UVM_REG_ADDR_WIDTH'h98, "RW", 0);
        this.SRT = ral_reg_DW_apb_uart_SRT::type_id::create("SRT",,get_full_name());
        this.SRT.configure(get_block(), this, "");
        this.SRT.build();
        this.get_topblock_map().add_reg(this.SRT, `UVM_REG_ADDR_WIDTH'h9C, "RW", 0);
        this.STET = ral_reg_DW_apb_uart_STET::type_id::create("STET",,get_full_name());
        this.STET.configure(get_block(), this, "");
        this.STET.build();
        this.get_topblock_map().add_reg(this.STET, `UVM_REG_ADDR_WIDTH'hA0, "RW", 0);
    endfunction : build

    `uvm_object_utils(ral_regfile_DW_apb_uart_SHADOW)
endclass : ral_regfile_DW_apb_uart_SHADOW

class ral_reg_DW_apb_uart_HTX extends uvm_reg;
    rand uvm_reg_field HTX;
    constraint HTX_cst_HTX {
        HTX.value == 'h1;
    }
    function new(string name = "DW_apb_uart_HTX");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.HTX = uvm_reg_field::type_id::create("HTX",,get_full_name());
        this.HTX.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_HTX)

endclass : ral_reg_DW_apb_uart_HTX

class ral_reg_DW_apb_uart_DMASA extends uvm_reg;
    rand uvm_reg_field DMASA;
    constraint DMASA_cst_DMASA {
    }
    function new(string name = "DW_apb_uart_DMASA");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMASA = uvm_reg_field::type_id::create("DMASA",,get_full_name());
        this.DMASA.configure(this, 1, 0, "WO", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_DMASA)

endclass : ral_reg_DW_apb_uart_DMASA

class ral_reg_DW_apb_uart_DLF extends uvm_reg;
    rand uvm_reg_field DLF;
    constraint DLF_cst_DLF {
        DLF.value inside { ['h0:'h3] };
    }
    function new(string name = "DW_apb_uart_DLF");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DLF = uvm_reg_field::type_id::create("DLF",,get_full_name());
        this.DLF.configure(this, 4, 0, "RW", 0, 4'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_DLF)

endclass : ral_reg_DW_apb_uart_DLF

class ral_reg_DW_apb_uart_CPR extends uvm_reg;
    uvm_reg_field CPR;
    constraint CPR_cst_CPR {
    }
    function new(string name = "DW_apb_uart_CPR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.CPR = uvm_reg_field::type_id::create("CPR",,get_full_name());
        this.CPR.configure(this, 32, 0, "RO", 0, 32'h00042F32, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_CPR)

endclass : ral_reg_DW_apb_uart_CPR

class ral_reg_DW_apb_uart_UCV extends uvm_reg;
    uvm_reg_field UCV;
    constraint UCV_cst_UCV {
    }
    function new(string name = "DW_apb_uart_UCV");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UCV = uvm_reg_field::type_id::create("UCV",,get_full_name());
        this.UCV.configure(this, 32, 0, "RO", 0, 32'h3430322A, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_UCV)

endclass : ral_reg_DW_apb_uart_UCV

class ral_reg_DW_apb_uart_CTR extends uvm_reg;
    uvm_reg_field CTR;
    constraint CTR_cst_CTR {
    }
    function new(string name = "DW_apb_uart_CTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.CTR = uvm_reg_field::type_id::create("CTR",,get_full_name());
        this.CTR.configure(this, 32, 0, "RO", 0, 32'h44570110, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_DW_apb_uart_CTR)

endclass : ral_reg_DW_apb_uart_CTR

class ral_block_DW_apb_uart extends uvm_reg_block;
    rand ral_reg_DW_apb_uart_RBR RBR;
    rand ral_reg_DW_apb_uart_DLL DLL;
    rand ral_reg_DW_apb_uart_THR THR;
    rand ral_reg_DW_apb_uart_IER IER;
    rand ral_reg_DW_apb_uart_DLH DLH;
    rand ral_reg_DW_apb_uart_IIR IIR;
    rand ral_reg_DW_apb_uart_FCR FCR;
    rand ral_reg_DW_apb_uart_LCR LCR;
    rand ral_reg_DW_apb_uart_MCR MCR;
    rand ral_reg_DW_apb_uart_LSR LSR;
    rand ral_reg_DW_apb_uart_MSR MSR;
    rand ral_reg_DW_apb_uart_SCR SCR;
    rand ral_reg_DW_apb_uart_SRBR SRBR[8];
    rand ral_reg_DW_apb_uart_STHR STHR[8];
    rand ral_reg_DW_apb_uart_FAR FAR;
    rand ral_reg_DW_apb_uart_TFR TFR;
    rand ral_reg_DW_apb_uart_RFW RFW;
    rand ral_reg_DW_apb_uart_USR USR;
    rand ral_reg_DW_apb_uart_TFL TFL;
    rand ral_reg_DW_apb_uart_RFL RFL;
    rand ral_regfile_DW_apb_uart_SHADOW SHADOW;
    rand ral_reg_DW_apb_uart_HTX HTX;
    rand ral_reg_DW_apb_uart_DMASA DMASA;
    rand ral_reg_DW_apb_uart_DLF DLF;
    rand ral_reg_DW_apb_uart_CPR CPR;
    rand ral_reg_DW_apb_uart_UCV UCV;
    rand ral_reg_DW_apb_uart_CTR CTR;

    function new(string name = "DW_apb_uart");
        super.new(name, build_coverage(UVM_NO_COVERAGE));
    endfunction: new

    virtual function void build();
        this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.RBR = ral_reg_DW_apb_uart_RBR::type_id::create("RBR",,get_full_name());
        this.RBR.configure(this, null, "");
        this.RBR.build();
        this.RBR.add_hdl_path('{
        '{"U_DW_apb_uart_regfile.rbr[7:0]", 0, 8}
        });
        this.default_map.add_reg(this.RBR, `UVM_REG_ADDR_WIDTH'h00, "RO", 0);

        this.DLL = ral_reg_DW_apb_uart_DLL::type_id::create("DLL",,get_full_name());
        this.DLL.configure(this, null, "");
        this.DLL.build();
        this.DLL.add_hdl_path('{
        '{"U_DW_apb_uart_regfile.dll[7:0]", 0, 8}
        });
        this.default_map.add_reg(this.DLL, `UVM_REG_ADDR_WIDTH'h00, "RW", 0);

        this.THR = ral_reg_DW_apb_uart_THR::type_id::create("THR",,get_full_name());
        this.THR.configure(this, null, "");
        this.THR.build();
        this.default_map.add_reg(this.THR, `UVM_REG_ADDR_WIDTH'h00, "WO", 0);

        this.IER = ral_reg_DW_apb_uart_IER::type_id::create("IER",,get_full_name());
        this.IER.configure(this, null, "");
        this.IER.build();
        this.IER.add_hdl_path('{
        '{"U_DW_apb_uart_regfile.ier_ir[3:0]", 3, 1},
        '{"U_DW_apb_uart_regfile.ier_ir[7]", 7, 1}
        });
        this.default_map.add_reg(this.IER, `UVM_REG_ADDR_WIDTH'h04, "RW", 0);

        this.DLH = ral_reg_DW_apb_uart_DLH::type_id::create("DLH",,get_full_name());
        this.DLH.configure(this, null, "");
        this.DLH.build();
        this.DLH.add_hdl_path('{
        '{"U_DW_apb_uart_regfile.dlh[7:0]", 0, 8}
        });
        this.default_map.add_reg(this.DLH, `UVM_REG_ADDR_WIDTH'h04, "RW", 0);

        this.IIR = ral_reg_DW_apb_uart_IIR::type_id::create("IIR",,get_full_name());
        this.IIR.configure(this, null, "");
        this.IIR.build();
        this.IIR.add_hdl_path('{
        '{"U_DW_apb_uart_regfile.iir[3:0]", 0, 4},
        '{"U_DW_apb_uart_regfile.iir[7:6]", 6, 2}
        });
        this.default_map.add_reg(this.IIR, `UVM_REG_ADDR_WIDTH'h08, "RO", 0);

        this.FCR = ral_reg_DW_apb_uart_FCR::type_id::create("FCR",,get_full_name());
        this.FCR.configure(this, null, "");
        this.FCR.build();
        this.default_map.add_reg(this.FCR, `UVM_REG_ADDR_WIDTH'h08, "WO", 0);

        this.LCR = ral_reg_DW_apb_uart_LCR::type_id::create("LCR",,get_full_name());
        this.LCR.configure(this, null, "");
        this.LCR.build();
        this.default_map.add_reg(this.LCR, `UVM_REG_ADDR_WIDTH'h0C, "RW", 0);

        this.MCR = ral_reg_DW_apb_uart_MCR::type_id::create("MCR",,get_full_name());
        this.MCR.configure(this, null, "");
        this.MCR.build();
        this.default_map.add_reg(this.MCR, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);

        this.LSR = ral_reg_DW_apb_uart_LSR::type_id::create("LSR",,get_full_name());
        this.LSR.configure(this, null, "");
        this.LSR.build();
        this.default_map.add_reg(this.LSR, `UVM_REG_ADDR_WIDTH'h14, "RO", 0);

        this.MSR = ral_reg_DW_apb_uart_MSR::type_id::create("MSR",,get_full_name());
        this.MSR.configure(this, null, "");
        this.MSR.build();
        this.default_map.add_reg(this.MSR, `UVM_REG_ADDR_WIDTH'h18, "RO", 0);

        this.SCR = ral_reg_DW_apb_uart_SCR::type_id::create("SCR",,get_full_name());
        this.SCR.configure(this, null, "");
        this.SCR.build();
        this.default_map.add_reg(this.SCR, `UVM_REG_ADDR_WIDTH'h1C, "RW", 0);

        foreach (this.SRBR[i]) begin
            this.SRBR[i] = ral_reg_DW_apb_uart_SRBR::type_id::create("SRBR",,get_full_name());
            this.SRBR[i].configure(this, null, "");
            this.SRBR[i].build();
            this.default_map.add_reg(this.SRBR[i], `UVM_REG_ADDR_WIDTH'h30, "RO", 0);
        end

        foreach (this.STHR[i]) begin
            this.STHR[i] = ral_reg_DW_apb_uart_STHR::type_id::create("STHR",,get_full_name());
            this.STHR[i].configure(this, null, "");
            this.STHR[i].build();
            this.default_map.add_reg(this.STHR[i], `UVM_REG_ADDR_WIDTH'h30, "WO", 0);
        end

        this.FAR = ral_reg_DW_apb_uart_FAR::type_id::create("FAR",,get_full_name());
        this.FAR.configure(this, null, "");
        this.FAR.build();
        this.default_map.add_reg(this.FAR, `UVM_REG_ADDR_WIDTH'h70, "RW", 0);

        this.TFR = ral_reg_DW_apb_uart_TFR::type_id::create("TFR",,get_full_name());
        this.TFR.configure(this, null, "");
        this.TFR.build();
        this.default_map.add_reg(this.TFR, `UVM_REG_ADDR_WIDTH'h74, "RO", 0);

        this.RFW = ral_reg_DW_apb_uart_RFW::type_id::create("RFW",,get_full_name());
        this.RFW.configure(this, null, "");
        this.RFW.build();
        this.default_map.add_reg(this.RFW, `UVM_REG_ADDR_WIDTH'h78, "WO", 0);

        this.USR = ral_reg_DW_apb_uart_USR::type_id::create("USR",,get_full_name());
        this.USR.configure(this, null, "");
        this.USR.build();
        this.default_map.add_reg(this.USR, `UVM_REG_ADDR_WIDTH'h7C, "RO", 0);

        this.TFL = ral_reg_DW_apb_uart_TFL::type_id::create("TFL",,get_full_name());
        this.TFL.configure(this, null, "");
        this.TFL.build();
        this.default_map.add_reg(this.TFL, `UVM_REG_ADDR_WIDTH'h80, "RO", 0);

        this.RFL = ral_reg_DW_apb_uart_RFL::type_id::create("RFL",,get_full_name());
        this.RFL.configure(this, null, "");
        this.RFL.build();
        this.default_map.add_reg(this.RFL, `UVM_REG_ADDR_WIDTH'h84, "RO", 0);

        this.SHADOW = ral_regfile_DW_apb_uart_SHADOW::type_id::create("SHADOW",,get_full_name());
        this.SHADOW.configure(this,null, "");
        this.SHADOW.build();

        this.HTX = ral_reg_DW_apb_uart_HTX::type_id::create("HTX",,get_full_name());
        this.HTX.configure(this, null, "");
        this.HTX.build();
        this.default_map.add_reg(this.HTX, `UVM_REG_ADDR_WIDTH'hA4, "RW", 0);

        this.DMASA = ral_reg_DW_apb_uart_DMASA::type_id::create("DMASA",,get_full_name());
        this.DMASA.configure(this, null, "");
        this.DMASA.build();
        this.default_map.add_reg(this.DMASA, `UVM_REG_ADDR_WIDTH'hA8, "RW", 0);

        this.DLF = ral_reg_DW_apb_uart_DLF::type_id::create("DLF",,get_full_name());
        this.DLF.configure(this, null, "");
        this.DLF.build();
        this.default_map.add_reg(this.DLF, `UVM_REG_ADDR_WIDTH'hC0, "RW", 0);

        this.CPR = ral_reg_DW_apb_uart_CPR::type_id::create("CPR",,get_full_name());
        this.CPR.configure(this, null, "");
        this.CPR.build();
        this.default_map.add_reg(this.CPR, `UVM_REG_ADDR_WIDTH'hF4, "RO", 0);

        this.UCV = ral_reg_DW_apb_uart_UCV::type_id::create("UCV",,get_full_name());
        this.UCV.configure(this, null, "");
        this.UCV.build();
        this.default_map.add_reg(this.UCV, `UVM_REG_ADDR_WIDTH'hF8, "RO", 0);

        this.CTR = ral_reg_DW_apb_uart_CTR::type_id::create("CTR",,get_full_name());
        this.CTR.configure(this, null, "");
        this.CTR.build();
        this.default_map.add_reg(this.CTR, `UVM_REG_ADDR_WIDTH'hFC, "RO", 0);

    endfunction : build

    `uvm_object_utils(ral_block_DW_apb_uart)
endclass : ral_block_DW_apb_uart

`endif // RAL_MOD_UART