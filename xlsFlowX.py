#####################################################################
# use openpyxl to deal with excel file to export .h and .svh for DV
#####################################################################

# Author: binga.gao
# date: 2023-10-24
# change-desc:
#             change-date: 2023-10-24
#             1. change use xlrd to xlsx
#             2. show check error info in xlsx file with border color red
#             3. support virtual reg and  reg  group


import re
from datetime import date
import os
import copy
from sys import flags
from openpyxl import load_workbook
from openpyxl.worksheet import worksheet
from openpyxl.styles import colors, Border, Side, Font, Color


# import xlrd


char_arr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
# busTypestr_arr = ("AHB", "AXI")
bitWidMask_arr = ('0x01', '0x03', '0x07', '0x0F', '0x1F', '0x3F', '0x7F', '0xFF', '0x01FF', '0x03FF', '0x07FF', '0x0FFF', '0x1FFF', '0x3FFF', '0x7FFF', '0xFFFF',
                  '0x01FFFF', '0x03FFFF', '0x07FFFF', '0x0FFFFF', '0x1FFFFF', '0x3FFFFF', '0x7FFFFF', '0xFFFFFF', '0x01FFFFFF', '0x03FFFFFF', '0x07FFFFFF', '0x0FFFFFFF', '0x1FFFFFFF', '0x3FFFFFFF', '0x7FFFFFFF', '0xFFFFFFFF',
                  '0x01FFFFFF', '0x03FFFFFF', '0x07FFFFFF', '0x0FFFFFFF', '0x1FFFFFFF', '0x3FFFFFFF', '0x7FFFFFFF', '0xFFFFFFFF', '0x01FFFFFF', '0x03FFFFFFFF', '0x07FFFFFFFF', '0x0FFFFFFFFF', '0x1FFFFFFFFF', '0x3FFFFFFFFF', '0x7FFFFFFFFF', '0xFFFFFFFFFF',
                  '0x01FFFFFFFF', '0x03FFFFFFFF', '0x07FFFFFFFF', '0x0FFFFFFFFF', '0x1FFFFFFFFF', '0x3FFFFFFFFF', '0x7FFFFFFFFF', '0xFFFFFFFFFF', '0x01FFFFFFFF', '0x03FFFFFFFFFF', '0x07FFFFFFFFFF', '0x0FFFFFFFFFFF', '0x1FFFFFFFFFFF', '0x3FFFFFFFFFFF', '0x7FFFFFFFFFFF', '0xFFFFFFFFFFFF')

fieldRWOp_arr = ('rw', 'ro', 'wo', 'w1', 'w1c', 'rc', 'rs', 'wrc', 'wrs', 'wc', 'ws', 'wsrc', 'wcrs', 'w1s', 'w1t', 'w0c',
                 'w0s', 'w0t', 'w1src', 'w1crs', 'w0src', 'w0crs', 'woc', 'wos', 'wo1')

cst_tab_str='    '  #用来替代\t的格式化用字符

# RW, RO, WO, W1, W1C, RC, RS, WRC, WRS, WC, WS, WSRC, WCRS, W1S, W1T, W0C,
#                  W0S, W0T, W1SRC, W1CRS, W0SRC, W0CRS, W0C, W0S, WO1

# uint_type_arr = ('uint8_t', 'uint16_t', 'uint32_t', 'uint64_t')


# class St_Filed_info:
#     def __init__(self, name, attr):
#         self.end_bit = 31
#         self.start_bit = 0
#         self.attribute = attr
#         self.defaultValue = 0
#         self.field_name = name
#         self.field_comments = ''
#         self.field_enumstr = ''
#         self.field_constr = ''
#         self.bRandom_Enable = False

#     def field_info_str(self):
#         out_str = f'fieldname: {self.field_name}, end_bit: {self.end_bit}, start_bit: {self.start_bit}, attribute: {self.attribute} \n , defaultValue: {hex(self.defaultValue)}, comments: {self.field_comments}, enum: {self.field_enumstr}'
#         return out_str


# class St_Reg_info:
#     def __init__(self, name):
#         self.field_list = []
#         self.reg_name = name
#         self.offset = 0
#         self.desc = ''          # 寄存器的描述
#         self.bVirtual = False
#         self.bGroup_start = 0   # 是否是多组的起始
#         self.bGroup_stop = 0    # 是否是多组的结束
#         self.group_dim = 0      # 有几组
#         self.group_size = 0     # reg组的size
#         self.group_name = ''
#         self.group_index = -1

#     def field_count(self):
#         return len(self.field_list)

#     def is_fieldInReg(self, fd_name):
#         bIn = False
#         for fd in self.field_list:
#             if fd.field_name == fd_name:
#                 bIn = True
#                 break
#         return bIn

#     def add_field(self, fd):
#         self.field_list.append(fd)

#     def getCHeaderString(self):
#         return ""

#     def reg_info_str(self):
#         group_info = ''
#         if self.group_index >= 0:
#             group_info = f'group: {self.group_name}, group_index: {self.group_index}, '
#         out_str = f'regname: {self.reg_name}, offset_addr: {hex(self.offset)}, {group_info} virtual: {self.bVirtual}'

#         # for f in self.field_list:
#         #     out_str += "\n"+f.field_info_str()
#         return out_str


# class St_Module_info:
#     def __init__(self, name):
#         self.module_name = name
#         self.bus_baseAddr = 0
#         self.addr_width = 32
#         self.data_width = 32
#         self.bus_type = 0
#         self.hdl_path = 'NULL'
#         self.reg_list = []

#     def reg_count(self):
#         return len(self.reg_list)

#     def getAllFieldCount(self):
#         nCount = 0
#         for r in self.reg_list:
#             nCount += r.field_count()
#         return nCount

#     def appendRegInfo(self, reginfo):
#         self.reg_list.append(reginfo)

#     def getCHeaderString(self):
#         return ""

#     def getCSourceString(self):
#         return ""

#     def module_info_str(self):
#         out_str = f'moduleName: {self.module_name}, bus_type: {self.bus_type}, bus_addr: {hex(self.bus_baseAddr)}'
#         for r in self.reg_list:
#             out_str += "\n"+r.reg_info_str()
#         return out_str

class St_CPU:
    def __init__(self, name):
        self.name = name
        self.revision = ''
        self.derivedFrom = ''
        self.endian = 'little'
        self.srs = False
        self.mpu = False
        self.fpu = False
        self.dsp = False
        self.icache = False
        self.dicache = False
        self.itcm = False
        self.dicm = False
        self.l2cache = False

    def get_inst_str(self):
        return f'name:{self.name},derivedFrom:{self.derivedFrom},revision:{self.revision},endian:{self.endian},srs:{self.srs},mpu:{self.mpu},fpu:{self.fpu},dsp:{self.dsp},icache:{self.icache},dcache:{self.dicache},itcm:{self.itcm},dtcm:{self.dicm},l2cache:{self.l2cache}'


class St_Interrupt:
    def __init__(self, name):
        self.name = name
        self.value = 0
        self.desc = ''

    def get_inst_str(self):
        return f'Interrupt:  name:{self.name},value:{self.value},desc:{self.desc}'


class St_AddressBlock:
    def __init__(self, offset):
        self.offset = offset
        self.size = 0
        self.usage = ''

    def get_inst_str(self):
        return f'AddressBlock:  offset:{self.offset},size:{self.size},usage:{self.usage}'


class St_Memory:
    def __init__(self, name):
        self.name = name
        self.derivedFrom = ''
        self.addrBase = 0
        self.addrOffset = 0
        self.size = 0
        self.access = ''
        self.usage = ''
        self.processor = ''
        self.desc = ''

    def get_inst_str(self):
        return f'Memory:  name:{self.name},derivedFrom:{self.derivedFrom},addrBase:{self.addrBase},addrOffset:{self.addrOffset},size:{self.size},access:{self.access},usage:{self.usage},proc:{self.processor},desc:{self.desc}'


class St_Enum_Val:
    def __init__(self, name, val):
        self.name = name
        self.desc = ''
        self.value = val

    def get_inst_str(self):
        return f'enum {self.name} = {self.value}\t // {self.desc}'


class St_Field:
    def __init__(self, name):
        self.name = name
        self.desc = ''
        self.offset = 0
        self.bitWidth = 1
        self.access = 'RW'
        self.defaultVal = 0
        self.enumVals = []
        self.writeConstraint = ''  # enum or range
        self.range_min = None
        self.range_max = None

    def get_inst_str(self):
        inst_str = 'Field:\n'
        inst_str += f'\tname:{self.name},desc:{self.desc},offset:{self.offset},bitWid:{self.bitWidth},access:{
            self.access},defaultVal:{self.defaultVal},writeConst:{self.writeConstraint},range:[{self.range_min}:{self.range_max}]'
        if self.enumVals:
            inst_str += '\n\tenum: \n'
            for e in self.enumVals:
                inst_str += '\t'+e.get_inst_str()+'\n'
        return inst_str


class St_Register:
    def __init__(self, name, access, size=32):
        self.name = name
        self.dim = 0
        self.dimIncrement = 0
        self.dimName = ''
        self.desc = ''
        self.cRegName = ''
        self.alterReg = ''   # 别名，
        self.alterGroupName = ''
        self.addressOffset = ''
        self.size = size
        self.access = access
        self.resetValue = ''
        self.resetMask = ''
        self.dataType = 'uint32_t'
        self.fd_lst = []

    def getRegName(self):
        cRegName = self.name
        if self.cRegName:
            cRegName = self.cRegName
        return cRegName

    def get_inst_str(self):
        inst_str = 'Register:\n'
        inst_str += f'name:{self.name},dim:{self.dim},dimIncr:{self.dimIncrement},desc:{self.desc},cRegNmae:{self.cRegName},alterReg:{
            self.alterReg},alterGroup:{self.alterGroupName},offset:{self.addressOffset},size:{self.size},access:{self.access}\n'
        for e in self.fd_lst:
            inst_str += '\t'+e.get_inst_str()+'\n'
        return inst_str


