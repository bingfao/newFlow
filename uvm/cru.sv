/**
 * @file    cru.sv
 * @author  CIP Application Team
 # @brief   CRU Register struct Header File.
 *          This file contains:
 #           - Data structures and the address mapping for
 *             CRU peripherals
 #           - Including peripheral's registers declarations and bits
 *             definition
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

`ifndef RAL_MOD_CRU
`define RAL_MOD_CRU

import uvm_pkg::*;


class ral_reg_CRU_CCR extends uvm_reg;
    uvm_reg_field XTALON;
    uvm_reg_field XTALRDY;
    constraint CCR_cst_XTALON {
    }
    constraint CCR_cst_XTALRDY {
    }
    function new(string name = "CRU_CCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.XTALON = uvm_reg_field::type_id::create("XTALON",,get_full_name());
        this.XTALON.configure(this, 1, 16, "RO", 0, 1'h1, 1, 1, 0);
        this.XTALRDY = uvm_reg_field::type_id::create("XTALRDY",,get_full_name());
        this.XTALRDY.configure(this, 1, 17, "RO", 0, 1'h1, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_CCR)

endclass : ral_reg_CRU_CCR

class ral_reg_CRU_SCCR extends uvm_reg;
    rand uvm_reg_field CSW;
    rand uvm_reg_field CSWE;
    uvm_reg_field CSWS;
    rand uvm_reg_field SCPRE;
    rand uvm_reg_field SCPWE;
    constraint SCCR_cst_CSW {
    }
    constraint SCCR_cst_CSWE {
    }
    constraint SCCR_cst_CSWS {
    }
    constraint SCCR_cst_SCPRE {
        SCPRE.value inside { ['h00:'h1F] };
    }
    constraint SCCR_cst_SCPWE {
    }
    function new(string name = "CRU_SCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.CSW = uvm_reg_field::type_id::create("CSW",,get_full_name());
        this.CSW.configure(this, 3, 0, "RW", 0, 3'h0, 1, 1, 0);
        this.CSWE = uvm_reg_field::type_id::create("CSWE",,get_full_name());
        this.CSWE.configure(this, 1, 3, "WO", 0, 1'h0, 1, 1, 0);
        this.CSWS = uvm_reg_field::type_id::create("CSWS",,get_full_name());
        this.CSWS.configure(this, 3, 4, "RO", 0, 3'h0, 1, 1, 0);
        this.SCPRE = uvm_reg_field::type_id::create("SCPRE",,get_full_name());
        this.SCPRE.configure(this, 7, 8, "RW", 0, 7'h00, 1, 1, 0);
        this.SCPWE = uvm_reg_field::type_id::create("SCPWE",,get_full_name());
        this.SCPWE.configure(this, 1, 15, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_SCCR)

endclass : ral_reg_CRU_SCCR

class ral_reg_CRU_D1BCCR extends uvm_reg;
    rand uvm_reg_field PCK1PRE;
    rand uvm_reg_field PCK1PWE;
    rand uvm_reg_field PCK2PRE;
    rand uvm_reg_field PCK2PWE;
    rand uvm_reg_field D1BCPRE;
    rand uvm_reg_field D1BCPWE;
    constraint D1BCCR_cst_PCK1PRE {
    }
    constraint D1BCCR_cst_PCK1PWE {
    }
    constraint D1BCCR_cst_PCK2PRE {
    }
    constraint D1BCCR_cst_PCK2PWE {
    }
    constraint D1BCCR_cst_D1BCPRE {
    }
    constraint D1BCCR_cst_D1BCPWE {
    }
    function new(string name = "CRU_D1BCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.PCK1PRE = uvm_reg_field::type_id::create("PCK1PRE",,get_full_name());
        this.PCK1PRE.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.PCK1PWE = uvm_reg_field::type_id::create("PCK1PWE",,get_full_name());
        this.PCK1PWE.configure(this, 1, 2, "WO", 0, 1'h0, 1, 1, 0);
        this.PCK2PRE = uvm_reg_field::type_id::create("PCK2PRE",,get_full_name());
        this.PCK2PRE.configure(this, 2, 4, "RW", 0, 2'h0, 1, 1, 0);
        this.PCK2PWE = uvm_reg_field::type_id::create("PCK2PWE",,get_full_name());
        this.PCK2PWE.configure(this, 1, 6, "WO", 0, 1'h0, 1, 1, 0);
        this.D1BCPRE = uvm_reg_field::type_id::create("D1BCPRE",,get_full_name());
        this.D1BCPRE.configure(this, 2, 8, "RW", 0, 2'h0, 1, 1, 0);
        this.D1BCPWE = uvm_reg_field::type_id::create("D1BCPWE",,get_full_name());
        this.D1BCPWE.configure(this, 1, 10, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1BCCR)

endclass : ral_reg_CRU_D1BCCR

class ral_reg_CRU_D2BCCR extends uvm_reg;
    rand uvm_reg_field PCK3PRE;
    rand uvm_reg_field PCK3PWE;
    rand uvm_reg_field D2BCPRE;
    rand uvm_reg_field D2BCPWE;
    constraint D2BCCR_cst_PCK3PRE {
    }
    constraint D2BCCR_cst_PCK3PWE {
    }
    constraint D2BCCR_cst_D2BCPRE {
    }
    constraint D2BCCR_cst_D2BCPWE {
    }
    function new(string name = "CRU_D2BCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.PCK3PRE = uvm_reg_field::type_id::create("PCK3PRE",,get_full_name());
        this.PCK3PRE.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.PCK3PWE = uvm_reg_field::type_id::create("PCK3PWE",,get_full_name());
        this.PCK3PWE.configure(this, 1, 2, "WO", 0, 1'h0, 1, 1, 0);
        this.D2BCPRE = uvm_reg_field::type_id::create("D2BCPRE",,get_full_name());
        this.D2BCPRE.configure(this, 2, 8, "RW", 0, 2'h0, 1, 1, 0);
        this.D2BCPWE = uvm_reg_field::type_id::create("D2BCPWE",,get_full_name());
        this.D2BCPWE.configure(this, 1, 10, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2BCCR)

endclass : ral_reg_CRU_D2BCCR

class ral_reg_CRU_PLLMCR extends uvm_reg;
    rand uvm_reg_field PLLMON;
    uvm_reg_field PLLMRDY;
    rand uvm_reg_field PLLBYP;
    rand uvm_reg_field PLLMD;
    rand uvm_reg_field PLLPSTPD;
    rand uvm_reg_field PLLFO4PD;
    rand uvm_reg_field RFDIV;
    rand uvm_reg_field IFBDIV;
    rand uvm_reg_field PSDIV1;
    rand uvm_reg_field PSDIV2;
    constraint PLLMCR_cst_PLLMON {
    }
    constraint PLLMCR_cst_PLLMRDY {
    }
    constraint PLLMCR_cst_PLLBYP {
    }
    constraint PLLMCR_cst_PLLMD {
    }
    constraint PLLMCR_cst_PLLPSTPD {
    }
    constraint PLLMCR_cst_PLLFO4PD {
    }
    constraint PLLMCR_cst_RFDIV {
        RFDIV.value inside { ['h1:'h3F] };
    }
    constraint PLLMCR_cst_IFBDIV {
        IFBDIV.value inside { ['h14:'h0F0] };
    }
    constraint PLLMCR_cst_PSDIV1 {
        PSDIV1.value inside { ['h1:'h7] };
    }
    constraint PLLMCR_cst_PSDIV2 {
        PSDIV2.value inside { ['h1:'h7] };
    }
    function new(string name = "CRU_PLLMCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.PLLMON = uvm_reg_field::type_id::create("PLLMON",,get_full_name());
        this.PLLMON.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.PLLMRDY = uvm_reg_field::type_id::create("PLLMRDY",,get_full_name());
        this.PLLMRDY.configure(this, 1, 1, "RO", 0, 1'h0, 1, 1, 0);
        this.PLLBYP = uvm_reg_field::type_id::create("PLLBYP",,get_full_name());
        this.PLLBYP.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.PLLMD = uvm_reg_field::type_id::create("PLLMD",,get_full_name());
        this.PLLMD.configure(this, 1, 4, "RW", 0, 1'h0, 1, 1, 0);
        this.PLLPSTPD = uvm_reg_field::type_id::create("PLLPSTPD",,get_full_name());
        this.PLLPSTPD.configure(this, 1, 5, "RW", 0, 1'h0, 1, 1, 0);
        this.PLLFO4PD = uvm_reg_field::type_id::create("PLLFO4PD",,get_full_name());
        this.PLLFO4PD.configure(this, 1, 6, "RW", 0, 1'h0, 1, 1, 0);
        this.RFDIV = uvm_reg_field::type_id::create("RFDIV",,get_full_name());
        this.RFDIV.configure(this, 6, 8, "RW", 0, 6'h01, 1, 1, 0);
        this.IFBDIV = uvm_reg_field::type_id::create("IFBDIV",,get_full_name());
        this.IFBDIV.configure(this, 12, 14, "RW", 0, 12'h014, 1, 1, 0);
        this.PSDIV1 = uvm_reg_field::type_id::create("PSDIV1",,get_full_name());
        this.PSDIV1.configure(this, 3, 26, "RW", 0, 3'h2, 1, 1, 0);
        this.PSDIV2 = uvm_reg_field::type_id::create("PSDIV2",,get_full_name());
        this.PSDIV2.configure(this, 3, 29, "RW", 0, 3'h1, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_PLLMCR)

endclass : ral_reg_CRU_PLLMCR

class ral_reg_CRU_PLLMFR extends uvm_reg;
    rand uvm_reg_field FFBDIV;
    constraint PLLMFR_cst_FFBDIV {
        FFBDIV.value inside { ['h000000:'hFFFFFF] };
    }
    function new(string name = "CRU_PLLMFR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.FFBDIV = uvm_reg_field::type_id::create("FFBDIV",,get_full_name());
        this.FFBDIV.configure(this, 24, 0, "RW", 0, 24'h000000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_PLLMFR)

endclass : ral_reg_CRU_PLLMFR

class ral_reg_CRU_D1HFCCR extends uvm_reg;
    rand uvm_reg_field QSPI1PRE;
    rand uvm_reg_field U1PHYPRE;
    constraint D1HFCCR_cst_QSPI1PRE {
    }
    constraint D1HFCCR_cst_U1PHYPRE {
        U1PHYPRE.value inside { ['h2:'hF] };
    }
    function new(string name = "CRU_D1HFCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.QSPI1PRE = uvm_reg_field::type_id::create("QSPI1PRE",,get_full_name());
        this.QSPI1PRE.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.U1PHYPRE = uvm_reg_field::type_id::create("U1PHYPRE",,get_full_name());
        this.U1PHYPRE.configure(this, 4, 4, "RW", 0, 4'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1HFCCR)

endclass : ral_reg_CRU_D1HFCCR

class ral_reg_CRU_D1HFCSR extends uvm_reg;
    rand uvm_reg_field QSPI1CS;
    rand uvm_reg_field U1PHYCS;
    constraint D1HFCSR_cst_QSPI1CS {
    }
    constraint D1HFCSR_cst_U1PHYCS {
    }
    function new(string name = "CRU_D1HFCSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.QSPI1CS = uvm_reg_field::type_id::create("QSPI1CS",,get_full_name());
        this.QSPI1CS.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.U1PHYCS = uvm_reg_field::type_id::create("U1PHYCS",,get_full_name());
        this.U1PHYCS.configure(this, 2, 4, "RW", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1HFCSR)

endclass : ral_reg_CRU_D1HFCSR

class ral_reg_CRU_D2HFCCR extends uvm_reg;
    rand uvm_reg_field QSPI0PRE;
    rand uvm_reg_field U0PHYPRE;
    constraint D2HFCCR_cst_QSPI0PRE {
    }
    constraint D2HFCCR_cst_U0PHYPRE {
        U0PHYPRE.value inside { ['h2:'hF] };
    }
    function new(string name = "CRU_D2HFCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.QSPI0PRE = uvm_reg_field::type_id::create("QSPI0PRE",,get_full_name());
        this.QSPI0PRE.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.U0PHYPRE = uvm_reg_field::type_id::create("U0PHYPRE",,get_full_name());
        this.U0PHYPRE.configure(this, 4, 4, "RW", 0, 4'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2HFCCR)

endclass : ral_reg_CRU_D2HFCCR

class ral_reg_CRU_D2HFCSR extends uvm_reg;
    rand uvm_reg_field QSPI0CS;
    rand uvm_reg_field U0PHYCS;
    constraint D2HFCSR_cst_QSPI0CS {
    }
    constraint D2HFCSR_cst_U0PHYCS {
    }
    function new(string name = "CRU_D2HFCSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.QSPI0CS = uvm_reg_field::type_id::create("QSPI0CS",,get_full_name());
        this.QSPI0CS.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.U0PHYCS = uvm_reg_field::type_id::create("U0PHYCS",,get_full_name());
        this.U0PHYCS.configure(this, 2, 4, "RW", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2HFCSR)

endclass : ral_reg_CRU_D2HFCSR

class ral_reg_CRU_D1PFCCR extends uvm_reg;
    rand uvm_reg_field WDT1PRE;
    constraint D1PFCCR_cst_WDT1PRE {
        WDT1PRE.value inside { ['h2:'h3F] };
    }
    function new(string name = "CRU_D1PFCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.WDT1PRE = uvm_reg_field::type_id::create("WDT1PRE",,get_full_name());
        this.WDT1PRE.configure(this, 6, 26, "RW", 0, 6'h00, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1PFCCR)

endclass : ral_reg_CRU_D1PFCCR

class ral_reg_CRU_D1PFCSR extends uvm_reg;
    rand uvm_reg_field I2C0CS;
    rand uvm_reg_field I2C1CS;
    rand uvm_reg_field UART1CS;
    rand uvm_reg_field UART2CS;
    rand uvm_reg_field SPI0CS;
    rand uvm_reg_field SPI1CS;
    rand uvm_reg_field WDT1CS;
    constraint D1PFCSR_cst_I2C0CS {
    }
    constraint D1PFCSR_cst_I2C1CS {
    }
    constraint D1PFCSR_cst_UART1CS {
    }
    constraint D1PFCSR_cst_UART2CS {
    }
    constraint D1PFCSR_cst_SPI0CS {
    }
    constraint D1PFCSR_cst_SPI1CS {
    }
    constraint D1PFCSR_cst_WDT1CS {
    }
    function new(string name = "CRU_D1PFCSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.I2C0CS = uvm_reg_field::type_id::create("I2C0CS",,get_full_name());
        this.I2C0CS.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.I2C1CS = uvm_reg_field::type_id::create("I2C1CS",,get_full_name());
        this.I2C1CS.configure(this, 2, 2, "RW", 0, 2'h0, 1, 1, 0);
        this.UART1CS = uvm_reg_field::type_id::create("UART1CS",,get_full_name());
        this.UART1CS.configure(this, 2, 18, "RW", 0, 2'h0, 1, 1, 0);
        this.UART2CS = uvm_reg_field::type_id::create("UART2CS",,get_full_name());
        this.UART2CS.configure(this, 2, 20, "RW", 0, 2'h0, 1, 1, 0);
        this.SPI0CS = uvm_reg_field::type_id::create("SPI0CS",,get_full_name());
        this.SPI0CS.configure(this, 2, 24, "RW", 0, 2'h0, 1, 1, 0);
        this.SPI1CS = uvm_reg_field::type_id::create("SPI1CS",,get_full_name());
        this.SPI1CS.configure(this, 2, 26, "RW", 0, 2'h0, 1, 1, 0);
        this.WDT1CS = uvm_reg_field::type_id::create("WDT1CS",,get_full_name());
        this.WDT1CS.configure(this, 2, 30, "RW", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1PFCSR)

endclass : ral_reg_CRU_D1PFCSR

class ral_reg_CRU_D2PFCCR extends uvm_reg;
    rand uvm_reg_field I2S0PRE;
    rand uvm_reg_field I2S1PRE;
    rand uvm_reg_field PDMPRE;
    rand uvm_reg_field ADCPRE;
    rand uvm_reg_field WDT0PRE;
    constraint D2PFCCR_cst_I2S0PRE {
        I2S0PRE.value inside { ['h0:'hF] };
    }
    constraint D2PFCCR_cst_I2S1PRE {
        I2S1PRE.value inside { ['h0:'hF] };
    }
    constraint D2PFCCR_cst_PDMPRE {
        PDMPRE.value inside { ['h0:'hF] };
    }
    constraint D2PFCCR_cst_ADCPRE {
        ADCPRE.value inside { ['h0:'hF] };
    }
    constraint D2PFCCR_cst_WDT0PRE {
        WDT0PRE.value inside { ['h2:'h3F] };
    }
    function new(string name = "CRU_D2PFCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.I2S0PRE = uvm_reg_field::type_id::create("I2S0PRE",,get_full_name());
        this.I2S0PRE.configure(this, 4, 0, "RW", 0, 4'h0, 1, 1, 0);
        this.I2S1PRE = uvm_reg_field::type_id::create("I2S1PRE",,get_full_name());
        this.I2S1PRE.configure(this, 4, 4, "RW", 0, 4'h0, 1, 1, 0);
        this.PDMPRE = uvm_reg_field::type_id::create("PDMPRE",,get_full_name());
        this.PDMPRE.configure(this, 4, 16, "RW", 0, 4'h0, 1, 1, 0);
        this.ADCPRE = uvm_reg_field::type_id::create("ADCPRE",,get_full_name());
        this.ADCPRE.configure(this, 4, 20, "RW", 0, 4'h0, 1, 1, 0);
        this.WDT0PRE = uvm_reg_field::type_id::create("WDT0PRE",,get_full_name());
        this.WDT0PRE.configure(this, 6, 26, "RW", 0, 6'h00, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2PFCCR)

endclass : ral_reg_CRU_D2PFCCR

class ral_reg_CRU_D2PFCSR extends uvm_reg;
    rand uvm_reg_field UART0CS;
    rand uvm_reg_field I2S0CS;
    rand uvm_reg_field I2S1CS;
    rand uvm_reg_field PDMCS;
    rand uvm_reg_field ADCCS;
    rand uvm_reg_field WDT0CS;
    constraint D2PFCSR_cst_UART0CS {
    }
    constraint D2PFCSR_cst_I2S0CS {
    }
    constraint D2PFCSR_cst_I2S1CS {
    }
    constraint D2PFCSR_cst_PDMCS {
    }
    constraint D2PFCSR_cst_ADCCS {
    }
    constraint D2PFCSR_cst_WDT0CS {
    }
    function new(string name = "CRU_D2PFCSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UART0CS = uvm_reg_field::type_id::create("UART0CS",,get_full_name());
        this.UART0CS.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 0);
        this.I2S0CS = uvm_reg_field::type_id::create("I2S0CS",,get_full_name());
        this.I2S0CS.configure(this, 2, 16, "RW", 0, 2'h0, 1, 1, 0);
        this.I2S1CS = uvm_reg_field::type_id::create("I2S1CS",,get_full_name());
        this.I2S1CS.configure(this, 2, 18, "RW", 0, 2'h0, 1, 1, 0);
        this.PDMCS = uvm_reg_field::type_id::create("PDMCS",,get_full_name());
        this.PDMCS.configure(this, 2, 24, "RW", 0, 2'h0, 1, 1, 0);
        this.ADCCS = uvm_reg_field::type_id::create("ADCCS",,get_full_name());
        this.ADCCS.configure(this, 2, 28, "RW", 0, 2'h0, 1, 1, 0);
        this.WDT0CS = uvm_reg_field::type_id::create("WDT0CS",,get_full_name());
        this.WDT0CS.configure(this, 2, 30, "RW", 0, 2'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2PFCSR)

endclass : ral_reg_CRU_D2PFCSR

class ral_reg_CRU_COCR extends uvm_reg;
    rand uvm_reg_field CO1S;
    rand uvm_reg_field CO1DIV;
    rand uvm_reg_field CO1DWE;
    rand uvm_reg_field CO2S;
    rand uvm_reg_field CO2DIV;
    rand uvm_reg_field CO2DWE;
    rand uvm_reg_field RTCPRE;
    constraint COCR_cst_CO1S {
    }
    constraint COCR_cst_CO1DIV {
    }
    constraint COCR_cst_CO1DWE {
    }
    constraint COCR_cst_CO2S {
    }
    constraint COCR_cst_CO2DIV {
    }
    constraint COCR_cst_CO2DWE {
    }
    constraint COCR_cst_RTCPRE {
        RTCPRE.value inside { ['h2:'h3FF] };
    }
    function new(string name = "CRU_COCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.CO1S = uvm_reg_field::type_id::create("CO1S",,get_full_name());
        this.CO1S.configure(this, 3, 0, "RW", 0, 3'h0, 1, 1, 0);
        this.CO1DIV = uvm_reg_field::type_id::create("CO1DIV",,get_full_name());
        this.CO1DIV.configure(this, 3, 4, "RW", 0, 3'h0, 1, 1, 0);
        this.CO1DWE = uvm_reg_field::type_id::create("CO1DWE",,get_full_name());
        this.CO1DWE.configure(this, 1, 7, "WO", 0, 1'h0, 1, 1, 0);
        this.CO2S = uvm_reg_field::type_id::create("CO2S",,get_full_name());
        this.CO2S.configure(this, 3, 8, "RW", 0, 3'h0, 1, 1, 0);
        this.CO2DIV = uvm_reg_field::type_id::create("CO2DIV",,get_full_name());
        this.CO2DIV.configure(this, 3, 12, "RW", 0, 3'h0, 1, 1, 0);
        this.CO2DWE = uvm_reg_field::type_id::create("CO2DWE",,get_full_name());
        this.CO2DWE.configure(this, 1, 15, "WO", 0, 1'h0, 1, 1, 0);
        this.RTCPRE = uvm_reg_field::type_id::create("RTCPRE",,get_full_name());
        this.RTCPRE.configure(this, 10, 16, "RW", 0, 10'h000, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_COCR)

endclass : ral_reg_CRU_COCR

class ral_reg_CRU_CIER extends uvm_reg;
    function new(string name = "CRU_CIER");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_CIER)

endclass : ral_reg_CRU_CIER

class ral_reg_CRU_CIFR extends uvm_reg;
    function new(string name = "CRU_CIFR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_CIFR)

endclass : ral_reg_CRU_CIFR

class ral_reg_CRU_CICR extends uvm_reg;
    function new(string name = "CRU_CICR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_CICR)

endclass : ral_reg_CRU_CICR

class ral_reg_CRU_RTCCR extends uvm_reg;
    rand uvm_reg_field XTAL32ON;
    uvm_reg_field XTAL32RDY;
    rand uvm_reg_field XTAL32BYP;
    rand uvm_reg_field RTCEN;
    rand uvm_reg_field RTCCS;
    constraint RTCCR_cst_XTAL32ON {
    }
    constraint RTCCR_cst_XTAL32RDY {
    }
    constraint RTCCR_cst_XTAL32BYP {
    }
    constraint RTCCR_cst_RTCEN {
    }
    constraint RTCCR_cst_RTCCS {
    }
    function new(string name = "CRU_RTCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.XTAL32ON = uvm_reg_field::type_id::create("XTAL32ON",,get_full_name());
        this.XTAL32ON.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.XTAL32RDY = uvm_reg_field::type_id::create("XTAL32RDY",,get_full_name());
        this.XTAL32RDY.configure(this, 1, 1, "RO", 0, 1'h0, 1, 1, 0);
        this.XTAL32BYP = uvm_reg_field::type_id::create("XTAL32BYP",,get_full_name());
        this.XTAL32BYP.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.RTCEN = uvm_reg_field::type_id::create("RTCEN",,get_full_name());
        this.RTCEN.configure(this, 1, 12, "RW", 0, 1'h0, 1, 1, 0);
        this.RTCCS = uvm_reg_field::type_id::create("RTCCS",,get_full_name());
        this.RTCCS.configure(this, 1, 13, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_RTCCR)

endclass : ral_reg_CRU_RTCCR

class ral_reg_CRU_XPRSTR extends uvm_reg;
    rand uvm_reg_field NPURST;
    constraint XPRSTR_cst_NPURST {
    }
    function new(string name = "CRU_XPRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.NPURST = uvm_reg_field::type_id::create("NPURST",,get_full_name());
        this.NPURST.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_XPRSTR)

endclass : ral_reg_CRU_XPRSTR

class ral_reg_CRU_H1PRSTR extends uvm_reg;
    rand uvm_reg_field DMA0RST;
    rand uvm_reg_field QSPI1RST;
    rand uvm_reg_field USB1RST;
    constraint H1PRSTR_cst_DMA0RST {
    }
    constraint H1PRSTR_cst_QSPI1RST {
    }
    constraint H1PRSTR_cst_USB1RST {
    }
    function new(string name = "CRU_H1PRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA0RST = uvm_reg_field::type_id::create("DMA0RST",,get_full_name());
        this.DMA0RST.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.QSPI1RST = uvm_reg_field::type_id::create("QSPI1RST",,get_full_name());
        this.QSPI1RST.configure(this, 1, 10, "RW", 0, 1'h0, 1, 1, 0);
        this.USB1RST = uvm_reg_field::type_id::create("USB1RST",,get_full_name());
        this.USB1RST.configure(this, 1, 14, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_H1PRSTR)

endclass : ral_reg_CRU_H1PRSTR

class ral_reg_CRU_H2PRSTR extends uvm_reg;
    rand uvm_reg_field DMA2RST;
    rand uvm_reg_field QSPI0RST;
    rand uvm_reg_field USB0RST;
    rand uvm_reg_field AESRST;
    rand uvm_reg_field PKARST;
    rand uvm_reg_field SHARST;
    rand uvm_reg_field CRCRST;
    constraint H2PRSTR_cst_DMA2RST {
    }
    constraint H2PRSTR_cst_QSPI0RST {
    }
    constraint H2PRSTR_cst_USB0RST {
    }
    constraint H2PRSTR_cst_AESRST {
    }
    constraint H2PRSTR_cst_PKARST {
    }
    constraint H2PRSTR_cst_SHARST {
    }
    constraint H2PRSTR_cst_CRCRST {
    }
    function new(string name = "CRU_H2PRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA2RST = uvm_reg_field::type_id::create("DMA2RST",,get_full_name());
        this.DMA2RST.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.QSPI0RST = uvm_reg_field::type_id::create("QSPI0RST",,get_full_name());
        this.QSPI0RST.configure(this, 1, 9, "RW", 0, 1'h0, 1, 1, 0);
        this.USB0RST = uvm_reg_field::type_id::create("USB0RST",,get_full_name());
        this.USB0RST.configure(this, 1, 13, "RW", 0, 1'h0, 1, 1, 0);
        this.AESRST = uvm_reg_field::type_id::create("AESRST",,get_full_name());
        this.AESRST.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.PKARST = uvm_reg_field::type_id::create("PKARST",,get_full_name());
        this.PKARST.configure(this, 1, 18, "RW", 0, 1'h0, 1, 1, 0);
        this.SHARST = uvm_reg_field::type_id::create("SHARST",,get_full_name());
        this.SHARST.configure(this, 1, 19, "RW", 0, 1'h0, 1, 1, 0);
        this.CRCRST = uvm_reg_field::type_id::create("CRCRST",,get_full_name());
        this.CRCRST.configure(this, 1, 24, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_H2PRSTR)

endclass : ral_reg_CRU_H2PRSTR

class ral_reg_CRU_D1PRSTR extends uvm_reg;
    rand uvm_reg_field I2C0RST;
    rand uvm_reg_field I2C1RST;
    rand uvm_reg_field UART1RST;
    rand uvm_reg_field UART2RST;
    rand uvm_reg_field SPI0RST;
    rand uvm_reg_field SPI1RST;
    rand uvm_reg_field WDT1RST;
    constraint D1PRSTR_cst_I2C0RST {
    }
    constraint D1PRSTR_cst_I2C1RST {
    }
    constraint D1PRSTR_cst_UART1RST {
    }
    constraint D1PRSTR_cst_UART2RST {
    }
    constraint D1PRSTR_cst_SPI0RST {
    }
    constraint D1PRSTR_cst_SPI1RST {
    }
    constraint D1PRSTR_cst_WDT1RST {
    }
    function new(string name = "CRU_D1PRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.I2C0RST = uvm_reg_field::type_id::create("I2C0RST",,get_full_name());
        this.I2C0RST.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.I2C1RST = uvm_reg_field::type_id::create("I2C1RST",,get_full_name());
        this.I2C1RST.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
        this.UART1RST = uvm_reg_field::type_id::create("UART1RST",,get_full_name());
        this.UART1RST.configure(this, 1, 9, "RW", 0, 1'h0, 1, 1, 0);
        this.UART2RST = uvm_reg_field::type_id::create("UART2RST",,get_full_name());
        this.UART2RST.configure(this, 1, 10, "RW", 0, 1'h0, 1, 1, 0);
        this.SPI0RST = uvm_reg_field::type_id::create("SPI0RST",,get_full_name());
        this.SPI0RST.configure(this, 1, 16, "RW", 0, 1'h0, 1, 1, 0);
        this.SPI1RST = uvm_reg_field::type_id::create("SPI1RST",,get_full_name());
        this.SPI1RST.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.WDT1RST = uvm_reg_field::type_id::create("WDT1RST",,get_full_name());
        this.WDT1RST.configure(this, 1, 31, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1PRSTR)

endclass : ral_reg_CRU_D1PRSTR

class ral_reg_CRU_D2PRSTR extends uvm_reg;
    rand uvm_reg_field UART0RST;
    rand uvm_reg_field I2S0RST;
    rand uvm_reg_field I2S1RST;
    rand uvm_reg_field PDMRST;
    rand uvm_reg_field VADRST;
    rand uvm_reg_field ADCRST;
    rand uvm_reg_field GPIORST;
    rand uvm_reg_field FFTRST;
    rand uvm_reg_field WDT0RST;
    constraint D2PRSTR_cst_UART0RST {
    }
    constraint D2PRSTR_cst_I2S0RST {
    }
    constraint D2PRSTR_cst_I2S1RST {
    }
    constraint D2PRSTR_cst_PDMRST {
    }
    constraint D2PRSTR_cst_VADRST {
    }
    constraint D2PRSTR_cst_ADCRST {
    }
    constraint D2PRSTR_cst_GPIORST {
    }
    constraint D2PRSTR_cst_FFTRST {
    }
    constraint D2PRSTR_cst_WDT0RST {
    }
    function new(string name = "CRU_D2PRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UART0RST = uvm_reg_field::type_id::create("UART0RST",,get_full_name());
        this.UART0RST.configure(this, 1, 8, "RW", 0, 1'h0, 1, 1, 0);
        this.I2S0RST = uvm_reg_field::type_id::create("I2S0RST",,get_full_name());
        this.I2S0RST.configure(this, 1, 16, "RW", 0, 1'h0, 1, 1, 0);
        this.I2S1RST = uvm_reg_field::type_id::create("I2S1RST",,get_full_name());
        this.I2S1RST.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.PDMRST = uvm_reg_field::type_id::create("PDMRST",,get_full_name());
        this.PDMRST.configure(this, 1, 20, "RW", 0, 1'h0, 1, 1, 0);
        this.VADRST = uvm_reg_field::type_id::create("VADRST",,get_full_name());
        this.VADRST.configure(this, 1, 24, "RW", 0, 1'h0, 1, 1, 0);
        this.ADCRST = uvm_reg_field::type_id::create("ADCRST",,get_full_name());
        this.ADCRST.configure(this, 1, 25, "RW", 0, 1'h0, 1, 1, 0);
        this.GPIORST = uvm_reg_field::type_id::create("GPIORST",,get_full_name());
        this.GPIORST.configure(this, 1, 26, "RW", 0, 1'h0, 1, 1, 0);
        this.FFTRST = uvm_reg_field::type_id::create("FFTRST",,get_full_name());
        this.FFTRST.configure(this, 1, 29, "RW", 0, 1'h0, 1, 1, 0);
        this.WDT0RST = uvm_reg_field::type_id::create("WDT0RST",,get_full_name());
        this.WDT0RST.configure(this, 1, 30, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2PRSTR)

endclass : ral_reg_CRU_D2PRSTR

class ral_reg_CRU_XPRSFR extends uvm_reg;
    uvm_reg_field NPURSF;
    constraint XPRSFR_cst_NPURSF {
    }
    function new(string name = "CRU_XPRSFR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.NPURSF = uvm_reg_field::type_id::create("NPURSF",,get_full_name());
        this.NPURSF.configure(this, 1, 0, "RO", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_XPRSFR)

endclass : ral_reg_CRU_XPRSFR

class ral_reg_CRU_D1HPRSTR extends uvm_reg;
    uvm_reg_field DMA0RSF;
    uvm_reg_field QSPI1RSF;
    uvm_reg_field USB1RSF;
    constraint D1HPRSTR_cst_DMA0RSF {
    }
    constraint D1HPRSTR_cst_QSPI1RSF {
    }
    constraint D1HPRSTR_cst_USB1RSF {
    }
    function new(string name = "CRU_D1HPRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA0RSF = uvm_reg_field::type_id::create("DMA0RSF",,get_full_name());
        this.DMA0RSF.configure(this, 1, 0, "RO", 0, 1'h0, 1, 1, 0);
        this.QSPI1RSF = uvm_reg_field::type_id::create("QSPI1RSF",,get_full_name());
        this.QSPI1RSF.configure(this, 1, 10, "RO", 0, 1'h0, 1, 1, 0);
        this.USB1RSF = uvm_reg_field::type_id::create("USB1RSF",,get_full_name());
        this.USB1RSF.configure(this, 1, 14, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1HPRSTR)

endclass : ral_reg_CRU_D1HPRSTR

class ral_reg_CRU_D2HPRSTR extends uvm_reg;
    uvm_reg_field DMA2RSF;
    uvm_reg_field QSPI0RSF;
    uvm_reg_field USB0RSF;
    uvm_reg_field AESRSF;
    uvm_reg_field PKARSF;
    uvm_reg_field SHARSF;
    uvm_reg_field CRCRSF;
    constraint D2HPRSTR_cst_DMA2RSF {
    }
    constraint D2HPRSTR_cst_QSPI0RSF {
    }
    constraint D2HPRSTR_cst_USB0RSF {
    }
    constraint D2HPRSTR_cst_AESRSF {
    }
    constraint D2HPRSTR_cst_PKARSF {
    }
    constraint D2HPRSTR_cst_SHARSF {
    }
    constraint D2HPRSTR_cst_CRCRSF {
    }
    function new(string name = "CRU_D2HPRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA2RSF = uvm_reg_field::type_id::create("DMA2RSF",,get_full_name());
        this.DMA2RSF.configure(this, 1, 2, "RO", 0, 1'h0, 1, 1, 0);
        this.QSPI0RSF = uvm_reg_field::type_id::create("QSPI0RSF",,get_full_name());
        this.QSPI0RSF.configure(this, 1, 9, "RO", 0, 1'h0, 1, 1, 0);
        this.USB0RSF = uvm_reg_field::type_id::create("USB0RSF",,get_full_name());
        this.USB0RSF.configure(this, 1, 13, "RO", 0, 1'h0, 1, 1, 0);
        this.AESRSF = uvm_reg_field::type_id::create("AESRSF",,get_full_name());
        this.AESRSF.configure(this, 1, 17, "RO", 0, 1'h0, 1, 1, 0);
        this.PKARSF = uvm_reg_field::type_id::create("PKARSF",,get_full_name());
        this.PKARSF.configure(this, 1, 18, "RO", 0, 1'h0, 1, 1, 0);
        this.SHARSF = uvm_reg_field::type_id::create("SHARSF",,get_full_name());
        this.SHARSF.configure(this, 1, 19, "RO", 0, 1'h0, 1, 1, 0);
        this.CRCRSF = uvm_reg_field::type_id::create("CRCRSF",,get_full_name());
        this.CRCRSF.configure(this, 1, 24, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2HPRSTR)

endclass : ral_reg_CRU_D2HPRSTR

class ral_reg_CRU_D1PPRSTR extends uvm_reg;
    uvm_reg_field I2C0RSF;
    uvm_reg_field I2C1RSF;
    uvm_reg_field UART1RSF;
    uvm_reg_field UART2RSF;
    uvm_reg_field SPI0RSF;
    uvm_reg_field SPI1RSF;
    uvm_reg_field WDT1RSF;
    constraint D1PPRSTR_cst_I2C0RSF {
    }
    constraint D1PPRSTR_cst_I2C1RSF {
    }
    constraint D1PPRSTR_cst_UART1RSF {
    }
    constraint D1PPRSTR_cst_UART2RSF {
    }
    constraint D1PPRSTR_cst_SPI0RSF {
    }
    constraint D1PPRSTR_cst_SPI1RSF {
    }
    constraint D1PPRSTR_cst_WDT1RSF {
    }
    function new(string name = "CRU_D1PPRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.I2C0RSF = uvm_reg_field::type_id::create("I2C0RSF",,get_full_name());
        this.I2C0RSF.configure(this, 1, 0, "RO", 0, 1'h0, 1, 1, 0);
        this.I2C1RSF = uvm_reg_field::type_id::create("I2C1RSF",,get_full_name());
        this.I2C1RSF.configure(this, 1, 1, "RO", 0, 1'h0, 1, 1, 0);
        this.UART1RSF = uvm_reg_field::type_id::create("UART1RSF",,get_full_name());
        this.UART1RSF.configure(this, 1, 9, "RO", 0, 1'h0, 1, 1, 0);
        this.UART2RSF = uvm_reg_field::type_id::create("UART2RSF",,get_full_name());
        this.UART2RSF.configure(this, 1, 10, "RO", 0, 1'h0, 1, 1, 0);
        this.SPI0RSF = uvm_reg_field::type_id::create("SPI0RSF",,get_full_name());
        this.SPI0RSF.configure(this, 1, 16, "RO", 0, 1'h0, 1, 1, 0);
        this.SPI1RSF = uvm_reg_field::type_id::create("SPI1RSF",,get_full_name());
        this.SPI1RSF.configure(this, 1, 17, "RO", 0, 1'h0, 1, 1, 0);
        this.WDT1RSF = uvm_reg_field::type_id::create("WDT1RSF",,get_full_name());
        this.WDT1RSF.configure(this, 1, 31, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1PPRSTR)

endclass : ral_reg_CRU_D1PPRSTR

class ral_reg_CRU_D2PPRSTR extends uvm_reg;
    uvm_reg_field UART0RSF;
    uvm_reg_field I2S0RSF;
    uvm_reg_field I2S1RSF;
    uvm_reg_field PDMRSF;
    uvm_reg_field VADRSF;
    uvm_reg_field ADCRSF;
    uvm_reg_field GPIORSF;
    uvm_reg_field FFTRSF;
    uvm_reg_field WDT0RSF;
    constraint D2PPRSTR_cst_UART0RSF {
    }
    constraint D2PPRSTR_cst_I2S0RSF {
    }
    constraint D2PPRSTR_cst_I2S1RSF {
    }
    constraint D2PPRSTR_cst_PDMRSF {
    }
    constraint D2PPRSTR_cst_VADRSF {
    }
    constraint D2PPRSTR_cst_ADCRSF {
    }
    constraint D2PPRSTR_cst_GPIORSF {
    }
    constraint D2PPRSTR_cst_FFTRSF {
    }
    constraint D2PPRSTR_cst_WDT0RSF {
    }
    function new(string name = "CRU_D2PPRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UART0RSF = uvm_reg_field::type_id::create("UART0RSF",,get_full_name());
        this.UART0RSF.configure(this, 1, 8, "RO", 0, 1'h0, 1, 1, 0);
        this.I2S0RSF = uvm_reg_field::type_id::create("I2S0RSF",,get_full_name());
        this.I2S0RSF.configure(this, 1, 16, "RO", 0, 1'h0, 1, 1, 0);
        this.I2S1RSF = uvm_reg_field::type_id::create("I2S1RSF",,get_full_name());
        this.I2S1RSF.configure(this, 1, 17, "RO", 0, 1'h0, 1, 1, 0);
        this.PDMRSF = uvm_reg_field::type_id::create("PDMRSF",,get_full_name());
        this.PDMRSF.configure(this, 1, 21, "RO", 0, 1'h0, 1, 1, 0);
        this.VADRSF = uvm_reg_field::type_id::create("VADRSF",,get_full_name());
        this.VADRSF.configure(this, 1, 24, "RO", 0, 1'h0, 1, 1, 0);
        this.ADCRSF = uvm_reg_field::type_id::create("ADCRSF",,get_full_name());
        this.ADCRSF.configure(this, 1, 25, "RO", 0, 1'h0, 1, 1, 0);
        this.GPIORSF = uvm_reg_field::type_id::create("GPIORSF",,get_full_name());
        this.GPIORSF.configure(this, 1, 26, "RO", 0, 1'h0, 1, 1, 0);
        this.FFTRSF = uvm_reg_field::type_id::create("FFTRSF",,get_full_name());
        this.FFTRSF.configure(this, 1, 29, "RO", 0, 1'h0, 1, 1, 0);
        this.WDT0RSF = uvm_reg_field::type_id::create("WDT0RSF",,get_full_name());
        this.WDT0RSF.configure(this, 1, 30, "RO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2PPRSTR)

endclass : ral_reg_CRU_D2PPRSTR

class ral_reg_CRU_GRCR extends uvm_reg;
    rand uvm_reg_field WDG0RSC;
    rand uvm_reg_field WDG1RSC;
    constraint GRCR_cst_WDG0RSC {
    }
    constraint GRCR_cst_WDG1RSC {
    }
    function new(string name = "CRU_GRCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.WDG0RSC = uvm_reg_field::type_id::create("WDG0RSC",,get_full_name());
        this.WDG0RSC.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.WDG1RSC = uvm_reg_field::type_id::create("WDG1RSC",,get_full_name());
        this.WDG1RSC.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_GRCR)

endclass : ral_reg_CRU_GRCR

class ral_reg_CRU_SSCRSTR extends uvm_reg;
    rand uvm_reg_field SSCRST;
    constraint SSCRSTR_cst_SSCRST {
    }
    function new(string name = "CRU_SSCRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SSCRST = uvm_reg_field::type_id::create("SSCRST",,get_full_name());
        this.SSCRST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_SSCRSTR)

endclass : ral_reg_CRU_SSCRSTR

class ral_reg_CRU_SSWRSTR extends uvm_reg;
    rand uvm_reg_field SSWRST;
    constraint SSWRSTR_cst_SSWRST {
    }
    function new(string name = "CRU_SSWRSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.SSWRST = uvm_reg_field::type_id::create("SSWRST",,get_full_name());
        this.SSWRST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_SSWRSTR)

endclass : ral_reg_CRU_SSWRSTR

class ral_reg_CRU_D1RSTR extends uvm_reg;
    rand uvm_reg_field D1SRST;
    constraint D1RSTR_cst_D1SRST {
    }
    function new(string name = "CRU_D1RSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.D1SRST = uvm_reg_field::type_id::create("D1SRST",,get_full_name());
        this.D1SRST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1RSTR)

endclass : ral_reg_CRU_D1RSTR

class ral_reg_CRU_D2RSTR extends uvm_reg;
    rand uvm_reg_field D2SRST;
    constraint D2RSTR_cst_D2SRST {
    }
    function new(string name = "CRU_D2RSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.D2SRST = uvm_reg_field::type_id::create("D2SRST",,get_full_name());
        this.D2SRST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2RSTR)

endclass : ral_reg_CRU_D2RSTR

class ral_reg_CRU_C1RSTR extends uvm_reg;
    rand uvm_reg_field C1RST;
    constraint C1RSTR_cst_C1RST {
    }
    function new(string name = "CRU_C1RSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.C1RST = uvm_reg_field::type_id::create("C1RST",,get_full_name());
        this.C1RST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_C1RSTR)

endclass : ral_reg_CRU_C1RSTR

class ral_reg_CRU_C2RSTR extends uvm_reg;
    rand uvm_reg_field C2RST;
    constraint C2RSTR_cst_C2RST {
    }
    function new(string name = "CRU_C2RSTR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.C2RST = uvm_reg_field::type_id::create("C2RST",,get_full_name());
        this.C2RST.configure(this, 16, 0, "RW", 0, 16'h0000, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_C2RSTR)

endclass : ral_reg_CRU_C2RSTR

class ral_reg_CRU_SRSR extends uvm_reg;
    rand uvm_reg_field C1RSTF;
    rand uvm_reg_field C2RSTF;
    rand uvm_reg_field D1PORRSTF;
    rand uvm_reg_field D2PORRSTF;
    rand uvm_reg_field BORRSTF;
    rand uvm_reg_field PINRSTF;
    rand uvm_reg_field PORRSTF;
    rand uvm_reg_field SSCRSTF;
    rand uvm_reg_field SSWRSTF;
    rand uvm_reg_field D1SRSTF;
    rand uvm_reg_field C1RSTF_1;
    rand uvm_reg_field C2RSTF_1;
    rand uvm_reg_field WDG0RSTF;
    rand uvm_reg_field WDG1RSTF;
    constraint SRSR_cst_C1RSTF {
    }
    constraint SRSR_cst_C2RSTF {
    }
    constraint SRSR_cst_D1PORRSTF {
    }
    constraint SRSR_cst_D2PORRSTF {
    }
    constraint SRSR_cst_BORRSTF {
    }
    constraint SRSR_cst_PINRSTF {
    }
    constraint SRSR_cst_PORRSTF {
    }
    constraint SRSR_cst_SSCRSTF {
    }
    constraint SRSR_cst_SSWRSTF {
    }
    constraint SRSR_cst_D1SRSTF {
    }
    constraint SRSR_cst_C1RSTF_1 {
    }
    constraint SRSR_cst_C2RSTF_1 {
    }
    constraint SRSR_cst_WDG0RSTF {
    }
    constraint SRSR_cst_WDG1RSTF {
    }
    function new(string name = "CRU_SRSR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.C1RSTF = uvm_reg_field::type_id::create("C1RSTF",,get_full_name());
        this.C1RSTF.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.C2RSTF = uvm_reg_field::type_id::create("C2RSTF",,get_full_name());
        this.C2RSTF.configure(this, 1, 1, "RW", 0, 1'h1, 1, 1, 0);
        this.D1PORRSTF = uvm_reg_field::type_id::create("D1PORRSTF",,get_full_name());
        this.D1PORRSTF.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.D2PORRSTF = uvm_reg_field::type_id::create("D2PORRSTF",,get_full_name());
        this.D2PORRSTF.configure(this, 1, 3, "RW", 0, 1'h1, 1, 1, 0);
        this.BORRSTF = uvm_reg_field::type_id::create("BORRSTF",,get_full_name());
        this.BORRSTF.configure(this, 1, 4, "RW", 0, 1'h0, 1, 1, 0);
        this.PINRSTF = uvm_reg_field::type_id::create("PINRSTF",,get_full_name());
        this.PINRSTF.configure(this, 1, 5, "RW", 0, 1'h1, 1, 1, 0);
        this.PORRSTF = uvm_reg_field::type_id::create("PORRSTF",,get_full_name());
        this.PORRSTF.configure(this, 1, 6, "RW", 0, 1'h1, 1, 1, 0);
        this.SSCRSTF = uvm_reg_field::type_id::create("SSCRSTF",,get_full_name());
        this.SSCRSTF.configure(this, 1, 7, "RW", 0, 1'h0, 1, 1, 0);
        this.SSWRSTF = uvm_reg_field::type_id::create("SSWRSTF",,get_full_name());
        this.SSWRSTF.configure(this, 1, 8, "RW", 0, 1'h0, 1, 1, 0);
        this.D1SRSTF = uvm_reg_field::type_id::create("D1SRSTF",,get_full_name());
        this.D1SRSTF.configure(this, 1, 9, "RW", 0, 1'h0, 1, 1, 0);
        this.C1RSTF_1 = uvm_reg_field::type_id::create("C1RSTF_1",,get_full_name());
        this.C1RSTF_1.configure(this, 1, 11, "RW", 0, 1'h0, 1, 1, 0);
        this.C2RSTF_1 = uvm_reg_field::type_id::create("C2RSTF_1",,get_full_name());
        this.C2RSTF_1.configure(this, 1, 12, "RW", 0, 1'h0, 1, 1, 0);
        this.WDG0RSTF = uvm_reg_field::type_id::create("WDG0RSTF",,get_full_name());
        this.WDG0RSTF.configure(this, 1, 13, "RW", 0, 1'h0, 1, 1, 0);
        this.WDG1RSTF = uvm_reg_field::type_id::create("WDG1RSTF",,get_full_name());
        this.WDG1RSTF.configure(this, 1, 14, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_SRSR)

endclass : ral_reg_CRU_SRSR

class ral_reg_CRU_D1XPCCR extends uvm_reg;
    rand uvm_reg_field NPUEN;
    constraint D1XPCCR_cst_NPUEN {
    }
    function new(string name = "CRU_D1XPCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.NPUEN = uvm_reg_field::type_id::create("NPUEN",,get_full_name());
        this.NPUEN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1XPCCR)

endclass : ral_reg_CRU_D1XPCCR

class ral_reg_CRU_D1HPCCR extends uvm_reg;
    rand uvm_reg_field DMA0EN;
    rand uvm_reg_field QSPI1EN;
    rand uvm_reg_field USB1EN;
    constraint D1HPCCR_cst_DMA0EN {
    }
    constraint D1HPCCR_cst_QSPI1EN {
    }
    constraint D1HPCCR_cst_USB1EN {
    }
    function new(string name = "CRU_D1HPCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA0EN = uvm_reg_field::type_id::create("DMA0EN",,get_full_name());
        this.DMA0EN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.QSPI1EN = uvm_reg_field::type_id::create("QSPI1EN",,get_full_name());
        this.QSPI1EN.configure(this, 1, 10, "RW", 0, 1'h0, 1, 1, 0);
        this.USB1EN = uvm_reg_field::type_id::create("USB1EN",,get_full_name());
        this.USB1EN.configure(this, 1, 14, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1HPCCR)

endclass : ral_reg_CRU_D1HPCCR

class ral_reg_CRU_D2HPCCR extends uvm_reg;
    rand uvm_reg_field DMA2EN;
    rand uvm_reg_field QSPI0EN;
    rand uvm_reg_field USB0EN;
    rand uvm_reg_field AESEN;
    rand uvm_reg_field PKAEN;
    rand uvm_reg_field SHAEN;
    rand uvm_reg_field CRCEN;
    constraint D2HPCCR_cst_DMA2EN {
    }
    constraint D2HPCCR_cst_QSPI0EN {
    }
    constraint D2HPCCR_cst_USB0EN {
    }
    constraint D2HPCCR_cst_AESEN {
    }
    constraint D2HPCCR_cst_PKAEN {
    }
    constraint D2HPCCR_cst_SHAEN {
    }
    constraint D2HPCCR_cst_CRCEN {
    }
    function new(string name = "CRU_D2HPCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DMA2EN = uvm_reg_field::type_id::create("DMA2EN",,get_full_name());
        this.DMA2EN.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 0);
        this.QSPI0EN = uvm_reg_field::type_id::create("QSPI0EN",,get_full_name());
        this.QSPI0EN.configure(this, 1, 9, "RW", 0, 1'h0, 1, 1, 0);
        this.USB0EN = uvm_reg_field::type_id::create("USB0EN",,get_full_name());
        this.USB0EN.configure(this, 1, 13, "RW", 0, 1'h0, 1, 1, 0);
        this.AESEN = uvm_reg_field::type_id::create("AESEN",,get_full_name());
        this.AESEN.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.PKAEN = uvm_reg_field::type_id::create("PKAEN",,get_full_name());
        this.PKAEN.configure(this, 1, 18, "RW", 0, 1'h0, 1, 1, 0);
        this.SHAEN = uvm_reg_field::type_id::create("SHAEN",,get_full_name());
        this.SHAEN.configure(this, 1, 19, "RW", 0, 1'h0, 1, 1, 0);
        this.CRCEN = uvm_reg_field::type_id::create("CRCEN",,get_full_name());
        this.CRCEN.configure(this, 1, 24, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2HPCCR)

endclass : ral_reg_CRU_D2HPCCR

class ral_reg_CRU_D1PPCCR extends uvm_reg;
    rand uvm_reg_field I2C0EN;
    rand uvm_reg_field I2C1EN;
    rand uvm_reg_field UART1ENT;
    rand uvm_reg_field UART2EN;
    rand uvm_reg_field SPI0EN;
    rand uvm_reg_field SPI1EN;
    rand uvm_reg_field WDT1EN;
    constraint D1PPCCR_cst_I2C0EN {
    }
    constraint D1PPCCR_cst_I2C1EN {
    }
    constraint D1PPCCR_cst_UART1ENT {
    }
    constraint D1PPCCR_cst_UART2EN {
    }
    constraint D1PPCCR_cst_SPI0EN {
    }
    constraint D1PPCCR_cst_SPI1EN {
    }
    constraint D1PPCCR_cst_WDT1EN {
    }
    function new(string name = "CRU_D1PPCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.I2C0EN = uvm_reg_field::type_id::create("I2C0EN",,get_full_name());
        this.I2C0EN.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 0);
        this.I2C1EN = uvm_reg_field::type_id::create("I2C1EN",,get_full_name());
        this.I2C1EN.configure(this, 1, 1, "RW", 0, 1'h0, 1, 1, 0);
        this.UART1ENT = uvm_reg_field::type_id::create("UART1ENT",,get_full_name());
        this.UART1ENT.configure(this, 1, 9, "RW", 0, 1'h0, 1, 1, 0);
        this.UART2EN = uvm_reg_field::type_id::create("UART2EN",,get_full_name());
        this.UART2EN.configure(this, 1, 10, "RW", 0, 1'h0, 1, 1, 0);
        this.SPI0EN = uvm_reg_field::type_id::create("SPI0EN",,get_full_name());
        this.SPI0EN.configure(this, 1, 16, "RW", 0, 1'h0, 1, 1, 0);
        this.SPI1EN = uvm_reg_field::type_id::create("SPI1EN",,get_full_name());
        this.SPI1EN.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.WDT1EN = uvm_reg_field::type_id::create("WDT1EN",,get_full_name());
        this.WDT1EN.configure(this, 1, 31, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D1PPCCR)

endclass : ral_reg_CRU_D1PPCCR

class ral_reg_CRU_D2PPCCR extends uvm_reg;
    rand uvm_reg_field UART0EN;
    rand uvm_reg_field I2S0EN;
    rand uvm_reg_field I2S1EN;
    rand uvm_reg_field PDMEN;
    rand uvm_reg_field VADEN;
    rand uvm_reg_field VADENT;
    rand uvm_reg_field ADCEN;
    rand uvm_reg_field GPIOEN;
    rand uvm_reg_field FFTEN;
    rand uvm_reg_field WDT0EN;
    constraint D2PPCCR_cst_UART0EN {
    }
    constraint D2PPCCR_cst_I2S0EN {
    }
    constraint D2PPCCR_cst_I2S1EN {
    }
    constraint D2PPCCR_cst_PDMEN {
    }
    constraint D2PPCCR_cst_VADEN {
    }
    constraint D2PPCCR_cst_VADENT {
    }
    constraint D2PPCCR_cst_ADCEN {
    }
    constraint D2PPCCR_cst_GPIOEN {
    }
    constraint D2PPCCR_cst_FFTEN {
    }
    constraint D2PPCCR_cst_WDT0EN {
    }
    function new(string name = "CRU_D2PPCCR");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.UART0EN = uvm_reg_field::type_id::create("UART0EN",,get_full_name());
        this.UART0EN.configure(this, 1, 8, "RW", 0, 1'h0, 1, 1, 0);
        this.I2S0EN = uvm_reg_field::type_id::create("I2S0EN",,get_full_name());
        this.I2S0EN.configure(this, 1, 16, "RW", 0, 1'h0, 1, 1, 0);
        this.I2S1EN = uvm_reg_field::type_id::create("I2S1EN",,get_full_name());
        this.I2S1EN.configure(this, 1, 17, "RW", 0, 1'h0, 1, 1, 0);
        this.PDMEN = uvm_reg_field::type_id::create("PDMEN",,get_full_name());
        this.PDMEN.configure(this, 1, 20, "RW", 0, 1'h0, 1, 1, 0);
        this.VADEN = uvm_reg_field::type_id::create("VADEN",,get_full_name());
        this.VADEN.configure(this, 1, 23, "RW", 0, 1'h0, 1, 1, 0);
        this.VADENT = uvm_reg_field::type_id::create("VADENT",,get_full_name());
        this.VADENT.configure(this, 1, 24, "RW", 0, 1'h0, 1, 1, 0);
        this.ADCEN = uvm_reg_field::type_id::create("ADCEN",,get_full_name());
        this.ADCEN.configure(this, 1, 25, "RW", 0, 1'h0, 1, 1, 0);
        this.GPIOEN = uvm_reg_field::type_id::create("GPIOEN",,get_full_name());
        this.GPIOEN.configure(this, 1, 26, "RW", 0, 1'h0, 1, 1, 0);
        this.FFTEN = uvm_reg_field::type_id::create("FFTEN",,get_full_name());
        this.FFTEN.configure(this, 1, 29, "RW", 0, 1'h0, 1, 1, 0);
        this.WDT0EN = uvm_reg_field::type_id::create("WDT0EN",,get_full_name());
        this.WDT0EN.configure(this, 1, 30, "RW", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg_CRU_D2PPCCR)

endclass : ral_reg_CRU_D2PPCCR

class ral_block_CRU extends uvm_reg_block;
    rand ral_reg_CRU_CCR CCR;
    rand ral_reg_CRU_SCCR SCCR;
    rand ral_reg_CRU_D1BCCR D1BCCR;
    rand ral_reg_CRU_D2BCCR D2BCCR;
    rand ral_reg_CRU_PLLMCR PLLMCR;
    rand ral_reg_CRU_PLLMFR PLLMFR;
    rand ral_reg_CRU_D1HFCCR D1HFCCR;
    rand ral_reg_CRU_D1HFCSR D1HFCSR;
    rand ral_reg_CRU_D2HFCCR D2HFCCR;
    rand ral_reg_CRU_D2HFCSR D2HFCSR;
    rand ral_reg_CRU_D1PFCCR D1PFCCR;
    rand ral_reg_CRU_D1PFCSR D1PFCSR;
    rand ral_reg_CRU_D2PFCCR D2PFCCR;
    rand ral_reg_CRU_D2PFCSR D2PFCSR;
    rand ral_reg_CRU_COCR COCR;
    rand ral_reg_CRU_CIER CIER;
    rand ral_reg_CRU_CIFR CIFR;
    rand ral_reg_CRU_CICR CICR;
    rand ral_reg_CRU_RTCCR RTCCR;
    rand ral_reg_CRU_XPRSTR XPRSTR;
    rand ral_reg_CRU_H1PRSTR H1PRSTR;
    rand ral_reg_CRU_H2PRSTR H2PRSTR;
    rand ral_reg_CRU_D1PRSTR D1PRSTR;
    rand ral_reg_CRU_D2PRSTR D2PRSTR;
    rand ral_reg_CRU_XPRSFR XPRSFR;
    rand ral_reg_CRU_D1HPRSTR D1HPRSTR;
    rand ral_reg_CRU_D2HPRSTR D2HPRSTR;
    rand ral_reg_CRU_D1PPRSTR D1PPRSTR;
    rand ral_reg_CRU_D2PPRSTR D2PPRSTR;
    rand ral_reg_CRU_GRCR GRCR;
    rand ral_reg_CRU_SSCRSTR SSCRSTR;
    rand ral_reg_CRU_SSWRSTR SSWRSTR;
    rand ral_reg_CRU_D1RSTR D1RSTR;
    rand ral_reg_CRU_D2RSTR D2RSTR;
    rand ral_reg_CRU_C1RSTR C1RSTR;
    rand ral_reg_CRU_C2RSTR C2RSTR;
    rand ral_reg_CRU_SRSR SRSR;
    rand ral_reg_CRU_D1XPCCR D1XPCCR;
    rand ral_reg_CRU_D1HPCCR D1HPCCR;
    rand ral_reg_CRU_D2HPCCR D2HPCCR;
    rand ral_reg_CRU_D1PPCCR D1PPCCR;
    rand ral_reg_CRU_D2PPCCR D2PPCCR;

    function new(string name = "CRU");
        super.new(name, build_coverage(UVM_NO_COVERAGE));
    endfunction: new

    virtual function void build();
        this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.CCR = ral_reg_CRU_CCR::type_id::create("CCR",,get_full_name());
        this.CCR.configure(this, null, "");
        this.CCR.build();
        this.default_map.add_reg(this.CCR, `UVM_REG_ADDR_WIDTH'h00, "RO", 0);

        this.SCCR = ral_reg_CRU_SCCR::type_id::create("SCCR",,get_full_name());
        this.SCCR.configure(this, null, "");
        this.SCCR.build();
        this.default_map.add_reg(this.SCCR, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);

        this.D1BCCR = ral_reg_CRU_D1BCCR::type_id::create("D1BCCR",,get_full_name());
        this.D1BCCR.configure(this, null, "");
        this.D1BCCR.build();
        this.default_map.add_reg(this.D1BCCR, `UVM_REG_ADDR_WIDTH'h14, "RW", 0);

        this.D2BCCR = ral_reg_CRU_D2BCCR::type_id::create("D2BCCR",,get_full_name());
        this.D2BCCR.configure(this, null, "");
        this.D2BCCR.build();
        this.default_map.add_reg(this.D2BCCR, `UVM_REG_ADDR_WIDTH'h18, "RW", 0);

        this.PLLMCR = ral_reg_CRU_PLLMCR::type_id::create("PLLMCR",,get_full_name());
        this.PLLMCR.configure(this, null, "");
        this.PLLMCR.build();
        this.default_map.add_reg(this.PLLMCR, `UVM_REG_ADDR_WIDTH'h20, "RW", 0);

        this.PLLMFR = ral_reg_CRU_PLLMFR::type_id::create("PLLMFR",,get_full_name());
        this.PLLMFR.configure(this, null, "");
        this.PLLMFR.build();
        this.default_map.add_reg(this.PLLMFR, `UVM_REG_ADDR_WIDTH'h24, "RW", 0);

        this.D1HFCCR = ral_reg_CRU_D1HFCCR::type_id::create("D1HFCCR",,get_full_name());
        this.D1HFCCR.configure(this, null, "");
        this.D1HFCCR.build();
        this.default_map.add_reg(this.D1HFCCR, `UVM_REG_ADDR_WIDTH'h40, "RW", 0);

        this.D1HFCSR = ral_reg_CRU_D1HFCSR::type_id::create("D1HFCSR",,get_full_name());
        this.D1HFCSR.configure(this, null, "");
        this.D1HFCSR.build();
        this.default_map.add_reg(this.D1HFCSR, `UVM_REG_ADDR_WIDTH'h44, "RW", 0);

        this.D2HFCCR = ral_reg_CRU_D2HFCCR::type_id::create("D2HFCCR",,get_full_name());
        this.D2HFCCR.configure(this, null, "");
        this.D2HFCCR.build();
        this.default_map.add_reg(this.D2HFCCR, `UVM_REG_ADDR_WIDTH'h48, "RW", 0);

        this.D2HFCSR = ral_reg_CRU_D2HFCSR::type_id::create("D2HFCSR",,get_full_name());
        this.D2HFCSR.configure(this, null, "");
        this.D2HFCSR.build();
        this.default_map.add_reg(this.D2HFCSR, `UVM_REG_ADDR_WIDTH'h4C, "RW", 0);

        this.D1PFCCR = ral_reg_CRU_D1PFCCR::type_id::create("D1PFCCR",,get_full_name());
        this.D1PFCCR.configure(this, null, "");
        this.D1PFCCR.build();
        this.default_map.add_reg(this.D1PFCCR, `UVM_REG_ADDR_WIDTH'h50, "RO", 0);

        this.D1PFCSR = ral_reg_CRU_D1PFCSR::type_id::create("D1PFCSR",,get_full_name());
        this.D1PFCSR.configure(this, null, "");
        this.D1PFCSR.build();
        this.default_map.add_reg(this.D1PFCSR, `UVM_REG_ADDR_WIDTH'h54, "RW", 0);

        this.D2PFCCR = ral_reg_CRU_D2PFCCR::type_id::create("D2PFCCR",,get_full_name());
        this.D2PFCCR.configure(this, null, "");
        this.D2PFCCR.build();
        this.default_map.add_reg(this.D2PFCCR, `UVM_REG_ADDR_WIDTH'h58, "RW", 0);

        this.D2PFCSR = ral_reg_CRU_D2PFCSR::type_id::create("D2PFCSR",,get_full_name());
        this.D2PFCSR.configure(this, null, "");
        this.D2PFCSR.build();
        this.default_map.add_reg(this.D2PFCSR, `UVM_REG_ADDR_WIDTH'h5C, "RW", 0);

        this.COCR = ral_reg_CRU_COCR::type_id::create("COCR",,get_full_name());
        this.COCR.configure(this, null, "");
        this.COCR.build();
        this.default_map.add_reg(this.COCR, `UVM_REG_ADDR_WIDTH'h60, "RW", 0);

        this.CIER = ral_reg_CRU_CIER::type_id::create("CIER",,get_full_name());
        this.CIER.configure(this, null, "");
        this.CIER.build();
        this.default_map.add_reg(this.CIER, `UVM_REG_ADDR_WIDTH'h64, "RW", 0);

        this.CIFR = ral_reg_CRU_CIFR::type_id::create("CIFR",,get_full_name());
        this.CIFR.configure(this, null, "");
        this.CIFR.build();
        this.default_map.add_reg(this.CIFR, `UVM_REG_ADDR_WIDTH'h68, "RW", 0);

        this.CICR = ral_reg_CRU_CICR::type_id::create("CICR",,get_full_name());
        this.CICR.configure(this, null, "");
        this.CICR.build();
        this.default_map.add_reg(this.CICR, `UVM_REG_ADDR_WIDTH'h6C, "RO", 0);

        this.RTCCR = ral_reg_CRU_RTCCR::type_id::create("RTCCR",,get_full_name());
        this.RTCCR.configure(this, null, "");
        this.RTCCR.build();
        this.default_map.add_reg(this.RTCCR, `UVM_REG_ADDR_WIDTH'h70, "RW", 0);

        this.XPRSTR = ral_reg_CRU_XPRSTR::type_id::create("XPRSTR",,get_full_name());
        this.XPRSTR.configure(this, null, "");
        this.XPRSTR.build();
        this.default_map.add_reg(this.XPRSTR, `UVM_REG_ADDR_WIDTH'h80, "RW", 0);

        this.H1PRSTR = ral_reg_CRU_H1PRSTR::type_id::create("H1PRSTR",,get_full_name());
        this.H1PRSTR.configure(this, null, "");
        this.H1PRSTR.build();
        this.default_map.add_reg(this.H1PRSTR, `UVM_REG_ADDR_WIDTH'h84, "RW", 0);

        this.H2PRSTR = ral_reg_CRU_H2PRSTR::type_id::create("H2PRSTR",,get_full_name());
        this.H2PRSTR.configure(this, null, "");
        this.H2PRSTR.build();
        this.default_map.add_reg(this.H2PRSTR, `UVM_REG_ADDR_WIDTH'h88, "RW", 0);

        this.D1PRSTR = ral_reg_CRU_D1PRSTR::type_id::create("D1PRSTR",,get_full_name());
        this.D1PRSTR.configure(this, null, "");
        this.D1PRSTR.build();
        this.default_map.add_reg(this.D1PRSTR, `UVM_REG_ADDR_WIDTH'h8C, "RW", 0);

        this.D2PRSTR = ral_reg_CRU_D2PRSTR::type_id::create("D2PRSTR",,get_full_name());
        this.D2PRSTR.configure(this, null, "");
        this.D2PRSTR.build();
        this.default_map.add_reg(this.D2PRSTR, `UVM_REG_ADDR_WIDTH'h90, "RW", 0);

        this.XPRSFR = ral_reg_CRU_XPRSFR::type_id::create("XPRSFR",,get_full_name());
        this.XPRSFR.configure(this, null, "");
        this.XPRSFR.build();
        this.default_map.add_reg(this.XPRSFR, `UVM_REG_ADDR_WIDTH'h98, "RW", 0);

        this.D1HPRSTR = ral_reg_CRU_D1HPRSTR::type_id::create("D1HPRSTR",,get_full_name());
        this.D1HPRSTR.configure(this, null, "");
        this.D1HPRSTR.build();
        this.default_map.add_reg(this.D1HPRSTR, `UVM_REG_ADDR_WIDTH'h9C, "RW", 0);

        this.D2HPRSTR = ral_reg_CRU_D2HPRSTR::type_id::create("D2HPRSTR",,get_full_name());
        this.D2HPRSTR.configure(this, null, "");
        this.D2HPRSTR.build();
        this.default_map.add_reg(this.D2HPRSTR, `UVM_REG_ADDR_WIDTH'hA0, "RW", 0);

        this.D1PPRSTR = ral_reg_CRU_D1PPRSTR::type_id::create("D1PPRSTR",,get_full_name());
        this.D1PPRSTR.configure(this, null, "");
        this.D1PPRSTR.build();
        this.default_map.add_reg(this.D1PPRSTR, `UVM_REG_ADDR_WIDTH'hA4, "RW", 0);

        this.D2PPRSTR = ral_reg_CRU_D2PPRSTR::type_id::create("D2PPRSTR",,get_full_name());
        this.D2PPRSTR.configure(this, null, "");
        this.D2PPRSTR.build();
        this.default_map.add_reg(this.D2PPRSTR, `UVM_REG_ADDR_WIDTH'hA8, "RW", 0);

        this.GRCR = ral_reg_CRU_GRCR::type_id::create("GRCR",,get_full_name());
        this.GRCR.configure(this, null, "");
        this.GRCR.build();
        this.default_map.add_reg(this.GRCR, `UVM_REG_ADDR_WIDTH'hB0, "RW", 0);

        this.SSCRSTR = ral_reg_CRU_SSCRSTR::type_id::create("SSCRSTR",,get_full_name());
        this.SSCRSTR.configure(this, null, "");
        this.SSCRSTR.build();
        this.default_map.add_reg(this.SSCRSTR, `UVM_REG_ADDR_WIDTH'hC0, "WO", 0);

        this.SSWRSTR = ral_reg_CRU_SSWRSTR::type_id::create("SSWRSTR",,get_full_name());
        this.SSWRSTR.configure(this, null, "");
        this.SSWRSTR.build();
        this.default_map.add_reg(this.SSWRSTR, `UVM_REG_ADDR_WIDTH'hC4, "WO", 0);

        this.D1RSTR = ral_reg_CRU_D1RSTR::type_id::create("D1RSTR",,get_full_name());
        this.D1RSTR.configure(this, null, "");
        this.D1RSTR.build();
        this.default_map.add_reg(this.D1RSTR, `UVM_REG_ADDR_WIDTH'hC8, "WO", 0);

        this.D2RSTR = ral_reg_CRU_D2RSTR::type_id::create("D2RSTR",,get_full_name());
        this.D2RSTR.configure(this, null, "");
        this.D2RSTR.build();
        this.default_map.add_reg(this.D2RSTR, `UVM_REG_ADDR_WIDTH'hCC, "WO", 0);

        this.C1RSTR = ral_reg_CRU_C1RSTR::type_id::create("C1RSTR",,get_full_name());
        this.C1RSTR.configure(this, null, "");
        this.C1RSTR.build();
        this.default_map.add_reg(this.C1RSTR, `UVM_REG_ADDR_WIDTH'hD0, "WO", 0);

        this.C2RSTR = ral_reg_CRU_C2RSTR::type_id::create("C2RSTR",,get_full_name());
        this.C2RSTR.configure(this, null, "");
        this.C2RSTR.build();
        this.default_map.add_reg(this.C2RSTR, `UVM_REG_ADDR_WIDTH'hD4, "WO", 0);

        this.SRSR = ral_reg_CRU_SRSR::type_id::create("SRSR",,get_full_name());
        this.SRSR.configure(this, null, "");
        this.SRSR.build();
        this.default_map.add_reg(this.SRSR, `UVM_REG_ADDR_WIDTH'hE0, "RW", 0);

        this.D1XPCCR = ral_reg_CRU_D1XPCCR::type_id::create("D1XPCCR",,get_full_name());
        this.D1XPCCR.configure(this, null, "");
        this.D1XPCCR.build();
        this.default_map.add_reg(this.D1XPCCR, `UVM_REG_ADDR_WIDTH'hE4, "RW", 0);

        this.D1HPCCR = ral_reg_CRU_D1HPCCR::type_id::create("D1HPCCR",,get_full_name());
        this.D1HPCCR.configure(this, null, "");
        this.D1HPCCR.build();
        this.default_map.add_reg(this.D1HPCCR, `UVM_REG_ADDR_WIDTH'hE8, "RW", 0);

        this.D2HPCCR = ral_reg_CRU_D2HPCCR::type_id::create("D2HPCCR",,get_full_name());
        this.D2HPCCR.configure(this, null, "");
        this.D2HPCCR.build();
        this.default_map.add_reg(this.D2HPCCR, `UVM_REG_ADDR_WIDTH'hEC, "RW", 0);

        this.D1PPCCR = ral_reg_CRU_D1PPCCR::type_id::create("D1PPCCR",,get_full_name());
        this.D1PPCCR.configure(this, null, "");
        this.D1PPCCR.build();
        this.default_map.add_reg(this.D1PPCCR, `UVM_REG_ADDR_WIDTH'hF0, "RW", 0);

        this.D2PPCCR = ral_reg_CRU_D2PPCCR::type_id::create("D2PPCCR",,get_full_name());
        this.D2PPCCR.configure(this, null, "");
        this.D2PPCCR.build();
        this.default_map.add_reg(this.D2PPCCR, `UVM_REG_ADDR_WIDTH'hF4, "RW", 0);

    endfunction : build

    `uvm_object_utils(ral_block_CRU)
endclass : ral_block_CRU

`endif // RAL_MOD_CRU