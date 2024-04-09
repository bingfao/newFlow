/**
 * @file    wdt.sv
 * @author  CIP Application Team
 # @brief   WDT Register struct Header File.
 *          This file contains:
 #           - Data structures and the address mapping for
 *             WDT peripherals
 #           - Including peripheral's registers declarations and bits
 *             definition
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

`ifndef RAL_MOD_WDT
`define RAL_MOD_WDT

import uvm_pkg::*;


class ral_reg__CTRL extends uvm_reg;
    rand uvm_reg_field WDTEN;
    rand uvm_reg_field VBUSEN;
    rand uvm_reg_field ONKEYEN;
    rand uvm_reg_field RESEN;
    rand uvm_reg_field IMK;
    constraint CTRL_cst_WDTEN {
    }
    constraint CTRL_cst_VBUSEN {
    }
    constraint CTRL_cst_ONKEYEN {
    }
    constraint CTRL_cst_RESEN {
    }
    constraint CTRL_cst_IMK {
    }
    function new(string name = "_CTRL");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.WDTEN = uvm_reg_field::type_id::create("WDTEN",,get_full_name());
        this.WDTEN.configure(this, 1, 0, "RW", 0, 1'h00, 1, 1, 0);
        this.VBUSEN = uvm_reg_field::type_id::create("VBUSEN",,get_full_name());
        this.VBUSEN.configure(this, 1, 1, "RW", 0, 1'h000000, 1, 1, 0);
        this.ONKEYEN = uvm_reg_field::type_id::create("ONKEYEN",,get_full_name());
        this.ONKEYEN.configure(this, 1, 2, "RW", 0, 1'h000000, 1, 1, 0);
        this.RESEN = uvm_reg_field::type_id::create("RESEN",,get_full_name());
        this.RESEN.configure(this, 1, 3, "RW", 0, 1'h000000, 1, 1, 0);
        this.IMK = uvm_reg_field::type_id::create("IMK",,get_full_name());
        this.IMK.configure(this, 1, 4, "RW", 0, 1'h000000, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg__CTRL)

endclass : ral_reg__CTRL

class ral_reg__INTR_LOAD extends uvm_reg;
    rand uvm_reg_field INC;
    constraint INTR_LOAD_cst_INC {
    }
    function new(string name = "_INTR_LOAD");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.INC = uvm_reg_field::type_id::create("INC",,get_full_name());
        this.INC.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg__INTR_LOAD)

endclass : ral_reg__INTR_LOAD

class ral_reg__MAIN_LOAD extends uvm_reg;
    rand uvm_reg_field MAC;
    constraint MAIN_LOAD_cst_MAC {
    }
    function new(string name = "_MAIN_LOAD");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.MAC = uvm_reg_field::type_id::create("MAC",,get_full_name());
        this.MAC.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg__MAIN_LOAD)

endclass : ral_reg__MAIN_LOAD

class ral_reg__COUNTER extends uvm_reg;
    rand uvm_reg_field CINC;
    constraint COUNTER_cst_CINC {
    }
    function new(string name = "_COUNTER");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.CINC = uvm_reg_field::type_id::create("CINC",,get_full_name());
        this.CINC.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg__COUNTER)

endclass : ral_reg__COUNTER

class ral_reg__INTRCTER extends uvm_reg;
    rand uvm_reg_field DTR;
    constraint INTRCTER_cst_DTR {
    }
    function new(string name = "_INTRCTER");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.DTR = uvm_reg_field::type_id::create("DTR",,get_full_name());
        this.DTR.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg__INTRCTER)

endclass : ral_reg__INTRCTER

class ral_reg__WSTROBE extends uvm_reg;
    rand uvm_reg_field RE INTR;
    rand uvm_reg_field RE MAIN;
    rand uvm_reg_field CLR INT;
    constraint WSTROBE_cst_RE INTR {
    }
    constraint WSTROBE_cst_RE MAIN {
    }
    constraint WSTROBE_cst_CLR INT {
    }
    function new(string name = "_WSTROBE");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.RE INTR = uvm_reg_field::type_id::create("RE INTR",,get_full_name());
        this.RE INTR.configure(this, 1, 0, "WO", 0, 1'h0, 1, 1, 0);
        this.RE MAIN = uvm_reg_field::type_id::create("RE MAIN",,get_full_name());
        this.RE MAIN.configure(this, 1, 1, "WO", 0, 1'h0, 1, 1, 0);
        this.CLR INT = uvm_reg_field::type_id::create("CLR INT",,get_full_name());
        this.CLR INT.configure(this, 1, 2, "WO", 0, 1'h0, 1, 1, 0);
    endfunction: build

    `uvm_object_utils(ral_reg__WSTROBE)

endclass : ral_reg__WSTROBE

class ral_reg__IWDT_OVFLOW extends uvm_reg;
    uvm_reg_field INF;
    constraint IWDT_OVFLOW_cst_INF {
    }
    function new(string name = "_IWDT_OVFLOW");
        super.new(name, 32,build_coverage(UVM_NO_COVERAGE));
    endfunction: new
    virtual function void build();
        this.INF = uvm_reg_field::type_id::create("INF",,get_full_name());
        this.INF.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
    endfunction: build

    `uvm_object_utils(ral_reg__IWDT_OVFLOW)

endclass : ral_reg__IWDT_OVFLOW

class ral_block_ extends uvm_reg_block;
    rand ral_reg__CTRL CTRL;
    rand ral_reg__INTR_LOAD INTR_LOAD;
    rand ral_reg__MAIN_LOAD MAIN_LOAD;
    rand ral_reg__COUNTER COUNTER;
    rand ral_reg__INTRCTER INTRCTER;
    rand ral_reg__WSTROBE WSTROBE;
    rand ral_reg__IWDT_OVFLOW IWDT_OVFLOW;

    function new(string name = "");
        super.new(name, build_coverage(UVM_NO_COVERAGE));
    endfunction: new

    virtual function void build();
        this.default_map = create_map("", 0, 4, UVM_LITTLE_ENDIAN, 0);
        this.CTRL = ral_reg__CTRL::type_id::create("CTRL",,get_full_name());
        this.CTRL.configure(this, null, "");
        this.CTRL.build();
        this.default_map.add_reg(this.CTRL, `UVM_REG_ADDR_WIDTH'h00, "RW", 0);

        this.INTR_LOAD = ral_reg__INTR_LOAD::type_id::create("INTR_LOAD",,get_full_name());
        this.INTR_LOAD.configure(this, null, "");
        this.INTR_LOAD.build();
        this.default_map.add_reg(this.INTR_LOAD, `UVM_REG_ADDR_WIDTH'h04, "RW", 0);

        this.MAIN_LOAD = ral_reg__MAIN_LOAD::type_id::create("MAIN_LOAD",,get_full_name());
        this.MAIN_LOAD.configure(this, null, "");
        this.MAIN_LOAD.build();
        this.default_map.add_reg(this.MAIN_LOAD, `UVM_REG_ADDR_WIDTH'h08, "RW", 0);

        this.COUNTER = ral_reg__COUNTER::type_id::create("COUNTER",,get_full_name());
        this.COUNTER.configure(this, null, "");
        this.COUNTER.build();
        this.default_map.add_reg(this.COUNTER, `UVM_REG_ADDR_WIDTH'h0C, "RW", 0);

        this.INTRCTER = ral_reg__INTRCTER::type_id::create("INTRCTER",,get_full_name());
        this.INTRCTER.configure(this, null, "");
        this.INTRCTER.build();
        this.default_map.add_reg(this.INTRCTER, `UVM_REG_ADDR_WIDTH'h10, "RW", 0);

        this.WSTROBE = ral_reg__WSTROBE::type_id::create("WSTROBE",,get_full_name());
        this.WSTROBE.configure(this, null, "");
        this.WSTROBE.build();
        this.default_map.add_reg(this.WSTROBE, `UVM_REG_ADDR_WIDTH'h14, "RW", 0);

        this.IWDT_OVFLOW = ral_reg__IWDT_OVFLOW::type_id::create("IWDT_OVFLOW",,get_full_name());
        this.IWDT_OVFLOW.configure(this, null, "");
        this.IWDT_OVFLOW.build();
        this.default_map.add_reg(this.IWDT_OVFLOW, `UVM_REG_ADDR_WIDTH'h18, "RO", 0);

    endfunction : build

    `uvm_object_utils(ral_block_)
endclass : ral_block_

`endif // RAL_MOD_WDT