class St_Cluster:
    def __init__(self, name):
        self.name = name
        self.dim = 0
        self.dimIncrement = 0
        self.dimName = ''
        self.desc = ''
        self.addressOffset = ''
        self.alterCluster = ''   # 别名，
        self.alterGroupName = ''
        self.cStructName = ''
        self.chd_clust_reg_list = []  # 子cluster或者register
        self.rowStart = 0
        self.rowEnd = 0

    def get_inst_str(self):
        inst_str = 'Cluster:\n'
        inst_str += f'name:{self.name},dim:{self.dim},dimIncr:{self.dimIncrement},desc:{self.desc},addrOffser:{
            self.addressOffset},alter:{self.alterCluster},alterGroupName:{self.alterGroupName},cStructName:{self.cStructName}\n'
        for e in self.chd_clust_reg_list:
            inst_str += '\t'+e.get_inst_str()+'\n'
        return inst_str


class St_Peripheral:
    def __init__(self, name):
        self.name = name
        self.derivedFrom = ''
        self.processor = ''
        self.alias = ''
        self.prefix = ''
        self.suffix = ''
        self.moduleName = ''
        self.inst_Name = ''
        self.desc = ''
        self.cStructName = ''
        self.baseAddr = 0
        self.addrBlocksRowindex = 0
        self.addrBlocks = []
        self.interuptsRowindex = 0
        self.interupts = []
        self.clust_reg_lst = []  # cluster or register

    def get_inst_str(self):
        inst_str = 'Peripheral: \n'
        inst_str += f'name:{self.name}, derivedFrom:{self.derivedFrom},proc:{self.processor},alias:{self.alias},moduleName:{self.moduleName},instName:{self.inst_Name},hStructName:{
            self.cStructName},prefix:{self.prefix},suffix:{self.suffix},addrBlocks:{self.addrBlocksRowindex},interupt:{self.interuptsRowindex},desc:{self.desc}\n'
        for adb in self.addrBlocks:
            inst_str += '\t'+adb.get_inst_str()+'\n'
        for interu in self.interupts:
            inst_str += '\t'+interu.get_inst_str()+'\n'
        return inst_str


class St_Device:
    def __init__(self, name):
        self.name = name
        self.vendor = ''
        self.version = ''
        self.series = ''
        self.desc = ''
        self.cpus = []
        self.width = 32
        self.memories = []
        self.peripherals = {}
        self.interupts = set()

    def get_inst_str(self):
        inst_str = 'Device: \n'
        inst_str += f'name:{self.name}, vendor:{self.vendor}, version:{
            self.version}, series:{self.series}, desc: {self.desc}\n'
        for cpu in self.cpus:
            inst_str += '\t'+cpu.get_inst_str()+'\n'
        for mem in self.memories:
            inst_str += '\t'+mem.get_inst_str()+'\n'
        return inst_str


class St_ClusterInnerRange:
    def __init__(self, start) -> None:
        self.rowStart = start
        self.rowEnd = 0
        self.parentClustRow = 0

    def get_inst_str(self):
        return f'rowStart: {self.rowStart}, rowEnd: {self.rowEnd}, parentClusetrRow:{self.parentClustRow}'


class St_clusterFlag_info:
    def __init__(self) -> None:
        self.row = 0
        self.bEnd = False


def markCell_InvalidFunc2(ws, row, col, clr='ff0000'):
    double = Side(border_style="double", color=clr)
    border = Border(left=double,
                    right=double,
                    top=double,
                    bottom=double)
    cell = ws.cell(row, col)
    cell.border = border
    cell.font = Font(color="FF0000")


def markCell_InvalidFunc(ws, cellstr, clr='ff0000'):
    double = Side(border_style="double", color=clr)
    border = Border(left=double,
                    right=double,
                    top=double,
                    bottom=double)
    cell = ws[cellstr]
    cell.border = border
    cell.font = Font(color="FF0000")


def isUnallowedVarName(strVal):
    # strVal = strVal.strip()
    pattern = '^[a-zA-Z_][a-zA-Z0-9_]*$'
    matchObject = re.search(pattern, strVal)
    # if matchObject is None:
    #     print('%s is not Id' % id)
    # else:
    #     print('%s is Id' % id)
    return (matchObject is None)


def checkModuleSheetValue(ws, sheetName):  # 传入worksheet
    print("ModuleSheet : "+sheetName)
    bMod_CheckErr = False
    perip_title = ws['A1'].value
    if perip_title != 'peripheral:':
        markCell_InvalidFunc(ws, 'A1')
        print('peripheral: must be in the A1 cell!')
        return False
    # 从第三行开始读取直到空行
    nRows = ws.max_row
    flag_names = ('addressBlocks:', 'interrupts:',
                  'cluster:', 'end cluster', 'register:')
    flag_dict = {}
    flag_rows = []
    emptyA_rows = []
    perip_list = []
    interupts_set = set()
    row = 3

    while row <= nRows:
        val = ws.cell(row, 1).value
        if val in flag_names:
            flag_rows.append(row)
            if val in flag_dict:
                flag_dict[val].append(row)
            else:
                flag_dict[val] = [row]
            pass
        elif not val:
            emptyA_rows.append(row)
        row += 1
    if flag_dict:
        print(flag_dict)
    # flag_rows.sort()
    row = 3
    row_end = nRows
    if flag_rows:
        row_end = flag_rows[0]
    index = 0
    mod_name = ''
    struct_name = ''
    prefix_str = ''
    suffix_str = ''
    while row < row_end:
        if row not in emptyA_rows:
            name = ws.cell(row, 1).value
            st_perip = St_Peripheral(name)
            alias = ws.cell(row, 5).value
            derivedFrom = ws.cell(row, 3).value
            if alias:
                for perip in perip_list:
                    if perip.name == alias:
                        st_perip = copy.copy(perip)
                        break
            else:
                if derivedFrom:
                    for perip in perip_list:
                        if perip.name == derivedFrom:
                            st_perip = copy.copy(perip)
                            break
            st_perip.alias = alias
            st_perip.derivedFrom = derivedFrom
            st_perip.name = name

            baseAddr = ws.cell(row, 2).value
            if baseAddr:
                st_perip.baseAddr = baseAddr
            processor = ws.cell(row, 4).value
            if processor:
                st_perip.processor = processor
            mod_inst_name = ws.cell(row, 6).value
            if index == 0 and mod_inst_name:
                mod_name = mod_inst_name
            if mod_inst_name and mod_inst_name != mod_name:
                print(f'moduleName must be same at row: {row}')
                markCell_InvalidFunc2(ws, row, 6)
                bMod_CheckErr = True
            if mod_inst_name:
                st_perip.moduleName = mod_name
            inst_Name = ws.cell(row, 7).value
            if inst_Name:
                st_perip.inst_Name = inst_Name

            mod_inst_structName = ws.cell(row, 8).value
            if index == 0 and mod_inst_structName:
                struct_name = mod_inst_structName
            if mod_inst_structName and mod_inst_structName != struct_name:
                print(f'headerStructName must be same at row: {row}')
                markCell_InvalidFunc2(ws, row, 8)
                bMod_CheckErr = True
            if mod_inst_structName:
                st_perip.cStructName = struct_name

            mod_inst_prefix = ws.cell(row, 9).value
            if index == 0 and mod_inst_prefix:
                prefix_str = mod_inst_prefix
            if mod_inst_prefix and mod_inst_prefix != prefix_str:
                print(f'prefixToName must be same at row: {row}')
                markCell_InvalidFunc2(ws, row, 9)
                bMod_CheckErr = True
            if prefix_str:
                st_perip.prefix = prefix_str

            mod_inst_suffix = ws.cell(row, 10).value
            if index == 0 and mod_inst_suffix:
                suffix_str = mod_inst_suffix
            if mod_inst_suffix and mod_inst_suffix != suffix_str:
                print(f'suffixToName must be same at row: {row}')
                markCell_InvalidFunc2(ws, row, 10)
                bMod_CheckErr = True
            if suffix_str:
                st_perip.suffix = suffix_str
            desc = ws.cell(row, 13).value
            if desc:
                st_perip.desc = desc
            addri = ws.cell(row, 11).value
            if addri:
                bIn = False
                if isinstance(addri, str) and addri.startswith('A'):
                    r_i = addri[1:]
                    if r_i.isdecimal():
                        st_perip.addrBlocksRowindex = int(r_i)
                        if st_perip.addrBlocksRowindex in flag_dict['addressBlocks:']:
                            bIn = True
                if not bIn:
                    print(
                        f'addressBlocks must be the cell of addressBlocks at row: {row}')
                    markCell_InvalidFunc2(ws, row, 11)
                    bMod_CheckErr = True

            interi = ws.cell(row, 12).value
            if interi:
                bIn = False
                if isinstance(interi, str) and interi.startswith('A'):
                    r_i = interi[1:]
                    if r_i.isdecimal():
                        st_perip.interuptsRowindex = int(r_i)
                        if st_perip.interuptsRowindex in flag_dict['interrupts:']:
                            bIn = True
                if not bIn:
                    print(
                        f'interrupts must be the cell of interrupts at row: {row}')
                    markCell_InvalidFunc2(ws, row, 12)
                    bMod_CheckErr = True
            perip_list.append(st_perip)
        row += 1

    # 处理各Flag
    flags_count = len(flag_rows)
    addrblocks_flag_lst = flag_dict['addressBlocks:']
    addrb_dict = {}
    if addrblocks_flag_lst:
        for a_i in addrblocks_flag_lst:
            addrb_lst = []
            row_end = nRows
            f_i = flag_rows.index(a_i)
            if f_i < flags_count-1:
                row_end = flag_rows[f_i+1] - 1
            # 读取addrblocks
            row = a_i+2
            while row <= row_end:
                if row not in emptyA_rows:
                    offset = ws.cell(row, 1).value
                    size = ws.cell(row, 2).value
                    usage = ws.cell(row, 3).value
                    st_addrb = St_AddressBlock(offset)
                    st_addrb.size = size
                    st_addrb.usage = usage
                    addrb_lst.append(st_addrb)
                row += 1
            addrb_dict[a_i] = addrb_lst

    interrupts_flag_lst = flag_dict['interrupts:']
    interu_dict = {}
    if interrupts_flag_lst:
        for a_i in interrupts_flag_lst:
            interu_lst = []
            row_end = nRows
            f_i = flag_rows.index(a_i)
            if f_i < flags_count-1:
                row_end = flag_rows[f_i+1] - 1
            # 读取addrblocks
            row = a_i+2
            while row <= row_end:
                if row not in emptyA_rows:
                    name = ws.cell(row, 1).value
                    val = ws.cell(row, 2).value
                    desc = ws.cell(row, 3).value
                    st_inter = St_Interrupt(name)
                    st_inter.value = val
                    st_inter.desc = desc
                    interu_lst.append(st_inter)
                    interupts_set.add(st_inter)
                row += 1
            interu_dict[a_i] = interu_lst

    if perip_list:
        for p in perip_list:
            if isinstance(p, St_Peripheral):
                if p.addrBlocksRowindex in addrb_dict:
                    p.addrBlocks = addrb_dict[p.addrBlocksRowindex]
                if p.interuptsRowindex in interu_dict:
                    p.interupts = interu_dict[p.interuptsRowindex]
                # print(p.get_inst_str())

    cluster_lst = flag_dict['cluster:']
    end_cluster_lst = flag_dict['end cluster']
    st_clu_reg_list = []
    # parent_clu_reg_list = None
    # parent_clu_ = None
    if isinstance(end_cluster_lst, list) and len(cluster_lst) != len(end_cluster_lst):
        bMod_CheckErr = True
        print("Error:  cluster not all have end cluster")
    else:
        cluster_len = len(cluster_lst)
        # 将cluseter和endcluster按行号循序重新排列
        clu_item_lst = []
        for c in cluster_lst:
            clu_ = St_clusterFlag_info()
            clu_.row = c
            clu_item_lst.append(clu_)
        for e in end_cluster_lst:
            clu_ = St_clusterFlag_info()
            clu_.row = e
            clu_.bEnd = True
            bInsert = False
            for index in range(len(clu_item_lst)):
                if clu_item_lst[index].row > e:
                    clu_item_lst.insert(index, clu_)
                    bInsert = True
                    break
            if not bInsert:
                clu_item_lst.append(clu_)
        # 现在得到了顺序排列
        clu_range_list = []
        clu_item_len = len(clu_item_lst)
        cur_clu_range = None
        parent_clu_range_lst = []
        for index in range(clu_item_len):
            clu_item = clu_item_lst[index]
            if cur_clu_range:
                if clu_item.bEnd:
                    if cur_clu_range:
                        cur_clu_range.rowEnd = clu_item.row
                        if parent_clu_range_lst:
                            cur_clu_range = parent_clu_range_lst.pop()
                        else:
                            cur_clu_range = None
                else:
                    if cur_clu_range.rowEnd == 0:
                        clu_range = St_ClusterInnerRange(clu_item.row)
                        clu_range.parentClustRow = cur_clu_range.rowStart
                        parent_clu_range_lst.append(cur_clu_range)
                        cur_clu_range = clu_range
                        clu_range_list.append(clu_range)
            else:
                cur_clu_range = clu_range = St_ClusterInnerRange(clu_item.row)
                clu_range_list.append(clu_range)

        for clu_range in clu_range_list:
            print(clu_range.get_inst_str())
            if clu_range.parentClustRow == 0:
                st_clu_reg_list, row = readCluster(
                    ws, st_clu_reg_list, clu_range, clu_range_list)

    reg_row_lst = flag_dict['register:']
    if reg_row_lst:
        for a_i in reg_row_lst:
            # 先判断是否已经在cluster内
            bInCluster = False
            for clu_range in clu_range_list:
                if clu_range.parentClustRow == 0 and a_i in range(clu_range.rowStart, clu_range.rowEnd):
                    bInCluster = True
                    break
            if bInCluster:
                continue
            row_end = nRows
            f_i = flag_rows.index(a_i)
            if f_i < flags_count-1:
                row_end = flag_rows[f_i+1] - 1
            st_clu_reg_list, row = readRegister(
                ws,  row_end, a_i, st_clu_reg_list)

    for e in st_clu_reg_list:
        print(e.get_inst_str())

    for p in perip_list:
        p.clust_reg_lst = st_clu_reg_list

    if bMod_CheckErr:
        print("ModuleSheet : "+sheetName + ' have Errors')
    else:
        print("ModuleSheet : "+sheetName + '  Ok')
    return not bMod_CheckErr, perip_list,interupts_set


