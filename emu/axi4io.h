// Generated by AXI4Mem.py
#ifndef __AXI4IO_H
#define __AXI4IO_H

#define AXI4IO(prefix, underscore) \
  unsigned char prefix##underscore##awsize, \
  int prefix##underscore##araddr, \
  int prefix##underscore##awaddr, \
  unsigned char* prefix##underscore##wready, \
  unsigned char prefix##underscore##wstrb, \
  unsigned char* prefix##underscore##rresp, \
  long long* prefix##underscore##rdata, \
  unsigned char prefix##underscore##wvalid, \
  long long prefix##underscore##wdata, \
  unsigned char prefix##underscore##wid, \
  unsigned char prefix##underscore##awlen, \
  unsigned char* prefix##underscore##rvalid, \
  unsigned char prefix##underscore##awlock, \
  unsigned char prefix##underscore##awburst, \
  unsigned char* prefix##underscore##rid, \
  unsigned char* prefix##underscore##bresp, \
  unsigned char prefix##underscore##awid, \
  unsigned char prefix##underscore##arsize, \
  unsigned char prefix##underscore##rready, \
  unsigned char prefix##underscore##awcache, \
  unsigned char prefix##underscore##wlast, \
  unsigned char* prefix##underscore##rlast, \
  unsigned char prefix##underscore##arburst, \
  unsigned char* prefix##underscore##arready, \
  unsigned char prefix##underscore##arcache, \
  unsigned char prefix##underscore##arprot, \
  unsigned char prefix##underscore##arlen, \
  unsigned char prefix##underscore##awvalid, \
  unsigned char prefix##underscore##arid, \
  unsigned char prefix##underscore##bready, \
  unsigned char prefix##underscore##arlock, \
  unsigned char prefix##underscore##awprot, \
  unsigned char prefix##underscore##arvalid, \
  unsigned char* prefix##underscore##bvalid, \
  unsigned char* prefix##underscore##bid, \
  unsigned char* prefix##underscore##awready

#define AXI4ARGS(prefix) \
  prefix##_awsize, \
  prefix##_araddr, \
  prefix##_awaddr, \
  prefix##_wready, \
  prefix##_wstrb, \
  prefix##_rresp, \
  prefix##_rdata, \
  prefix##_wvalid, \
  prefix##_wdata, \
  prefix##_wid, \
  prefix##_awlen, \
  prefix##_rvalid, \
  prefix##_awlock, \
  prefix##_awburst, \
  prefix##_rid, \
  prefix##_bresp, \
  prefix##_awid, \
  prefix##_arsize, \
  prefix##_rready, \
  prefix##_awcache, \
  prefix##_wlast, \
  prefix##_rlast, \
  prefix##_arburst, \
  prefix##_arready, \
  prefix##_arcache, \
  prefix##_arprot, \
  prefix##_arlen, \
  prefix##_awvalid, \
  prefix##_arid, \
  prefix##_bready, \
  prefix##_arlock, \
  prefix##_awprot, \
  prefix##_arvalid, \
  prefix##_bvalid, \
  prefix##_bid, \
  prefix##_awready

#endif