def readRegister(ws, row_end, row_start, parent_clu_reg_list):
    row = row_start+2
    bField = False
    cur_st_reg = None
    cur_reg_fd = None
    flag_names = ('cluster:', 'end cluster', 'register:')
    while row <= row_end:
        value = ws.cell(row, 1).value
        if value:
            if value in flag_names:
                break
            if not bField:
                name = value
                if name == 'fields:':  # 开始处理 field
                    bField = True
                    row += 1
                else:
                    offset = ws.cell(row, 2).value
                    size = ws.cell(row, 3).value
                    access = ws.cell(row, 4).value
                    cur_st_reg = St_Register(name, access, size)
                    cur_st_reg.addressOffset = offset
                    addrOffset = int(offset[2:], 16)
                    cur_st_reg.resetValue = ws.cell(row, 5).value
                    cur_st_reg.resetMask = ws.cell(row, 6).value
                    cur_st_reg.cRegName = ws.cell(row, 8).value
                    cur_st_reg.alterReg = ws.cell(row, 9).value
                    cur_st_reg.alterGroupName = ws.cell(row, 10).value
                    cur_st_reg.dim = ws.cell(row, 11).value
                    cur_st_reg.dimIncrement = ws.cell(row, 12).value
                    cur_st_reg.dimName = ws.cell(row, 13).value
                    cur_st_reg.desc = ws.cell(row, 14).value
                    if parent_clu_reg_list:
                        i = 0
                        for clu_reg in parent_clu_reg_list:
                            offset = int(clu_reg.addressOffset[2:], 16)
                            if offset > addrOffset:
                                parent_clu_reg_list.insert(i, cur_st_reg)
                                break
                            i += 1
                        if i == len(parent_clu_reg_list):
                            parent_clu_reg_list.append(cur_st_reg)
                    else:
                        parent_clu_reg_list.append(cur_st_reg)
            else:
                name = ws.cell(row, 2).value
                if not name:
                    row += 1
                    continue
                bSameFieldAsPrev = False
                if name and name.upper() != 'RESERVED':
                    for f in cur_st_reg.fd_lst:
                        if f.name == name:
                            if f == cur_reg_fd:
                                bSameFieldAsPrev = True
                            else:
                                print(
                                    f'In Register Field Name not allow repeat at Row {row}')
                            break
                if not bSameFieldAsPrev:
                    cur_reg_fd = fd = St_Field(name.upper())
                    bitrange = ws.cell(row, 1).value
                    end, op, start = bitrange.partition(':')
                    start_bit = start[0:-1]
                    end_bit = end[1:]
                    offset = nStart_bit = int(start_bit)
                    nEnd_bit = int(end_bit)
                    bitWidth = nEnd_bit - nStart_bit+1
                    access = ws.cell(row, 3).value
                    defaultVal = ws.cell(row, 4).value
                    writeConstraint = ws.cell(row, 5).value
                    range_min = ws.cell(row, 6).value
                    range_max = ws.cell(row, 7).value
                    enumName = ws.cell(row, 8).value
                    enumVal = ws.cell(row, 9).value
                    enumDesc = ws.cell(row, 10).value
                    desc = ws.cell(row, 11).value
                    fd.offset = offset
                    fd.bitWidth = bitWidth
                    fd.access = access
                    fd.defaultVal = defaultVal
                    fd.writeConstraint = writeConstraint
                    fd.range_min = range_min
                    fd.range_max = range_max
                    if desc:
                        fd.desc = desc
                    if enumName and enumVal:
                        enum_item = St_Enum_Val(enumName, enumVal)
                        enum_item.desc = enumDesc
                        fd.enumVals.append(enum_item)
                    # 这里可能需要添加按顺序插入动作
                    if cur_st_reg.fd_lst:
                        fd_len=len(cur_st_reg.fd_lst)
                        for i in range(fd_len):
                            if cur_st_reg.fd_lst[i].offset> fd.offset:
                                cur_st_reg.fd_lst.insert(i,fd)
                                break
                    else:
                        cur_st_reg.fd_lst.append(fd)
                else:
                    enumName = ws.cell(row, 8).value
                    enumVal = ws.cell(row, 9).value
                    enumDesc = ws.cell(row, 10).value
                    if enumName and enumVal:
                        enum_item = St_Enum_Val(enumName, enumVal)
                        enum_item.desc = enumDesc
                        cur_reg_fd.enumVals.append(enum_item)

        row += 1
    return parent_clu_reg_list, row


def readCluster(ws: worksheet, parent_clu_reg_list, clu_range: St_ClusterInnerRange, clu_range_list):
    clu_start = clu_range.rowStart
    clu_end = clu_range.rowEnd
    row = clu_start+2
    st_clu = None
    while row < clu_end:
        name = ws.cell(row, 1).value
        if not name:
            row += 1
            continue
        if name == 'cluster:':
            if st_clu:
                for c_r in clu_range_list:
                    if c_r.rowStart == row:
                        st_clu.chd_clust_reg_list, row = readCluster(
                            ws, st_clu.chd_clust_reg_list, c_r, clu_range_list)
                        break
            else:
                row += 2
            continue
        elif name == 'register:':
            if st_clu:
                st_clu.chd_clust_reg_list, row = readRegister(
                    ws, clu_end, row, st_clu.chd_clust_reg_list)
            else:
                row += 2
            continue
        elif name == 'end cluster':
            row += 1
            continue
        else:
            st_clu = St_Cluster(name)
            st_clu.rowStart = clu_start
            st_clu.rowEnd = clu_end
            st_clu.addressOffset = ws.cell(row, 2).value
            addrOffset = int(st_clu.addressOffset[2:], 16)
            st_clu.alterCluster = ws.cell(row, 3).value
            st_clu.alterGroupName = ws.cell(row, 4).value
            st_clu.cStructName = ws.cell(row, 5).value
            st_clu.dim = ws.cell(row, 6).value
            st_clu.dimIncrement = ws.cell(row, 7).value
            st_clu.desc = ws.cell(row, 8).value
            if parent_clu_reg_list:
                i = 0
                for clu_reg in parent_clu_reg_list:
                    offset = int(clu_reg.addressOffset[2:], 16)
                    if offset > addrOffset:
                        parent_clu_reg_list.insert(i, st_clu)
                        break
                    i += 1
                if i == len(parent_clu_reg_list):
                    parent_clu_reg_list.append(st_clu)
            else:
                parent_clu_reg_list.append(st_clu)
        row += 1
    return parent_clu_reg_list, row


# def output_SV_moduleFile(module_inst, modName):
#     out_svh_module_Name = modName.lower()+'_dut_cfg'
#     out_svh_file_name = './'+out_svh_module_Name+'.svh'
#     with open(out_svh_file_name, 'w+') as sv_file:
#         heder_str = f'_{modName.upper()}_DUT_CFG_SVH_'
#         file_str = F'`ifndef {heder_str}\n`define {heder_str}\n\n'

#         file_enum_str = ''

#         uvm_field_str = f'\n\t`uvm_object_utils_begin({out_svh_module_Name})\n'
#         uvm_fd_val_def_str = ""
#         val_def_strarr = ["// Autor: Auto generate by sv", "// Version: 0.0.2 X",
#                           "// Description : set module reg field random value", "// Waring: Do NOT Modify it !", "#pragma once"]
#         for str in val_def_strarr:
#             uvm_fd_val_def_str += f'\t\t$fdisplay(fd, "{str}" );\n'

#         uvm_fd_val_def_str += '\t\t$fdisplay(fd, "   " );\n\n'
#         file_cls_str = f'class {out_svh_module_Name} extends uvm_object;\n\n'
#         for reg in module_inst.reg_list:
#             for fd in reg.field_list:
#                 if fd.bRandom_Enable and fd.attribute.find('W') != -1:
#                     reg_fd_name = f'{reg.reg_name}___{fd.field_name}'
#                     b_fd_enum = False
#                     nbit_Wid = fd.end_bit-fd.start_bit+1
#                     bit_str = 'bit'
#                     if nbit_Wid > 1:
#                         bit_str = f'bit [{nbit_Wid-1}:0]'
#                     if fd.field_enumstr:
#                         # print(fd.field_enumstr)
#                         b_fd_enum = True
#                         enum_lst = fd.field_enumstr.splitlines()
#                         file_enum_str += f'typedef enum {bit_str}'+' {\n'
#                         b_emFirstitem = True
#                         for em in enum_lst:
#                             # print(em)
#                             em_val = em.replace(',', '')
#                             em_val = em_val.strip()
#                             (em_item_name, str, em_item_value) = em_val.partition('=')
#                             em_item_name = em_item_name.strip()
#                             em_item_value = em_item_value.strip().upper()
#                             if not b_emFirstitem:
#                                 file_enum_str += ',\n'
#                             if len(em_item_value) and em_item_value.startswith('0X'):
#                                 em_item_value_int = int(em_item_value, 16)
#                                 file_enum_str += f'\t{em_item_name} {str} {em_item_value_int}'
#                             else:
#                                 file_enum_str += f'\t{em_item_name} {str} {em_item_value}'
#                             b_emFirstitem = False
#                             # file_str
#                         file_enum_str += '\n} '+f'em_{reg_fd_name};\n\n'

#                     if b_fd_enum:
#                         file_cls_str += f'\trand em_{reg_fd_name} {reg_fd_name};\n'
#                     else:
#                         file_cls_str += f'\trand {bit_str}  {reg_fd_name};\n'

#                     uvm_field_str += f'\t\t`uvm_field_int({reg_fd_name}, UVM_ALL_ON)\n'

#                     fd_name_VAL = f'{reg_fd_name.upper()}_VALUE_'
#                     fd_name_VAL = fd_name_VAL.ljust(48)
#                     if b_fd_enum:
#                         uvm_fd_val_def_str += f'\t\t$fdisplay(fd, "#define \t {fd_name_VAL}   0x%X   //%s",  {reg_fd_name}, {reg_fd_name}.name());\n'
#                     else:
#                         uvm_fd_val_def_str += f'\t\t$fdisplay(fd, "#define \t {fd_name_VAL}   0x%X",  {reg_fd_name});\n'
#         uvm_field_str += f'\t`uvm_object_utils_end\n'

#         uvm_field_str += f'\n\tfunction new(string name = "{out_svh_module_Name}");\n'
#         uvm_field_str += """\t\tsuper.new(name);
#     endfunction:new

#     virtual function void print_cfg_to_file();
#         int fd;
# """
#         uvm_field_str += f'\t\tfd = $fopen("{modName}_dut_cfg.h");\n'

#         uvm_field_str += uvm_fd_val_def_str
#         uvm_field_str += """
#         $fclose(fd);
#     endfunction:print_cfg_to_file
# """
#         file_cls_str += uvm_field_str
#         file_cls_str += """endclass

# `endif
# """
#         file_str += file_enum_str+'\n\n'
#         file_str += file_cls_str
#         sv_file.write(file_str)
#         sv_file.close()

#         return out_svh_file_name


def output_C_devFile(dev: St_Device,module_file_lst:list):
    devName = dev.name.lower()
    dev_Name_=dev.name
    if dev_Name_.endswith('xx'):
        dev_Name_=dev_Name_[0:-2]
        dev_Name_=dev_Name_.upper()+'xx'
    else:
        dev_Name_=dev_Name_.upper()
    out_file_name= './'+devName+'.h'
    print('output_C_devFile: ' + dev.name)
    with open(out_file_name, 'w+') as out_file:
        fileHeader = f'/**\n * @file    {devName}.h\n'
        fileHeader += f' * @author  CIP Application Team\n * @brief   {devName} Peripheral Access Layer Header File.'
        fileHeader += """
 *          This file contains:
 *           - Interrupt vector number and
 *           - Data structures and the address mapping for
 *             all peripherals
 *           - Including peripheral's registers declarations and bits
 *             definition Header File
"""

        # 格式化成2016-03-20 11:45:39形式
        today = date.today()
        fileHeader += f' * @version {dev.version} \n * @date    {today.strftime("%y-%m-%d")}\n'

        fileHeader += """
 *
  ******************************************************************************
 * @copyright
 *
"""
        fileHeader += f' *  <h2><center>&copy; Copyright (c){today.year} CIP United Co.\n'
        fileHeader += """
 * All rights reserved.</center></h2>
 *
 * 
 *
 ******************************************************************************
 */

 /*
 * ****************************************************************************
 * ******** Define to prevent recursive inclusion                  ********
 * ****************************************************************************
 */
#pragma once
"""
        fileHeader += f'#ifndef __{dev_Name_}_H\n'
        fileHeader += f'#define __{dev_Name_}_H\n'
        fileHeader += """
/*
 * ============================================================================
 * If building with a C++ compiler, make all of the definitions in this header
 * have a C binding.
 * ============================================================================
 */
#ifdef __cplusplus
extern "C"
{
#endif

/*
 * ****************************************************************************
 * ******** Includes                                                   ********
 * ****************************************************************************
 */
#include <stdint.h>   //for use uint32_t type

/*
 * ****************************************************************************
 * ******** Exported Types                                             ********
 * ****************************************************************************
 */
#if !defined(__ASSEMBLER__)
/*
 * ============================================================================
 * ==             Interrupt vector number defined                            ==
 * ============================================================================
 */
 
"""

# /**
#  * @brief XY2_MP32DIAPT Interrupt Vector Number Definition
#  */
# typedef enum __IRQ_NUMBER
# {
#     CORE_SW0_IRQn       = 0,    /*!< Core timer interrupt       */
#     CORE_SW1_IRQn       = 1,    /*!< Core software interrupt 1  */
#     CORE_HW0_IRQn       = 2,    /*!< Core software interrupt 2  */

#     NUMBER_INT_VECTORS
# } IRQn_t;

        fileHeader +=f'/**\n *  @brief {dev_Name_} Interrupt Vector Number Definition\n */\n'
       
        irq_str = ''
        irq_num_str = ''
        index = 0 
        irCount = len(dev.interupts) 
        for ir in dev.interupts:
            index += 1
            if isinstance(ir,St_Interrupt):
                emIr= cst_tab_str+f'{ir.name}'
                emIr = emIr.ljust(20)
                emIr += '= '+ str(ir.value)
                if index != irCount:
                    emIr += ','
                else:
                    emIr += ' '
                emIr += cst_tab_str+f'/*!< {ir.desc} */\n'
                irq_str += emIr
                irq_num_str += f'#define {ir.name}_NUM'.ljust(30)  +f'{ir.value}       /*!< {ir.desc}       */\n'
        if irq_str:
            fileHeader += 'typedef enum __IRQ_NUMBER\n{\n'   
            fileHeader += irq_str
            fileHeader +='} IRQn_t;\n'
        fileHeader +="""
/**
 * @brief Interrupt handle function typedef
 */
typedef void (*irqFnHandler)(void *);

/**
 * @}
 */

#endif /* !__ASSEMBLER__ */

/*
 * ****************************************************************************
 * ******** Exported constants                                         ********
 * ****************************************************************************
 */
/** @addtogroup Interrupt_Vector_Number Interrupt vector number
 * @{
 */

"""
        fileHeader += irq_num_str
        fileHeader += """
/**
 * @}
 */

 
/*
 * ============================================================================
 * ==             Device Processor Configuration                             ==
 * ============================================================================
 */
/** @addtogroup Configuration_Section_For_PROC
 * @{
 */
#define MIPS_DUAL_CORE              /*!< Dual core feature */

/**
#  * @brief Configuration of the  Processor and Core Peripherals
#  */
"""
        fileHeader += '#define PROC_UNDEFINED\n'
        procName_lst = []
        for cp in dev.cpus:
            cp_name = cp.name.upper()
            procName =  f'PROC_{cp_name}'
            procName_lst.append(cp_name)

            fileHeader += f'#ifdef {procName}\n'
            
            if cp.revision:
                p_index = cp.revision.find('p')
                if p_index !=-1 and p_index < len(cp.revision)-1:
                    cp_str = f'#define __CORE_REV'.ljust(30)
                    rev_str_0 = cp.revision[1:p_index].rjust(2,'0')
                    rev_str_1 = cp.revision[p_index+1:]
                    rev_str_1 = rev_str_1.rjust(2,'0')
                    cp_str += '0x'+rev_str_0+rev_str_1+"U   /*!< Defines processorre's vision               */\n"
                    fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.srs:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_SRS'.ljust(30) + val_str + "/*!< Defines if the Shadow regiseters are present or not  */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.mpu:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_MPU'.ljust(30) + val_str + "/*!< Defines if the MPU is present or not       */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.fpu:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_FPU'.ljust(30) + val_str + "/*!< Defines if the FPU is present or not       */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.dsp:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_DSP'.ljust(30) + val_str + "/*!< Defines if the DSP is present or not       */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.icache:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_L1_ICACHE'.ljust(30) + val_str + "/*!< Defines if the L1 ICache is present or not */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.dicache:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_L1_DCACHE'.ljust(30) + val_str + "/*!< Defines if the L1 DCache is present or not */\n"
            fileHeader += cp_str
            val_str = '0U'.ljust(10)
            if cp.l2cache:
                val_str = '1U'.ljust(10)
            cp_str = f'#define __CORE_HAS_L2_CACHE'.ljust(30) + val_str + "/*!< Defines if the L2 Cache is present or not  */\n"
            fileHeader += cp_str


            fileHeader += """
#undef PROC_UNDEFINED
/* Core Access Layer */
#if !defined(__ASSEMBLER__)
"""
            fileHeader += f'#include "core_{cp.name.lower()}.h"\n#endif /* !__ASSEMBLER__ */\n'

            fileHeader += f'#endif //PROC_{cp.name.upper()}\n'
            pass

        
        fileHeader += """
#ifdef PROC_UNDEFINED
    #error "Please #define Processor"
#endif //PROC_UNDEFINED

/**
 * @}
 */
#if !defined(__ASSEMBLER__)
  /* Device system configuration */

#ifndef PROC_UNDEFINED
"""
  
        fileHeader += f'#include "system_{devName}.h" \n'
        fileHeader += """
#endif //PROC_UNDEFINED

#endif /* !__ASSEMBLER__ */

/*
 * ============================================================================
 * ==             Device Memory Space Definition                             ==
 * ============================================================================
 */
/** @addtogroup Peripheral_Memory_Map_Definition
 * @{
 */
/* ----------------------------------------------------------------------------
 * -- Memory Space Map
 * ------------------------------------------------------------------------- */

"""
        mem_proc_dict = {}
        mem_other_str = ''
        for mem in dev.memories:
            if mem.processor:
                mem_str = f'#define {mem.name}'.ljust(30)+f'({mem.addrBase})'+cst_tab_str
                if mem.desc:
                    mem_str += f'/*!< Base address of :{mem.desc} - {mem.access} */\n'
                else:
                    mem_str += '\n'
                bInProcLst = False
                for p in procName_lst:
                    if mem.processor == p:
                        bInProcLst = True
                        if p in mem_proc_dict:
                            proc_mem_str = mem_proc_dict[p]
                            proc_mem_str += mem_str
                            mem_proc_dict[p] = proc_mem_str
                        else:
                            mem_proc_dict[p] = mem_str
                        break
                if not bInProcLst:
                    print(f'Error:  MEM {mem.name} processor {mem.processor} not in CPUS. ')
            else:
                if mem.derivedFrom:
                    mem_str = f'#define {mem.name}'.ljust(30)+f'({mem.derivedFrom} + {mem.addrOffset}U)'+cst_tab_str
                    if mem.desc:
                        mem_str += f'/*!< Base address of :{mem.desc} - {mem.access} */\n'
                    else:
                        mem_str += '\n'
                else:
                    mem_str = f'#define {mem.name}'.ljust(30)+f'({mem.addrBase})'+cst_tab_str
                    if mem.desc:
                        mem_str += f'/*!< Base address of :{mem.desc} - {mem.access} */\n'
                    else:
                        mem_str += '\n'
                mem_other_str += mem_str
        
        for p in mem_proc_dict:
            fileHeader += f'#ifdef PROC_{p}\n'
            fileHeader += mem_proc_dict[p]
            fileHeader += f'#endif // PROC_{p}\n'
            pass

        fileHeader += """
/* ----------------------------------------------------------------------------
 * -- Peripherals Space Map
 * ------------------------------------------------------------------------- */
"""
        fileHeader += mem_other_str

        fileHeader += """
/* ----------------------------------------------------------------------------
 * -- Special function register map
 * ------------------------------------------------------------------------- */
"""
        perip_proc_dict = {}
        for p_name in dev.peripherals:
            perip_lst=dev.peripherals[p_name]
            for perip in perip_lst:
                bInProcLst = False
                if perip.processor:
                    perip_str = f'#define {perip.name}_BASE'.ljust(30)+f'({perip.baseAddr})\n'
                    for p in procName_lst:
                        if perip.processor == p:
                            bInProcLst = True
                            if p in perip_proc_dict:
                                proc_perip_str = perip_proc_dict[p]
                                proc_perip_str += perip_str
                                perip_proc_dict[p] = proc_perip_str
                            else:
                                perip_proc_dict[p] = perip_str
                            break
                        pass
                    pass
                if not bInProcLst:
                    print(f'Error:  perip {perip.name} processor {perip.processor} not in CPUS. ')
                pass
            pass

        for p in perip_proc_dict:
            fileHeader += f'#ifdef PROC_{p}\n'
            fileHeader += perip_proc_dict[p]
            fileHeader += f'#endif // PROC_{p}\n'
            pass

        fileHeader += """

/**
 * @}
 */

#if !defined(__ASSEMBLER__)
/*
 * ============================================================================
 * ==              Peripheral instance declaration                           ==
 * ============================================================================
 */

/** @addtogroup Peripheral_Instance_Declaration
 * @{
 */

/**
 * @}
 */

/*
 * ============================================================================
 * ==              Peripheral register structures & declaration              ==
 * ============================================================================
 */

/** @addtogroup Peripheral_Registers_Bits_Definition
 * @{
 */
/* Device register head file */
"""
        for f in module_file_lst:
            fileHeader += f'#include "{f}"\n'

        fileHeader += """
/*
 * ****************************************************************************
 * ******** Exported macro                                    ********
 * ****************************************************************************
 */

/*
 * ============================================================================
 * Check peripheral Instances
 * ============================================================================
 */

/*
 * ============================================================================
 * Get peripheral Index
 * ============================================================================
 */

/*
 * ****************************************************************************
 * ******** Exported Function                                          ********
 * ****************************************************************************
 */

#endif /* defined(__ASSEMBLER__) */

#ifdef __cplusplus
}
#endif
"""
        fileHeader += f'\n#endif //  __{dev_Name_}_H\n'
        fileHeader +="""
/*
 * ****************************************************************************
 * End File
 * ****************************************************************************
 */

"""

        out_file.write(fileHeader)
    pass


def output_C_moduleFile(preip_lst, preip_name, version):
    preip_inst = None
    
    if preip_lst:
        preip_inst = preip_lst[0]
        out_C_file_Name = preip_name.lower()+'_regs'
        module_Name = preip_inst.cStructName.upper()
        module_Header= module_Name+'_REGS'
        preip_name = preip_name.upper()
        out_file_name = out_C_file_Name+'.h'
        out_file_Pathname = './reg/'+out_file_name
        with open(out_file_Pathname, 'w+') as out_file:
            fileHeader = f'/**\n * @file    {out_file_name}\n'
            fileHeader += f' * @author  CIP Application Team\n * @brief   {preip_name} Register struct Header File.\n'
            fileHeader += ' *          This file contains:\n *           - Data structures and the address mapping for\n'
            fileHeader += f" *             {preip_name} peripherals\n *           - Including peripheral's registers declarations and bits\n"
            fileHeader += '*             definition\n'

            # 格式化成2016-03-20 11:45:39形式
            today = date.today()
            fileHeader += f' * @version {version} \n * @date    {today.strftime("%y-%m-%d")}\n'

            fileHeader += """
 *
  ******************************************************************************
 * @copyright
 *
"""
            fileHeader += f' *  <h2><center>&copy; Copyright (c){today.year} CIP United Co.\n'
            fileHeader += """
 * All rights reserved.</center></h2>
 *
 * 
 *
 ******************************************************************************
 */

 /*
 * ****************************************************************************
 * ******** Define to prevent recursive inclusion                  ********
 * ****************************************************************************
 */
#pragma once
"""
            fileHeader += f'#ifndef __{module_Header}_H\n'
            fileHeader += f'#define __{module_Header}_H\n'

            fileHeader += """
#include <stdint.h>

#ifndef   __IO
#define   __IO    volatile
#endif

#ifndef   __I
#define   __I     volatile const
#endif

#ifndef   __O
#define   __O     volatile 
#endif


/*
 * ****************************************************************************
 * ******** Includes                                                   ********
 * ****************************************************************************
 */

/*
 * ****************************************************************************
 * ******** Exported Types                                             ********
 * ****************************************************************************
 */
/*
 * ============================================================================
 * ==            Peripheral registers structures                             ==
 * ============================================================================
 */
/** @addtogroup Peripheral_Registers_Structures
 * @{
 */
#pragma pack(4)

"""
            accessDict = {'R': '__I ', 'W': '__O ', 'RW': '__IO'}
            curGroupName = ''
            uint_str = 'uint32_t'
            uint_dict = {8: 'uint8_t', 16: 'uint16_t',
                         32: 'uint32_t', 64: 'uint64_t'}
            fileHeader += 'typedef struct {\n'
            fileRegFdOpstr=''
            for clu_reg in preip_inst.clust_reg_lst:
                if isinstance(clu_reg, St_Cluster):
                    if curGroupName:
                        fileHeader += '\t}'+f'\t{curGroupName};\n'
                        curGroupName = ''
                elif isinstance(clu_reg, St_Register):
                    if clu_reg.alterGroupName:
                        if curGroupName != clu_reg.alterGroupName:
                            if curGroupName:
                                fileHeader += cst_tab_str+'} '+f'{curGroupName};\n'
                            fileHeader += cst_tab_str+'union {\n'
                            curGroupName = clu_reg.alterGroupName
                        regFdInfo,regFdOpstr=getRegFiledInfo(accessDict,cst_tab_str,True, uint_dict, clu_reg,module_Name)
                        fileHeader+=regFdInfo
                        fileRegFdOpstr+=regFdOpstr
                    elif curGroupName:
                        fileHeader += cst_tab_str+'} '+f'{curGroupName};\n'
                        curGroupName = ''
                    else:
                        regFdInfo,regFdOpstr=getRegFiledInfo(accessDict,cst_tab_str,False,uint_dict,clu_reg,module_Name)
                        fileHeader+=regFdInfo
                        fileRegFdOpstr+=regFdOpstr


            fileHeader += '}'+f' {module_Name}_t;\n\n#pragma pack()\n'
            

            fileHeader += """
/**
 * @}
 */

/*
 * ****************************************************************************
 * ******** Exported constants                                         ********
 * ****************************************************************************
 */
/*
 * ============================================================================
 * ==           Device Memory Space Definition                               ==
 * ============================================================================
 */
/** @addtogroup Peripheral_Memory_Map_Definition
 * @{
 */
/* ----------------------------------------------------------------------------
 * -- Memory Space Map
 * ------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------
 * -- Peripherals Space Map
 * ------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------
 * -- Special function register map
 * ------------------------------------------------------------------------- */

"""

            
            perip_inst_lst=[]
            for p in  preip_lst:
                if not p.alias:
                    perip_inst_lst.append(p)
            
            for p in perip_inst_lst:
                inst_name=p.name.upper()
                fileHeader+=f'#define  {inst_name}_BASE_ADDR          {inst_name}_BASE\n'

            fileHeader+="""
/**
 * @}
 */

/*
 * ============================================================================
 * ==           Peripheral instance declaration                              ==
 * ============================================================================
 */

/** @addtogroup Peripheral_Instance_Declaration
 * @{
 */

"""
            
            for p in perip_inst_lst:
                inst_name=p.name.upper()
                fileHeader+=f'#define  {inst_name}      ( ({module_Name}_t*) {inst_name}_BASE_ADDR )\n'

            fileHeader += """
/**
 * @}
 */


/*
 * ============================================================================
 * ==           Peripheral register bit description                          ==
 * ============================================================================
 */

/** @addtogroup Peripheral_Registers_Bits_Definition
 * @{
 */

/* ----------------------------------------------------------------------------
"""

            mod_reg_str = f' * --     {module_Name}  register bit description\n'
            fileHeader += mod_reg_str
            fileHeader +="""
 * --------------------------------------------------------------------------*/

"""

            fileHeader += fileRegFdOpstr
            fileHeader += f'\n#endif // __{module_Header}_H\n'
            fileHeader += """
/*
 * ****************************************************************************
 * End File
 * ****************************************************************************
 */

"""
            out_file.write(fileHeader)

            return out_file_Pathname



def getRegFiledInfo(accessDict,tab_str,bTab, uint_dict, clu_reg,moduleName):
    fileHeader = ''
    retOpstr = f'/**\n * @name {clu_reg.name} - {clu_reg.desc},Offset: {clu_reg.addressOffset}\n * @'+'{\n */\n'

    if bTab:
        fileHeader=tab_str
    if clu_reg.size in uint_dict:
        uint_str = uint_dict[clu_reg.size]
    if clu_reg.access in accessDict:
        accChar = accessDict[clu_reg.access]
        fileHeader += f'{tab_str}{accChar} '
    
    regFdStr=''
    nValidFdCount=0
    if clu_reg.fd_lst:

        regFdStr = 'struct {\n'
        curBitPos=0
        reservedindex =0
        for fd in clu_reg.fd_lst:
            row_str=''
            fd_Op_str = ''
            fd_head_str = fd_body_str = ''
            if bTab:
                row_str+=tab_str
            if fd.offset > curBitPos:
                #添加reserved
                row_str+=f'{tab_str}{tab_str}{uint_str} reserved{reservedindex}: {curBitPos-fd.offset};'
                reservedindex+=1
                nValidFdCount+=1

            curBitPos=fd.offset+fd.bitWidth
            
            if fd.name == 'RESERVED':
                if curBitPos != clu_reg.size:
                    #最上面的保留字段，不生成
                    row_str+=f'{tab_str}{tab_str}{uint_str} reserved{reservedindex}: {fd.bitWidth};'
                    reservedindex+=1
                else:
                    continue
            else:
                nValidFdCount += 1
                row_str+=f'{tab_str}{tab_str}{uint_str} {fd.name}: {fd.bitWidth};'

                endBit=fd.bitWidth+fd.offset-1
                fd_head_str = f'/** Bit[{endBit}:{fd.offset}] {fd.name}  - {fd.access}, {fd.desc}\n'
                if fd.writeConstraint == 'range':
                    fd_head_str += f' * Range: ( {fd.range_min} --{fd.range_max})\n'
                    pass

                regFdName = f'{moduleName}_{clu_reg.name}_{fd.name}'
                regFdPos = f'{regFdName}_POS'
                regFdOpStr = f'#define {regFdPos}'
                regFdOpStr = regFdOpStr.ljust(40)
                regFdOpStr += f'{fd.offset}U\n'
                fd_body_str += regFdOpStr
                regFdMsk = f'{regFdName}_MSK'
                regFdOpStr = f'#define {regFdMsk}'
                regFdOpStr = regFdOpStr.ljust(40)
                markVal = bitWidMask_arr[fd.bitWidth-1]
                regFdOpStr += f'(({uint_str}) {markVal} << {regFdPos})\n'
                fd_body_str += regFdOpStr
                if fd.enumVals:
                    #仅定义 enum 
                    for e in fd.enumVals:
                        enumName=e.name.upper()
                        regFdOpStr = f'#define {regFdName}_{enumName}'
                        regFdOpStr = regFdOpStr.ljust(40)
                        regFdOpStr += f'({e.value}U << {regFdPos})\n'
                        fd_body_str += regFdOpStr

                        fd_head_str += f' * - {e.value} : {e.desc}\n'
                    pass
                else:
                    regFdOpStr = f'#define {regFdName}_GET(val)'
                    regFdOpStr = regFdOpStr.ljust(40)
                    regFdOpStr += f'(({uint_str}) ((val) & {regFdMsk}) >> {regFdPos})\n'
                    fd_body_str += regFdOpStr
                    if fd.access.find('W') != -1:
                        regFdOpStr = f'#define {regFdName}_SET(val)'
                        regFdOpStr = regFdOpStr.ljust(40)
                        regFdOpStr += f'(({uint_str}) ((val) & {markVal}) << {regFdPos})\n'
                        fd_body_str += regFdOpStr
                fd_head_str += ' */\n'

            fd_Op_str = fd_head_str + fd_body_str +'\n'
            retOpstr += fd_Op_str
            row_str=row_str.ljust(40)
            row_str+=f'/*!< bitOffset: {fd.offset} ({fd.access}), {fd.desc} */\n'
            regFdStr += row_str
        if bTab:
            regFdStr+=tab_str
        regFdStr += tab_str+'}'
    if nValidFdCount in (0,1) :
        fileHeader += uint_str
    else:
        fileHeader += regFdStr
    fileHeader += ' ' + clu_reg.getRegName()
    fileHeader += f';{tab_str}{tab_str}/*!< Offset: {clu_reg.addressOffset} ({clu_reg.access}),  {clu_reg.desc} */\n'

    
    retOpstr += '/**\n * @}\n*/\n\n'
    
    return fileHeader,retOpstr


# def output_ralf_moduleFile(module_inst, modName):
#     out_ralf_file_Name = './' + modName+'.ralf'
#     with open(out_ralf_file_Name, 'w+') as out_file:
#         fileHeader = """# Autor: Auto generate by python From module excel\n
# # Version: 0.0.2 X
# # Description : struct define for module \n
# # Waring: Do NOT Modify it !

# """

#         nRegData_size = int(module_inst.data_width/8)
#         file_body_str = f'block {modName} ' + \
#             ' {\n\tbytes '+f'{nRegData_size};\n'

#         # 定义module的结构体
#         last_offset = 0
#         nRegReservedIndex = 0

#         bRegGroup = False
#         group_dim = 0
#         group_size = 0
#         group_startPos = 0
#         group_name = ''

#         # print('module data_width: {0}'.format(module_inst.data_width))
#         group_index = -1
#         for reg in module_inst.reg_list:
#             # if reg.bVirtual:
#             #     continue
#             reg_offset = reg.offset
#             # if reg_offset != last_offset:
#             #     # 增加占位
#             #     nRerived = (reg_offset-last_offset) / nRegData_size
#             #     n = 0
#             #     while n < nRerived:
#             #         if bRegGroup:
#             #             file_body_str += f'\tregister reg_reserved{nRegReservedIndex}' + \
#             #                 ' {\n\t\tbytes '+f'{nRegData_size};\n'+'\t}\n'
#             #         nRegReservedIndex += 1
#             #         n += 1
#             if reg.bGroup_start and reg.group_size and reg.group_dim:
#                 bRegGroup = True
#                 group_index = 0
#                 group_startPos = reg_offset
#                 group_size = reg.group_size
#                 group_dim = reg.group_dim
#                 # group_name += reg.reg_name
#                 if reg.bGroup_stop:
#                     file_body_str += f'\tregister {reg.reg_name}[{group_dim}] @{reg.offset} + {group_size}'+' {\n'
#                     bRegGroup = False
#                 else:
#                     file_body_str += f'\tregfile {reg.group_name}[{group_dim}] @{reg.offset} + {group_size}'+' {\n'
#                     file_body_str += f'\t\tregister {reg.reg_name} @{reg.offset-group_startPos}'+' {\n' + \
#                         '\t\tbytes '+f'{nRegData_size};\n'
#             str_Tab = ''
#             if bRegGroup:
#                 str_Tab = '\t'
#                 if reg.group_index != 0:
#                     file_body_str += f'\t\tregister {reg.reg_name} @{reg.offset-group_startPos}'+' {\n' + \
#                         ' \t\tbytes '+f'{nRegData_size};\n'
#             else:
#                 if reg.group_index != 0:
#                     if reg.bVirtual:
#                         file_body_str += f'\tvirtual register  {reg.reg_name} '+' {\n'
#                     else:
#                         file_body_str += f'\tregister  {reg.reg_name} @{reg.offset}'+' {\n'
#                     file_body_str += F'\t\tbytes {nRegData_size};\n'

#             # last_offset = reg_offset + nRegData_size

#             # print('last_offset: is {0}'.format(last_offset))
#             field_count = reg.field_count()
#             if field_count:
#                 # if bRegGroup:
#                 #     file_body_str += f'\t\tregister {reg.reg_name} @{reg.offset-group_startPos}'+' {\n' + \
#                 #     ' \t\tbytes '+f'{nRegData_size};\n'
#                 # else:
#                 #     file_body_str += f'\tregister {reg.reg_name} @{reg.offset}'+' {\n' + \
#                 #     ' \t\tbytes '+f'{nRegData_size};\n'
#                 # nFieldReservedIndex = 0

#                 field_index = field_count-1
#                 # field_bitPos = 0
#                 while field_index != -1:
#                     fd = reg.field_list[field_index]
#                     # if fd.start_bit != field_bitPos:
#                     #     # 需要补齐field
#                     #     if bRegGroup:
#                     #         file_body_str += '\t'
#                     #     file_body_str += f'\t\tfield fd_reserved{nFieldReservedIndex} '+' {\n\t\t\t'
#                     #     if bRegGroup:
#                     #         file_body_str += '\t'
#                     #     file_body_str += f'bits: {fd.start_bit-field_bitPos} ;\n'
#                     #     if bRegGroup:
#                     #         file_body_str += '\t'
#                     #     file_body_str += '\t\t}'
#                     #     nFieldReservedIndex += 1
#                     bReserved = False
#                     field_bitPos = fd.end_bit+1
#                     fd.field_comments = fd.field_comments.replace(
#                         '\n', ' ').replace('\r', ' ')
#                     nBitWid = field_bitPos-fd.start_bit
#                     if fd.field_name == 'reserved':
#                         # fd.field_name = f'reserved{nFieldReservedIndex}'
#                         # nFieldReservedIndex += 1
#                         bReserved = True
#                     if not bReserved:
#                         file_body_str += f'{str_Tab}\t\tfield fd_{fd.field_name} @{fd.start_bit}'+' {\n'
#                         file_body_str += f'{str_Tab}\t\t\tbits {nBitWid} ;\n'
#                         file_body_str += f'{str_Tab}\t\t\treset {fd.defaultValue} ;\n'
#                         if fd.attribute:
#                             file_body_str += f'{str_Tab}\t\t\taccess {fd.attribute.lower()} ;\n'
#                         if fd.field_enumstr:
#                             # print(fd.field_enumstr)
#                             # b_fd_enum = True
#                             enum_lst = fd.field_enumstr.splitlines()
#                             field_enum_str = f'{str_Tab}\t\t\tenum '+' {\n'
#                             b_emFirstitem = True
#                             for em in enum_lst:
#                                 # print(em)
#                                 em_val = em.replace(',', '')
#                                 em_val = em_val.strip()
#                                 (em_item_name, str,
#                                  em_item_value) = em_val.partition('=')
#                                 em_item_name = em_item_name.strip()
#                                 em_item_value = em_item_value.strip().upper()
#                                 if not b_emFirstitem:
#                                     field_enum_str += ',\n'
#                                 if em_item_value and em_item_value.startswith('0X'):
#                                     em_item_value_int = int(em_item_value, 16)
#                                     field_enum_str += f'{str_Tab}\t\t\t\t{em_item_name} {str} {em_item_value_int}'
#                                 else:
#                                     field_enum_str += f'{str_Tab}\t\t\t\t{em_item_name} {str} {em_item_value}'
#                                 b_emFirstitem = False
#                                 # file_str
#                             field_enum_str += f'\n{str_Tab}\t\t\t'+'} \n'
#                             file_body_str += field_enum_str
#                         file_body_str += f'{str_Tab}\t\t\tconstraint c_st_{fd.field_name} ' + '{\n\t\t\t'
#                         file_body_str += str_Tab+'}\n'

#                         file_body_str += str_Tab+'\t\t}'
#                         if fd.field_comments:
#                             file_body_str += f'; #{fd.field_comments} \n'
#                         else:
#                             file_body_str += '\n'
#                     field_index -= 1
#                 # if bRegGroup:
#                 #     reg.group_index = group_index
#                 file_body_str += str_Tab+'\t}; ' + f' #{reg.desc} \n'
#             else:
#                 file_body_str += f'{str_Tab}\tregister  {reg.regname} @{reg.offset-group_startPos}'+' {\n'
#                 file_body_str += F'{str_Tab}\t\tbytes {nRegData_size};\n'
#                 file_body_str += str_Tab+'\t\tfield reserved {\n'
#                 file_body_str += str_Tab+'\t\t\tbits 4 ;\n'
#                 file_body_str += str_Tab+'\t\t}\n'
#                 file_body_str += str_Tab+'\t}'+f';  #{reg.desc}\n'

#             if bRegGroup and reg.bGroup_stop:
#                 # if not reg.bGroup_start:
#                 #     group_name += '__'+reg.reg_name
#                 #     # 需要修改该group的其他reg的groupName
#                 # nRerived = (group_size-group_startPos) / nRegData_size
#                 # n = 0
#                 # while n < nRerived:
#                 #     file_body_str += f'\tregister  reg_reserved{nRegReservedIndex} ' + '{\n'
#                 #     file_body_str += F'\t\tbytes {nRegData_size};\n'
#                 #     file_body_str += '\t}'+f';  #{reg.desc}\n'
#                 #     nRegReservedIndex += 1
#                 #     n += 1
#                 file_body_str += "\t} ; " + \
#                     f'#group_{group_name} [{group_dim}]\n'
#                 # last_offset = group_size*group_dim + group_startPos
#                 bRegGroup = False
#             if bRegGroup:
#                 group_index += 1

#         file_body_str += '\n}; # End of block module '+modName+'\n'
#         out_file.write(fileHeader)
#         out_file.write(file_body_str)
#         out_file.close()
#         return out_ralf_file_Name


# def outModuleFieldDefaultValueCheckCSrc(module_inst_list, modName):
#     # print(modName)
#     dirName = './module_check_defaultvalue/'+modName
#     if not os.path.exists(dirName):
#         os.makedirs(dirName)
#     out_C_file_Name = dirName+'/main.c'
#     with open(out_C_file_Name, 'w+') as out_file:
#         fileHeader = """// Autor: Auto generate by python From module excel\n
# // Version: 0.0.2 X
# // Description : field default value check for module instance \n
# // Waring: Do NOT Modify it !
# // Copyright (C) 2020-2021 CIP United Co. Ltd.  All Rights Reserved.

# #define DEBUG
# //#define INFO
# #define WARNING
# #define NOTICE
# #define ERROR
# #define PASS
# #define FAIL

# #define CHECK_MODULE_FIELD_DEFAULT_VALUE

# #define CHECK_MOUDLE_FIELD_WRITE_VALUE

# #include "log.h"
# #include "pll.h"

# """
#         filebodystr = f'#include "{modName}_reg.h"\n'
#         filebodystr += """
# int main()
# {
#     //printf("enter main.\\n");
#     uAptiv_clk_init();
# """
#         mod_inst_name = modName.upper()
#         mod_inst = module_inst_list[0]
#         filebodystr += f'\tprintf("After clock switch, Now Check Module: {modName}.\\n");\n'
#         if mod_inst.data_width > 32:
#             filebodystr += f'\tuint64_t nRegFdVal = 0;\n'
#         else:
#             filebodystr += f'\tunsigned int nRegFdVal = 0;\n'
#         mod_count = len(module_inst_list)

#         filebodystr += f'\n\tunsigned int nTotalErr = 0;\n'
#         if mod_count > 1:
#             filebodystr += f'\tst_module_info_{modName} * module_inst[{mod_count}] = ' + \
#                 '{'+f'{mod_inst_name}_0'
#             for i in range(1, mod_count):
#                 filebodystr += f'\n\t\t,{mod_inst_name}_{i}'
#             filebodystr += '};\n\n'
#             filebodystr += '#ifdef CHECK_MODULE_FIELD_DEFAULT_VALUE\n'
#             filebodystr += f'\tunsigned int nErrCount_default[{mod_count}] = '+'{0};\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'

#             filebodystr += '#ifdef CHECK_MOUDLE_FIELD_WRITE_VALUE\n'
#             filebodystr += f'\tunsigned int nErrCount_wirte[{mod_count}] = '+'{0};\n'
#             filebodystr += '#endif // CHECK_MOUDLE_FIELD_WRITE_VALUE\n\n'

#             filebodystr += f'\tfor(int i = 0; i < {mod_count}; ++i)\n'
#             filebodystr += '\t{\n'
#             filebodystr += '#ifdef CHECK_MODULE_FIELD_DEFAULT_VALUE\n'
#             modinst_var = 'module_inst[i]'
#             errCount_var = 'nErrCount_default[i]'
#             errCount_write_var = 'nErrCount_wirte[i]'
#             str1, str2 = getModuleFdStr(
#                 mod_inst, errCount_var, errCount_write_var, modinst_var)
#             filebodystr += str1
#             filebodystr += '\t\tif(nErrCount_default[i])\n'
#             filebodystr += '\t\t{\n'
#             filebodystr += f'\t\t\tError("Inst_%u def-Vals have [%u] fds NOT Same!\\n", i, nErrCount_default[i]);\n'
#             filebodystr += '\t\t\tnTotalErr += nErrCount_default[i];\n'
#             filebodystr += '\t\t}\n'
#             filebodystr += f'\t\telse\n\t\t\tNotice("Inst_%u def-Vals are OK!\\n", i);\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'

#             filebodystr += str2
#             filebodystr += '\t\tif(nErrCount_wirte[i])\n'
#             filebodystr += '\t\t{\n'
#             filebodystr += f'\t\t\tError("Inst_%u write-Vals have [%u] fds NOT Same!\\n", i, nErrCount_wirte[i]);\n'
#             filebodystr += '\t\t\tnTotalErr += nErrCount_wirte[i];\n'
#             filebodystr += '\t\t}\n'
#             filebodystr += f'\t\telse\n\t\t\tNotice("Inst_%u write-Vals are OK!\\n", i);\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'
#             filebodystr += '\t}\n'
#         elif mod_count == 1:
#             filebodystr += f'\tst_module_info_{modName} * module_inst = {mod_inst_name}_0 ;\n'
#             filebodystr += '#ifdef CHECK_MODULE_FIELD_DEFAULT_VALUE\n'
#             filebodystr += f'\tunsigned int nErrCount_default = 0;\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'

#             filebodystr += '#ifdef CHECK_MOUDLE_FIELD_WRITE_VALUE\n'
#             filebodystr += f'\tunsigned int nErrCount_wirte = 0;\n'
#             filebodystr += '#endif // CHECK_MOUDLE_FIELD_WRITE_VALUE\n\n'

#             modinst_var = 'module_inst'
#             errCount_var = 'nErrCount_default'
#             errCount_write_var = 'nErrCount_wirte'
#             # filebodystr += getModuleFdStr(mod_inst,
#             #                               errCount_var, modinst_var, False)
#             str1, str2 = getModuleFdStr(
#                 mod_inst, errCount_var, errCount_write_var, modinst_var, False)

#             filebodystr += str1

#             filebodystr += '\t\tif(nErrCount_default)\n'
#             filebodystr += '\t\t{\n'
#             filebodystr += f'\t\t\tError("Inst_%u def-Vals have [%u] fds NOT Same!\\n", i, nErrCount_default);\n'
#             filebodystr += '\t\t\tnTotalErr += nErrCount_default;\n'
#             filebodystr += '\t\t}\n'
#             filebodystr += f'\t\telse\n\t\t\tNotice("Inst_%u def-Vals are OK!\\n", i);\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'

#             filebodystr += str2
#             filebodystr += '\t\tif(nErrCount_wirte)\n'
#             filebodystr += '\t\t{\n'
#             filebodystr += f'\t\t\tError("Inst_%u write-Vals have [%u] fds NOT Same!\\n", i, nErrCount_wirte);\n'
#             filebodystr += '\t\t\tnTotalErr += nErrCount_wirte;\n'
#             filebodystr += '\t\t}\n'
#             filebodystr += f'\t\telse\n\t\t\tNotice("Inst_%u write-Vals are OK!\\n", i);\n'
#             filebodystr += '#endif // CHECK_MODULE_FIELD_DEFAULT_VALUE\n\n'

#         # i = 0
#         # for module_inst in module_inst_list:
#         #     # print(module_inst.module_info_str())
#         #     modinst_var = f'{module_inst.module_name.upper()}_{i}'
#         #     group_dim = 0
#         #     for reg in module_inst.reg_list:
#         #         if reg.bVirtual:
#         #             continue
#         #         if reg.bGroup_start and reg.group_dim:
#         #             group_dim = reg.group_dim
#         #         if reg.group_index >= 0 and reg.group_name:
#         #             for g_i in range(0, group_dim):
#         #                 for fd in reg.field_list:
#         #                     if fd.field_name.startswith('reserved'):
#         #                         continue
#         #                     reg_fd_var = f'{reg.reg_name}.fd_{fd.field_name}'
#         #                     fd_var = f'{reg.group_name}[{g_i}].{reg_fd_var}'
#         #                     module_fd_var = f'{modinst_var}->{reg.group_name}[{g_i}].st_reg_{reg_fd_var}'
#         #                     filebodystr += f'\tnRegFdVal = {module_fd_var};\n'
#         #                     filebodystr += f'\tif(nRegFdVal != {fd.defaultValue})\n'
#         #                     filebodystr += '\t{\n'
#         #                     filebodystr += f'\t\tError("Module # FD: {modinst_var} # {fd_var} Value [0x%X] is not same! \\n",nRegFdVal);\n'
#         #                     filebodystr += f'\t\t++nErrCount[{i}];\n'
#         #                     filebodystr += '\t}\n'
#         #                     filebodystr += f'\telse\n\t\tInfo("Module # FD: {modinst_var} # {fd_var} Value is same. \\n");\n'
#         #         else:
#         #             for fd in reg.field_list:
#         #                 if fd.field_name.startswith('reserved'):
#         #                     continue
#         #                 fd_var = f'{reg.reg_name}.fd_{fd.field_name}'
#         #                 module_fd_var = f'{modinst_var}->st_reg_{fd_var}'
#         #                 filebodystr += f'\tnRegFdVal = {module_fd_var};\n'
#         #                 filebodystr += f'\tif(nRegFdVal != {fd.defaultValue})\n'
#         #                 filebodystr += '\t{\n'
#         #                 filebodystr += f'\t\tError("Module # FD: {modinst_var} # {fd_var} Value [0x%X] is not same! \\n",nRegFdVal);\n'
#         #                 filebodystr += f'\t\t++nErrCount[{i}];\n'
#         #                 filebodystr += '\t}\n'
#         #                 filebodystr += f'\telse\n\t\tInfo("Module # FD:: {modinst_var} # {fd_var} Value is same. \\n");\n'
#         #         if reg.bGroup_stop:
#         #             group_dim = 0
#         #     i += 1

#         # filebodystr += f'\n\tunsigned int nTotalErr = 0;\n'
#         # filebodystr +=f'\tfor(int i = 0; i < {mod_count}; ++i)\n'
#         # filebodystr +='\t{\n'
#         # filebodystr += '\t\tif(nErrCount[i])\n'
#         # filebodystr +='\t\t{\n'
#         # filebodystr += f'\t\t\tError("{mod_inst_name}_%u default values have [%u] fields NOT Same!\\n",i,nErrCount[i]);\n'
#         # filebodystr += '\t\t\tnTotalErr += nErrCount[i];\n'
#         # filebodystr +='\t\t}\n'
#         # filebodystr += f'\t\telse\n\t\t\tInfo("{mod_inst_name}_%u default values are All Same!\\n",i);\n'
#         # filebodystr +='\t}\n'
#         filebodystr += f'\tif(nTotalErr == 0)\n'
#         filebodystr += f'\t\tPass("{modName} Vals OK!\\n");\n'
#         filebodystr += f'\telse\n\t\tFail("{modName} Vals Not OK!\\n");\n'
#         filebodystr += '\n\treturn 0;\n}\n'
#         out_file.write(fileHeader)
#         out_file.write(filebodystr)
#         out_file.close()

#         return out_C_file_Name


# def fieldWriteChk_func(errCount_Write_var, str_Tab, fd_var, module_fd_var, strfdMask):
    # fdWriteCheckstr=''
    # fdWriteCheckstr += f'{str_Tab}\t{module_fd_var} = {strfdMask};\n'
    # fdWriteCheckstr += f'{str_Tab}\tnRegFdVal = {module_fd_var};\n'
    # fdWriteCheckstr += f'{str_Tab}\tif({module_fd_var} != {strfdMask})\n{str_Tab}'
    # fdWriteCheckstr += '\t{\n'
    # fdWriteCheckstr += f'{str_Tab}\t\tError("Inst_%u # {fd_var}  [0x%X] NOt same as Write [{strfdMask}]! \\n", i, nRegFdVal);\n'
    # fdWriteCheckstr += f'{str_Tab}\t\t++{errCount_Write_var};\n{str_Tab}'
    # fdWriteCheckstr += '\t}\n'
    # return fdWriteCheckstr


def checkDeviceSheet(ws):
    name = ws['B3'].value
    st_dev = St_Device(name)
    st_dev.vendor = ws['B2'].value
    st_dev.version = ws['B4'].value
    st_dev.series = ws['B5'].value
    st_dev.width = ws['B6'].value
    st_dev.desc = ws['B7'].value

    row = 9
    mem_row_pos = cpu_row_pos = 0
    nRows = ws.max_row
    while row <= nRows:
        val = ws.cell(row, 1).value
        if val == 'cpus:':
            cpu_row_pos = row
        elif val == 'memories:':
            mem_row_pos = row
        row += 1

    if cpu_row_pos > 0:
        end_row_pos = nRows
        if mem_row_pos > cpu_row_pos+2:
            end_row_pos = mem_row_pos-1
        if end_row_pos > cpu_row_pos+2:
            for row_i in range(cpu_row_pos+2, end_row_pos):
                cpu_name = ws.cell(row_i, 2).value
                revision = ws.cell(row_i, 3).value
                endian = ws.cell(row_i, 4).value
                srs = ws.cell(row_i, 5).value
                mpu = ws.cell(row_i, 6).value
                fpu = ws.cell(row_i, 7).value
                dsp = ws.cell(row_i, 8).value
                if cpu_name and revision and endian and srs and mpu and fpu and dsp:
                    st_cpu = St_CPU(cpu_name)
                    st_cpu.derivedFrom = ws.cell(row_i, 1).value
                    st_cpu.revision = revision
                    st_cpu.endian = endian
                    st_cpu.srs = srs
                    st_cpu.mpu = mpu
                    st_cpu.dsp = dsp
                    st_dev.cpus.append(st_cpu)

    if mem_row_pos > 0:
        end_row_pos = nRows
        if end_row_pos > mem_row_pos+2:
            for row_i in range(mem_row_pos+2, end_row_pos):
                mem_name = ws.cell(row_i, 2).value
                addrbase = ws.cell(row_i, 3).value
                addrOffset = ws.cell(row_i, 4).value
                size = ws.cell(row_i, 5).value
                access = ws.cell(row_i, 6).value
                usage = ws.cell(row_i, 7).value
                if mem_name and addrbase and addrOffset and addrOffset and size and access and usage:
                    st_mem = St_Memory(mem_name)
                    st_mem.derivedFrom = ws.cell(row_i, 1).value
                    st_mem.addrBase = addrbase
                    st_mem.addrOffset = addrOffset
                    st_mem.size = size
                    st_mem.access = access
                    st_mem.usage = usage
                    st_mem.processor = ws.cell(row_i, 8).value
                    desc = ws.cell(row_i, 9).value
                    if desc:
                        st_mem.desc = desc
                    st_dev.memories.append(st_mem)

    return st_dev


def dealwith_excel(xls_file, outFlag=1):
    # "UART_final_202301010.xls"
    wb = load_workbook(xls_file, data_only=True)
    sheetNames = wb.sheetnames
    st_dev = None
    checkErr = False
    module_file_lst=[]
    for sh_name in sheetNames:
        # 遍历 sheet, preface sheet不处理, module_tpl sheet不处理
        if sh_name in ('preface', 'module_tpl'):
            continue
        elif sh_name == 'device':
            # 先读取device sheet
            ws = wb[sh_name]
            st_dev = checkDeviceSheet(ws)
            # print(st_dev.get_inst_str())
        else:
            # 再逐一读取peripheral sheet
            ws = wb[sh_name]
            err, perip_lst,irq_set = checkModuleSheetValue(ws, sh_name)
            if not err:
                checkErr = True
            else:
                if outFlag == 1:
                    mod_file =output_C_moduleFile(perip_lst, sh_name, st_dev.version)
                    module_file_lst.append(mod_file)
                st_dev.peripherals[sh_name] = perip_lst
                if irq_set and isinstance(irq_set,set):
                    st_dev.interupts.update(irq_set)
                

    if checkErr:
        filename = os.path.basename(xls_file)
        out_mark_xlsx_file = filename.replace('.xlsx', '_errMk.xlsx')
        print("Check Failed. Please review "+out_mark_xlsx_file+" and fix it.")
        wb.save(out_mark_xlsx_file)
    else:
        if outFlag == 2:
            pass
        elif outFlag == 1:
            # 输出dev文件
            output_C_devFile(st_dev,module_file_lst)
            pass


if __name__ == '__main__':
    # 全路径是为方便在vscode中进行调试
    # file_name = 'D:/workspace/demopy/excel_flow/excel/ahb_cfg_20230925.xlsx'
    file_name = './XY2器件描述文件.xlsx'
    dealwith_excel(file_name)
