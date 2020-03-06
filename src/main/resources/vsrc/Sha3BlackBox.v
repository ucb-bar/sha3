module CtrlModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125778.2]
  input         clock, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125779.4]
  input         reset, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125780.4]
  input         io_rocc_req_val, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_rocc_req_rdy, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input  [1:0]  io_rocc_funct, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input  [63:0] io_rocc_rs1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input  [63:0] io_rocc_rs2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_busy, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_dmem_req_val, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input         io_dmem_req_rdy, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [5:0]  io_dmem_req_tag, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [39:0] io_dmem_req_addr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [4:0]  io_dmem_req_cmd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input         io_dmem_resp_val, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input  [6:0]  io_dmem_resp_tag, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  input  [63:0] io_dmem_resp_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [4:0]  io_round, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_absorb, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [4:0]  io_aindex, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_init, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output        io_write, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [2:0]  io_windex, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
  output [63:0] io_buffer_out // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125781.4]
);
  reg [63:0] msg_addr; // @[ctrl.scala 64:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125786.4]
  reg [63:0] _RAND_0;
  reg [63:0] hash_addr; // @[ctrl.scala 65:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125787.4]
  reg [63:0] _RAND_1;
  reg [63:0] msg_len; // @[ctrl.scala 66:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125788.4]
  reg [63:0] _RAND_2;
  reg  busy; // @[ctrl.scala 68:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125789.4]
  reg [31:0] _RAND_3;
  reg  dmem_resp_val_reg; // @[ctrl.scala 79:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125801.4]
  reg [31:0] _RAND_4;
  reg [6:0] dmem_resp_tag_reg; // @[ctrl.scala 80:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125803.4]
  reg [31:0] _RAND_5;
  reg [2:0] mem_s; // @[ctrl.scala 84:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125805.4]
  reg [31:0] _RAND_6;
  reg [63:0] buffer_0; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_7;
  reg [63:0] buffer_1; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_8;
  reg [63:0] buffer_2; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_9;
  reg [63:0] buffer_3; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_10;
  reg [63:0] buffer_4; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_11;
  reg [63:0] buffer_5; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_12;
  reg [63:0] buffer_6; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_13;
  reg [63:0] buffer_7; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_14;
  reg [63:0] buffer_8; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_15;
  reg [63:0] buffer_9; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_16;
  reg [63:0] buffer_10; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_17;
  reg [63:0] buffer_11; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_18;
  reg [63:0] buffer_12; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_19;
  reg [63:0] buffer_13; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_20;
  reg [63:0] buffer_14; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_21;
  reg [63:0] buffer_15; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_22;
  reg [63:0] buffer_16; // @[ctrl.scala 90:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125826.4]
  reg [63:0] _RAND_23;
  reg  buffer_valid; // @[ctrl.scala 111:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125838.4]
  reg [31:0] _RAND_24;
  reg [4:0] buffer_count; // @[ctrl.scala 112:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125839.4]
  reg [31:0] _RAND_25;
  reg [31:0] read; // @[ctrl.scala 113:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125840.4]
  reg [31:0] _RAND_26;
  reg [31:0] hashed; // @[ctrl.scala 114:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125841.4]
  reg [31:0] _RAND_27;
  reg  areg; // @[ctrl.scala 115:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125842.4]
  reg [31:0] _RAND_28;
  reg [4:0] mindex; // @[ctrl.scala 116:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125843.4]
  reg [31:0] _RAND_29;
  reg [2:0] windex; // @[ctrl.scala 117:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125844.4]
  reg [31:0] _RAND_30;
  reg [4:0] aindex; // @[ctrl.scala 118:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125845.4]
  reg [31:0] _RAND_31;
  reg [4:0] pindex; // @[ctrl.scala 119:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125846.4]
  reg [31:0] _RAND_32;
  reg  writes_done_0; // @[ctrl.scala 120:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125853.4]
  reg [31:0] _RAND_33;
  reg  writes_done_1; // @[ctrl.scala 120:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125853.4]
  reg [31:0] _RAND_34;
  reg  writes_done_2; // @[ctrl.scala 120:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125853.4]
  reg [31:0] _RAND_35;
  reg  writes_done_3; // @[ctrl.scala 120:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125853.4]
  reg [31:0] _RAND_36;
  reg  next_buff_val; // @[ctrl.scala 121:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125854.4]
  reg [31:0] _RAND_37;
  wire  _T_2; // @[ctrl.scala 123:36:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125855.4]
  wire  _T_3; // @[ctrl.scala 124:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125856.4]
  wire  _T_4; // @[ctrl.scala 123:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125857.4]
  reg [4:0] _T_5; // @[ctrl.scala 132:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125859.4]
  reg [31:0] _RAND_38;
  wire [63:0] _GEN_1; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_2; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_3; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_4; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_5; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_6; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_7; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_8; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_9; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_10; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_11; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_12; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_13; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_14; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire [63:0] _GEN_15; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  wire  _T_6; // @[ctrl.scala 156:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125867.4]
  wire [4:0] _T_8; // @[ctrl.scala 156:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125869.4]
  wire [4:0] words_filled; // @[ctrl.scala 156:8:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125870.4]
  wire [63:0] _GEN_0; // @[ctrl.scala 163:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125871.4]
  wire [3:0] byte_offset; // @[ctrl.scala 163:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125871.4]
  reg [2:0] state; // @[ctrl.scala 169:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125872.4]
  reg [31:0] _RAND_39;
  reg [4:0] rindex; // @[ctrl.scala 172:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125873.4]
  reg [31:0] _RAND_40;
  reg [4:0] rindex_reg; // @[ctrl.scala 189:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125887.4]
  reg [31:0] _RAND_41;
  wire  _T_10; // @[ctrl.scala 194:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125891.6]
  wire  _T_12; // @[ctrl.scala 195:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125894.6]
  wire  _T_13; // @[ctrl.scala 196:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125896.8]
  wire  _T_14; // @[ctrl.scala 202:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125904.10]
  wire  _GEN_17; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  wire  _GEN_18; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  wire [63:0] _GEN_20; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  wire  _GEN_21; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire [63:0] _GEN_22; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire [63:0] _GEN_23; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire  _GEN_24; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire  _GEN_25; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire [63:0] _GEN_26; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  wire [63:0] _GEN_28; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  wire [63:0] _GEN_29; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  wire  _GEN_31; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  wire [63:0] _GEN_32; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  wire  _T_15; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125913.4]
  wire [63:0] _GEN_1009; // @[ctrl.scala 228:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125915.6]
  wire  _T_16; // @[ctrl.scala 228:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125915.6]
  wire  _T_17; // @[ctrl.scala 228:54:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125916.6]
  wire  _T_18; // @[ctrl.scala 228:77:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125917.6]
  wire  _T_19; // @[ctrl.scala 228:66:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125918.6]
  wire  _T_20; // @[ctrl.scala 228:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125919.6]
  wire  _T_21; // @[ctrl.scala 229:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125920.6]
  wire  _T_22; // @[ctrl.scala 229:50:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125921.6]
  wire  _T_23; // @[ctrl.scala 229:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125922.6]
  wire  _T_24; // @[ctrl.scala 228:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125923.6]
  wire  _T_25; // @[ctrl.scala 228:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125924.6]
  wire [4:0] _GEN_39; // @[ctrl.scala 230:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125925.6]
  wire  _T_26; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125935.6]
  wire  _T_27; // @[ctrl.scala 242:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125937.8]
  wire  _T_29; // @[ctrl.scala 243:51:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125940.10]
  wire  _T_30; // @[ctrl.scala 243:41:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125941.10]
  wire  _T_31; // @[ctrl.scala 249:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125947.10]
  wire [4:0] _T_33; // @[ctrl.scala 250:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125950.12]
  wire [63:0] _T_35; // @[ctrl.scala 251:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125953.12]
  wire [31:0] _T_37; // @[ctrl.scala 252:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125956.12]
  wire [63:0] _GEN_43; // @[ctrl.scala 249:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125948.10]
  wire [31:0] _GEN_44; // @[ctrl.scala 249:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125948.10]
  wire [31:0] _GEN_45; // @[ctrl.scala 262:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125962.10]
  wire  _GEN_46; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  wire [63:0] _GEN_47; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  wire [4:0] _GEN_48; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  wire [63:0] _GEN_52; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  wire [31:0] _GEN_53; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  wire  _T_39; // @[ctrl.scala 272:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125966.8]
  wire  _T_40; // @[ctrl.scala 274:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125968.10]
  wire [63:0] _T_42; // @[ctrl.scala 277:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125971.12]
  wire  _T_43; // @[ctrl.scala 277:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125972.12]
  wire  _GEN_54; // @[ctrl.scala 277:41:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125973.12]
  wire  _GEN_57; // @[ctrl.scala 274:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125969.10]
  wire  _T_46; // @[ctrl.scala 291:14:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125989.10]
  wire  _T_47; // @[ctrl.scala 290:46:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125990.10]
  wire [63:0] _GEN_1014; // @[ctrl.scala 300:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126006.12]
  wire  _T_56; // @[ctrl.scala 300:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126006.12]
  wire  _GEN_60; // @[ctrl.scala 300:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126007.12]
  wire [63:0] _GEN_65; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  wire [31:0] _GEN_66; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  wire  _GEN_67; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  wire  _GEN_69; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  wire [63:0] _GEN_73; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  wire [31:0] _GEN_74; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  wire  _T_57; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126019.8]
  wire [4:0] _T_61; // @[ctrl.scala 324:36:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126026.12]
  wire [63:0] _T_72; // @[ctrl.scala 354:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126058.16]
  wire  _GEN_98; // @[ctrl.scala 355:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126063.16]
  wire [63:0] _GEN_102; // @[ctrl.scala 346:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126053.14]
  wire  _GEN_103; // @[ctrl.scala 346:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126053.14]
  wire  _GEN_105; // @[ctrl.scala 327:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126029.12]
  wire [63:0] _GEN_108; // @[ctrl.scala 327:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126029.12]
  wire [4:0] _GEN_126; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  wire  _GEN_127; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  wire [63:0] _GEN_130; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  wire  _T_76; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126077.10]
  wire  _T_77; // @[ctrl.scala 376:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126080.12]
  wire  _T_78; // @[ctrl.scala 376:46:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126081.12]
  wire  _T_79; // @[ctrl.scala 376:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126082.12]
  wire  _T_80; // @[ctrl.scala 376:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126083.12]
  wire  _T_81; // @[ctrl.scala 378:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126085.14]
  wire  _T_82; // @[ctrl.scala 378:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126086.14]
  wire  _T_83; // @[ctrl.scala 378:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126087.14]
  wire  _T_84; // @[ctrl.scala 381:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126089.16]
  wire [4:0] _T_86; // @[ctrl.scala 381:65:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126091.16]
  wire  _T_87; // @[ctrl.scala 381:49:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126092.16]
  wire  _T_88; // @[ctrl.scala 381:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126093.16]
  wire  _T_89; // @[ctrl.scala 382:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126094.16]
  wire  _T_90; // @[ctrl.scala 382:14:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126095.16]
  wire [63:0] _GEN_131; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_132; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_133; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_134; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_135; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_136; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_137; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_138; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_139; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_140; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_141; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_142; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_143; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_144; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_145; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_146; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire [63:0] _GEN_147; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  wire  _T_92; // @[ctrl.scala 399:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126105.16]
  wire  _T_93; // @[ctrl.scala 403:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126107.18]
  wire  _T_94; // @[ctrl.scala 404:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126109.20]
  wire [63:0] _GEN_183; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_184; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_185; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_186; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_187; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_188; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_189; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_190; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_191; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_192; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_193; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_194; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_195; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_196; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_197; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _GEN_198; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [55:0] _T_95; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  wire [63:0] _T_96; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126112.22]
  wire  _T_98; // @[ctrl.scala 421:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126121.20]
  wire [63:0] _T_101; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126128.22]
  wire  _T_102; // @[ctrl.scala 441:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126134.18]
  wire  _T_103; // @[ctrl.scala 443:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126136.20]
  wire  _T_104; // @[ctrl.scala 445:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126138.22]
  wire [7:0] _T_105; // @[ctrl.scala 455:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126140.24]
  wire [10:0] _T_106; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126141.24]
  wire [63:0] _buffer_pindex_7; // @[ctrl.scala 455:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126142.24 ctrl.scala 455:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126142.24]
  wire  _T_107; // @[ctrl.scala 457:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126145.24]
  wire [15:0] _T_108; // @[ctrl.scala 465:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126147.26]
  wire [18:0] _T_109; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126148.26]
  wire [63:0] _buffer_pindex_9; // @[ctrl.scala 465:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126149.26 ctrl.scala 465:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126149.26]
  wire  _T_110; // @[ctrl.scala 467:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126152.26]
  wire [23:0] _T_111; // @[ctrl.scala 475:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126154.28]
  wire [26:0] _T_112; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126155.28]
  wire [63:0] _buffer_pindex_11; // @[ctrl.scala 475:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126156.28 ctrl.scala 475:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126156.28]
  wire  _T_113; // @[ctrl.scala 477:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126159.28]
  wire [31:0] _T_114; // @[ctrl.scala 485:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126161.30]
  wire [34:0] _T_115; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126162.30]
  wire [63:0] _buffer_pindex_13; // @[ctrl.scala 485:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126163.30 ctrl.scala 485:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126163.30]
  wire  _T_116; // @[ctrl.scala 487:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126166.30]
  wire [39:0] _T_117; // @[ctrl.scala 495:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126168.32]
  wire [42:0] _T_118; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126169.32]
  wire [63:0] _buffer_pindex_15; // @[ctrl.scala 495:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126170.32 ctrl.scala 495:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126170.32]
  wire  _T_119; // @[ctrl.scala 497:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126173.32]
  wire [47:0] _T_120; // @[ctrl.scala 505:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126175.34]
  wire [50:0] _T_121; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126176.34]
  wire [63:0] _buffer_pindex_17; // @[ctrl.scala 505:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126177.34 ctrl.scala 505:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126177.34]
  wire [58:0] _T_124; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126183.36]
  wire [63:0] _buffer_pindex_19; // @[ctrl.scala 515:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126184.36 ctrl.scala 515:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126184.36]
  wire  _T_125; // @[ctrl.scala 520:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126188.22]
  wire  _T_127; // @[ctrl.scala 520:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126190.22]
  wire [4:0] _GEN_658; // @[ctrl.scala 537:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126200.14]
  wire [4:0] _T_133; // @[ctrl.scala 565:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126222.16]
  wire [4:0] _GEN_665; // @[ctrl.scala 534:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126198.12]
  wire  _T_134; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126229.12]
  wire  _T_135; // @[ctrl.scala 574:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126232.14]
  wire  _GEN_670; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126230.12]
  wire  _GEN_672; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126078.10]
  wire [4:0] _GEN_691; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126078.10]
  wire [4:0] _GEN_712; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  wire  _GEN_713; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  wire [63:0] _GEN_716; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  wire  _GEN_719; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [63:0] _GEN_720; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [4:0] _GEN_721; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [63:0] _GEN_725; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [31:0] _GEN_726; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire  _GEN_727; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [4:0] _GEN_747; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  wire [4:0] _GEN_749; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire  _GEN_752; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire [63:0] _GEN_753; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire [4:0] _GEN_754; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire [63:0] _GEN_757; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire [31:0] _GEN_758; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire  _GEN_759; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  wire [4:0] _T_136; // @[ctrl.scala 582:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126238.6]
  wire  _T_137; // @[ctrl.scala 582:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126239.6]
  wire [4:0] _GEN_813; // @[ctrl.scala 582:59:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126240.6]
  wire [4:0] _GEN_831; // @[ctrl.scala 581:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126237.4]
  wire  _T_142; // @[ctrl.scala 595:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126249.4]
  wire  _T_143; // @[ctrl.scala 594:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126250.4]
  wire  _T_144; // @[ctrl.scala 597:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126252.6]
  wire  _GEN_832; // @[ctrl.scala 597:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126253.6]
  wire  _GEN_833; // @[ctrl.scala 595:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126251.4]
  wire  _T_145; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126259.4]
  wire  _T_146; // @[ctrl.scala 610:39:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126261.6]
  wire  _T_147; // @[ctrl.scala 610:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126262.6]
  wire [63:0] _GEN_1019; // @[ctrl.scala 610:81:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126263.6]
  wire  _T_148; // @[ctrl.scala 610:81:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126263.6]
  wire  _T_149; // @[ctrl.scala 610:71:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126264.6]
  wire  _T_150; // @[ctrl.scala 610:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126265.6]
  wire  _GEN_834; // @[ctrl.scala 611:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126266.6]
  wire  _T_151; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126275.6]
  wire  _T_152; // @[ctrl.scala 619:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126277.8]
  wire [4:0] _T_154; // @[ctrl.scala 621:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126281.8]
  wire  _T_155; // @[ctrl.scala 622:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126283.8]
  wire [31:0] _T_157; // @[ctrl.scala 630:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126291.10]
  wire  _T_158; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126300.8]
  wire  _T_159; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126306.10]
  wire  _T_160; // @[ctrl.scala 642:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126308.12]
  wire [4:0] _T_165; // @[ctrl.scala 651:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126323.16]
  wire  _T_166; // @[ctrl.scala 658:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126332.14]
  wire  _T_167; // @[ctrl.scala 658:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126333.14]
  wire  _T_168; // @[ctrl.scala 658:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126334.14]
  wire  _T_169; // @[ctrl.scala 658:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126335.14]
  wire  _T_170; // @[ctrl.scala 658:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126336.14]
  wire  _GEN_854; // @[ctrl.scala 642:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126309.12]
  wire  _T_171; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126347.12]
  wire  _T_172; // @[ctrl.scala 669:31:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126349.14]
  wire [4:0] _GEN_1022; // @[ctrl.scala 671:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126352.14]
  wire [4:0] _T_174; // @[ctrl.scala 671:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126353.14]
  wire [2:0] _T_176; // @[ctrl.scala 675:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126358.16]
  wire [63:0] _T_178; // @[ctrl.scala 676:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126361.16]
  wire [4:0] _T_179; // @[ctrl.scala 682:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126365.16]
  wire  _T_180; // @[ctrl.scala 682:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126366.16]
  wire [4:0] _T_183; // @[ctrl.scala 684:43:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126370.18]
  wire [1:0] _T_184; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126371.18]
  wire  _GEN_1023; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_860; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_1024; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_861; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_1025; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_862; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_1026; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _GEN_863; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  wire  _T_185; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126375.14]
  wire  _T_186; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126376.14]
  wire  _T_187; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126377.14]
  wire  _GEN_888; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  wire [63:0] _GEN_889; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  wire [4:0] _GEN_890; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  wire  _GEN_906; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  wire  _GEN_911; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire  _GEN_915; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire [63:0] _GEN_916; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire [4:0] _GEN_917; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire  _GEN_918; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire  _GEN_931; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  wire  _GEN_937; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire  _GEN_940; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire [63:0] _GEN_941; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire [4:0] _GEN_942; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire  _GEN_943; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire  _GEN_956; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  wire  _GEN_957; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire  _GEN_969; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire [63:0] _GEN_970; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire [4:0] _GEN_971; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire  _GEN_972; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire  _GEN_982; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  wire [63:0] _GEN_997; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  wire [4:0] _GEN_998; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  wire  _GEN_999; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  assign _T_2 = buffer_count >= mindex; // @[ctrl.scala 123:36:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125855.4]
  assign _T_3 = pindex >= 5'h10; // @[ctrl.scala 124:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125856.4]
  assign _T_4 = _T_2 & _T_3; // @[ctrl.scala 123:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125857.4]
  assign _GEN_1 = 5'h1 == io_aindex ? buffer_1 : buffer_0; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_2 = 5'h2 == io_aindex ? buffer_2 : _GEN_1; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_3 = 5'h3 == io_aindex ? buffer_3 : _GEN_2; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_4 = 5'h4 == io_aindex ? buffer_4 : _GEN_3; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_5 = 5'h5 == io_aindex ? buffer_5 : _GEN_4; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_6 = 5'h6 == io_aindex ? buffer_6 : _GEN_5; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_7 = 5'h7 == io_aindex ? buffer_7 : _GEN_6; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_8 = 5'h8 == io_aindex ? buffer_8 : _GEN_7; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_9 = 5'h9 == io_aindex ? buffer_9 : _GEN_8; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_10 = 5'ha == io_aindex ? buffer_10 : _GEN_9; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_11 = 5'hb == io_aindex ? buffer_11 : _GEN_10; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_12 = 5'hc == io_aindex ? buffer_12 : _GEN_11; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_13 = 5'hd == io_aindex ? buffer_13 : _GEN_12; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_14 = 5'he == io_aindex ? buffer_14 : _GEN_13; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _GEN_15 = 5'hf == io_aindex ? buffer_15 : _GEN_14; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
  assign _T_6 = mindex > 5'h0; // @[ctrl.scala 156:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125867.4]
  assign _T_8 = mindex - 5'h1; // @[ctrl.scala 156:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125869.4]
  assign words_filled = _T_6 ? _T_8 : mindex; // @[ctrl.scala 156:8:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125870.4]
  assign _GEN_0 = msg_len % 64'h8; // @[ctrl.scala 163:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125871.4]
  assign byte_offset = _GEN_0[3:0]; // @[ctrl.scala 163:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125871.4]
  assign _T_10 = busy == 1'h0; // @[ctrl.scala 194:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125891.6]
  assign _T_12 = io_rocc_req_val & _T_10; // @[ctrl.scala 195:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125894.6]
  assign _T_13 = io_rocc_funct == 2'h0; // @[ctrl.scala 196:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125896.8]
  assign _T_14 = io_rocc_funct == 2'h1; // @[ctrl.scala 202:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125904.10]
  assign _GEN_17 = _T_14 | busy; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  assign _GEN_18 = _T_14 | _T_10; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  assign _GEN_20 = _T_14 ? io_rocc_rs1 : msg_len; // @[ctrl.scala 202:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125905.10]
  assign _GEN_21 = _T_13 | _GEN_18; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_22 = _T_13 ? io_rocc_rs1 : msg_addr; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_23 = _T_13 ? io_rocc_rs2 : hash_addr; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_24 = _T_13 | _GEN_17; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_25 = _T_13 ? busy : _GEN_17; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_26 = _T_13 ? msg_len : _GEN_20; // @[ctrl.scala 196:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125897.8]
  assign _GEN_28 = _T_12 ? _GEN_22 : msg_addr; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  assign _GEN_29 = _T_12 ? _GEN_23 : hash_addr; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  assign _GEN_31 = _T_12 ? _GEN_25 : busy; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  assign _GEN_32 = _T_12 ? _GEN_26 : msg_len; // @[ctrl.scala 195:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125895.6]
  assign _T_15 = 3'h0 == mem_s; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125913.4]
  assign _GEN_1009 = {{32'd0}, read}; // @[ctrl.scala 228:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125915.6]
  assign _T_16 = _GEN_1009 < msg_len; // @[ctrl.scala 228:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125915.6]
  assign _T_17 = _GEN_1009 == msg_len; // @[ctrl.scala 228:54:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125916.6]
  assign _T_18 = msg_len == 64'h0; // @[ctrl.scala 228:77:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125917.6]
  assign _T_19 = _T_17 & _T_18; // @[ctrl.scala 228:66:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125918.6]
  assign _T_20 = _T_16 | _T_19; // @[ctrl.scala 228:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125919.6]
  assign _T_21 = buffer_valid == 1'h0; // @[ctrl.scala 229:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125920.6]
  assign _T_22 = buffer_count == 5'h0; // @[ctrl.scala 229:50:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125921.6]
  assign _T_23 = _T_21 & _T_22; // @[ctrl.scala 229:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125922.6]
  assign _T_24 = _T_20 & _T_23; // @[ctrl.scala 228:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125923.6]
  assign _T_25 = busy & _T_24; // @[ctrl.scala 228:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125924.6]
  assign _GEN_39 = _T_25 ? 5'h0 : buffer_count; // @[ctrl.scala 230:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125925.6]
  assign _T_26 = 3'h1 == mem_s; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125935.6]
  assign _T_27 = state != 3'h4; // @[ctrl.scala 242:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125937.8]
  assign _T_29 = mindex < 5'h11; // @[ctrl.scala 243:51:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125940.10]
  assign _T_30 = _T_16 & _T_29; // @[ctrl.scala 243:41:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125941.10]
  assign _T_31 = io_dmem_req_rdy & io_dmem_req_val; // @[ctrl.scala 249:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125947.10]
  assign _T_33 = mindex + 5'h1; // @[ctrl.scala 250:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125950.12]
  assign _T_35 = msg_addr + 64'h8; // @[ctrl.scala 251:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125953.12]
  assign _T_37 = read + 32'h8; // @[ctrl.scala 252:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125956.12]
  assign _GEN_43 = _T_31 ? _T_35 : _GEN_28; // @[ctrl.scala 249:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125948.10]
  assign _GEN_44 = _T_31 ? _T_37 : read; // @[ctrl.scala 249:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125948.10]
  assign _GEN_45 = _T_18 ? 32'h1 : _GEN_44; // @[ctrl.scala 262:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125962.10]
  assign _GEN_46 = _T_27 & _T_30; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  assign _GEN_47 = _T_27 ? msg_addr : 64'h0; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  assign _GEN_48 = _T_27 ? mindex : rindex; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  assign _GEN_52 = _T_27 ? _GEN_43 : _GEN_28; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  assign _GEN_53 = _T_27 ? _GEN_45 : read; // @[ctrl.scala 242:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125938.8]
  assign _T_39 = mindex < 5'h10; // @[ctrl.scala 272:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125966.8]
  assign _T_40 = msg_len > _GEN_1009; // @[ctrl.scala 274:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125968.10]
  assign _T_42 = msg_len + 64'h8; // @[ctrl.scala 277:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125971.12]
  assign _T_43 = _T_42 < _GEN_1009; // @[ctrl.scala 277:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125972.12]
  assign _GEN_54 = _T_43 ? 1'h0 : buffer_valid; // @[ctrl.scala 277:41:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125973.12]
  assign _GEN_57 = _T_40 & _GEN_54; // @[ctrl.scala 274:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125969.10]
  assign _T_46 = _T_31 == 1'h0; // @[ctrl.scala 291:14:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125989.10]
  assign _T_47 = _T_29 & _T_46; // @[ctrl.scala 290:46:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125990.10]
  assign _GEN_1014 = {{32'd0}, _T_37}; // @[ctrl.scala 300:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126006.12]
  assign _T_56 = msg_len < _GEN_1014; // @[ctrl.scala 300:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126006.12]
  assign _GEN_60 = _T_56 ? 1'h0 : buffer_valid; // @[ctrl.scala 300:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126007.12]
  assign _GEN_65 = _T_47 ? _GEN_52 : _T_35; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  assign _GEN_66 = _T_47 ? _GEN_53 : _T_37; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  assign _GEN_67 = _T_47 ? buffer_valid : _GEN_60; // @[ctrl.scala 291:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125991.10]
  assign _GEN_69 = _T_39 ? _GEN_57 : _GEN_67; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  assign _GEN_73 = _T_39 ? _GEN_52 : _GEN_65; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  assign _GEN_74 = _T_39 ? _GEN_53 : _GEN_66; // @[ctrl.scala 272:48:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125967.8]
  assign _T_57 = 3'h2 == mem_s; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126019.8]
  assign _T_61 = buffer_count + 5'h1; // @[ctrl.scala 324:36:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126026.12]
  assign _T_72 = msg_addr + 64'h88; // @[ctrl.scala 354:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126058.16]
  assign _GEN_98 = _T_56 ? 1'h0 : 1'h1; // @[ctrl.scala 355:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126063.16]
  assign _GEN_102 = _T_47 ? _GEN_28 : _T_72; // @[ctrl.scala 346:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126053.14]
  assign _GEN_103 = _T_47 ? buffer_valid : _GEN_98; // @[ctrl.scala 346:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126053.14]
  assign _GEN_105 = _T_39 ? _GEN_57 : _GEN_103; // @[ctrl.scala 327:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126029.12]
  assign _GEN_108 = _T_39 ? _GEN_28 : _GEN_102; // @[ctrl.scala 327:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126029.12]
  assign _GEN_126 = io_dmem_resp_val ? _T_61 : buffer_count; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  assign _GEN_127 = io_dmem_resp_val ? _GEN_105 : buffer_valid; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  assign _GEN_130 = io_dmem_resp_val ? _GEN_108 : _GEN_28; // @[ctrl.scala 315:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126021.10]
  assign _T_76 = 3'h3 == mem_s; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126077.10]
  assign _T_77 = buffer_count < mindex; // @[ctrl.scala 376:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126080.12]
  assign _T_78 = pindex >= buffer_count; // @[ctrl.scala 376:46:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126081.12]
  assign _T_79 = _T_77 & _T_78; // @[ctrl.scala 376:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126082.12]
  assign _T_80 = _T_79 == 1'h0; // @[ctrl.scala 376:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126083.12]
  assign _T_81 = pindex > words_filled; // @[ctrl.scala 378:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126085.14]
  assign _T_82 = pindex < 5'h10; // @[ctrl.scala 378:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126086.14]
  assign _T_83 = _T_81 & _T_82; // @[ctrl.scala 378:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126087.14]
  assign _T_84 = byte_offset == 4'h0; // @[ctrl.scala 381:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126089.16]
  assign _T_86 = words_filled + 5'h1; // @[ctrl.scala 381:65:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126091.16]
  assign _T_87 = pindex == _T_86; // @[ctrl.scala 381:49:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126092.16]
  assign _T_88 = _T_84 & _T_87; // @[ctrl.scala 381:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126093.16]
  assign _T_89 = mindex != 5'h0; // @[ctrl.scala 382:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126094.16]
  assign _T_90 = _T_88 & _T_89; // @[ctrl.scala 382:14:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126095.16]
  assign _GEN_131 = 5'h0 == pindex ? 64'h6 : buffer_0; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_132 = 5'h1 == pindex ? 64'h6 : buffer_1; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_133 = 5'h2 == pindex ? 64'h6 : buffer_2; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_134 = 5'h3 == pindex ? 64'h6 : buffer_3; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_135 = 5'h4 == pindex ? 64'h6 : buffer_4; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_136 = 5'h5 == pindex ? 64'h6 : buffer_5; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_137 = 5'h6 == pindex ? 64'h6 : buffer_6; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_138 = 5'h7 == pindex ? 64'h6 : buffer_7; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_139 = 5'h8 == pindex ? 64'h6 : buffer_8; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_140 = 5'h9 == pindex ? 64'h6 : buffer_9; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_141 = 5'ha == pindex ? 64'h6 : buffer_10; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_142 = 5'hb == pindex ? 64'h6 : buffer_11; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_143 = 5'hc == pindex ? 64'h6 : buffer_12; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_144 = 5'hd == pindex ? 64'h6 : buffer_13; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_145 = 5'he == pindex ? 64'h6 : buffer_14; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_146 = 5'hf == pindex ? 64'h6 : buffer_15; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _GEN_147 = 5'h10 == pindex ? 64'h6 : buffer_16; // @[ctrl.scala 388:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126098.18]
  assign _T_92 = pindex == 5'h10; // @[ctrl.scala 399:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126105.16]
  assign _T_93 = words_filled == 5'h10; // @[ctrl.scala 403:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126107.18]
  assign _T_94 = byte_offset == 4'h7; // @[ctrl.scala 404:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126109.20]
  assign _GEN_183 = 5'h1 == pindex ? buffer_1 : buffer_0; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_184 = 5'h2 == pindex ? buffer_2 : _GEN_183; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_185 = 5'h3 == pindex ? buffer_3 : _GEN_184; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_186 = 5'h4 == pindex ? buffer_4 : _GEN_185; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_187 = 5'h5 == pindex ? buffer_5 : _GEN_186; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_188 = 5'h6 == pindex ? buffer_6 : _GEN_187; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_189 = 5'h7 == pindex ? buffer_7 : _GEN_188; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_190 = 5'h8 == pindex ? buffer_8 : _GEN_189; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_191 = 5'h9 == pindex ? buffer_9 : _GEN_190; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_192 = 5'ha == pindex ? buffer_10 : _GEN_191; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_193 = 5'hb == pindex ? buffer_11 : _GEN_192; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_194 = 5'hc == pindex ? buffer_12 : _GEN_193; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_195 = 5'hd == pindex ? buffer_13 : _GEN_194; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_196 = 5'he == pindex ? buffer_14 : _GEN_195; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_197 = 5'hf == pindex ? buffer_15 : _GEN_196; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _GEN_198 = 5'h10 == pindex ? buffer_16 : _GEN_197; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _T_95 = _GEN_198[55:0]; // @[ctrl.scala 413:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126111.22]
  assign _T_96 = {8'h86,_T_95}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126112.22]
  assign _T_98 = words_filled < 5'h10; // @[ctrl.scala 421:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126121.20]
  assign _T_101 = {8'h80,_T_95}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126128.22]
  assign _T_102 = pindex == words_filled; // @[ctrl.scala 441:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126134.18]
  assign _T_103 = byte_offset != 4'h0; // @[ctrl.scala 443:26:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126136.20]
  assign _T_104 = byte_offset == 4'h1; // @[ctrl.scala 445:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126138.22]
  assign _T_105 = _GEN_198[7:0]; // @[ctrl.scala 455:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126140.24]
  assign _T_106 = {3'h6,_T_105}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126141.24]
  assign _buffer_pindex_7 = {{53'd0}, _T_106}; // @[ctrl.scala 455:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126142.24 ctrl.scala 455:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126142.24]
  assign _T_107 = byte_offset == 4'h2; // @[ctrl.scala 457:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126145.24]
  assign _T_108 = _GEN_198[15:0]; // @[ctrl.scala 465:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126147.26]
  assign _T_109 = {3'h6,_T_108}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126148.26]
  assign _buffer_pindex_9 = {{45'd0}, _T_109}; // @[ctrl.scala 465:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126149.26 ctrl.scala 465:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126149.26]
  assign _T_110 = byte_offset == 4'h3; // @[ctrl.scala 467:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126152.26]
  assign _T_111 = _GEN_198[23:0]; // @[ctrl.scala 475:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126154.28]
  assign _T_112 = {3'h6,_T_111}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126155.28]
  assign _buffer_pindex_11 = {{37'd0}, _T_112}; // @[ctrl.scala 475:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126156.28 ctrl.scala 475:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126156.28]
  assign _T_113 = byte_offset == 4'h4; // @[ctrl.scala 477:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126159.28]
  assign _T_114 = _GEN_198[31:0]; // @[ctrl.scala 485:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126161.30]
  assign _T_115 = {3'h6,_T_114}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126162.30]
  assign _buffer_pindex_13 = {{29'd0}, _T_115}; // @[ctrl.scala 485:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126163.30 ctrl.scala 485:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126163.30]
  assign _T_116 = byte_offset == 4'h5; // @[ctrl.scala 487:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126166.30]
  assign _T_117 = _GEN_198[39:0]; // @[ctrl.scala 495:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126168.32]
  assign _T_118 = {3'h6,_T_117}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126169.32]
  assign _buffer_pindex_15 = {{21'd0}, _T_118}; // @[ctrl.scala 495:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126170.32 ctrl.scala 495:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126170.32]
  assign _T_119 = byte_offset == 4'h6; // @[ctrl.scala 497:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126173.32]
  assign _T_120 = _GEN_198[47:0]; // @[ctrl.scala 505:61:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126175.34]
  assign _T_121 = {3'h6,_T_120}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126176.34]
  assign _buffer_pindex_17 = {{13'd0}, _T_121}; // @[ctrl.scala 505:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126177.34 ctrl.scala 505:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126177.34]
  assign _T_124 = {3'h6,_T_95}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126183.36]
  assign _buffer_pindex_19 = {{5'd0}, _T_124}; // @[ctrl.scala 515:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126184.36 ctrl.scala 515:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126184.36]
  assign _T_125 = mindex == 5'h0; // @[ctrl.scala 520:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126188.22]
  assign _T_127 = _T_125 & _T_84; // @[ctrl.scala 520:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126190.22]
  assign _GEN_658 = areg ? 5'h0 : buffer_count; // @[ctrl.scala 537:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126200.14]
  assign _T_133 = pindex + 5'h1; // @[ctrl.scala 565:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126222.16]
  assign _GEN_665 = next_buff_val ? _GEN_658 : buffer_count; // @[ctrl.scala 534:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126198.12]
  assign _T_134 = 3'h4 == mem_s; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126229.12]
  assign _T_135 = aindex >= 5'h10; // @[ctrl.scala 574:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126232.14]
  assign _GEN_670 = _T_134 | buffer_valid; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126230.12]
  assign _GEN_672 = _T_76 ? next_buff_val : _GEN_670; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126078.10]
  assign _GEN_691 = _T_76 ? _GEN_665 : buffer_count; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126078.10]
  assign _GEN_712 = _T_57 ? _GEN_126 : _GEN_691; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  assign _GEN_713 = _T_57 ? _GEN_127 : _GEN_672; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  assign _GEN_716 = _T_57 ? _GEN_130 : _GEN_28; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126020.8]
  assign _GEN_719 = _T_26 & _GEN_46; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_720 = _T_26 ? _GEN_47 : 64'h0; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_721 = _T_26 ? _GEN_48 : rindex; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_725 = _T_26 ? _GEN_73 : _GEN_716; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_726 = _T_26 ? _GEN_74 : read; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_727 = _T_26 ? _GEN_69 : _GEN_713; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_747 = _T_26 ? buffer_count : _GEN_712; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125936.6]
  assign _GEN_749 = _T_15 ? _GEN_39 : _GEN_747; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_752 = _T_15 ? 1'h0 : _GEN_719; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_753 = _T_15 ? 64'h0 : _GEN_720; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_754 = _T_15 ? rindex : _GEN_721; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_757 = _T_15 ? _GEN_28 : _GEN_725; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_758 = _T_15 ? read : _GEN_726; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _GEN_759 = _T_15 ? buffer_valid : _GEN_727; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125914.4]
  assign _T_136 = io_dmem_resp_tag[4:0]; // @[ctrl.scala 582:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126238.6]
  assign _T_137 = _T_136 < 5'h11; // @[ctrl.scala 582:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126239.6]
  assign _GEN_813 = _T_137 ? _T_61 : _GEN_749; // @[ctrl.scala 582:59:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126240.6]
  assign _GEN_831 = io_dmem_resp_val ? _GEN_813 : _GEN_749; // @[ctrl.scala 581:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126237.4]
  assign _T_142 = mindex >= 5'h11; // @[ctrl.scala 595:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126249.4]
  assign _T_143 = _T_2 & _T_142; // @[ctrl.scala 594:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126250.4]
  assign _T_144 = _GEN_1009 > msg_len; // @[ctrl.scala 597:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126252.6]
  assign _GEN_832 = _T_144 ? _GEN_759 : 1'h1; // @[ctrl.scala 597:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126253.6]
  assign _GEN_833 = _T_143 ? _GEN_832 : _GEN_759; // @[ctrl.scala 595:45:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126251.4]
  assign _T_145 = 3'h0 == state; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126259.4]
  assign _T_146 = rindex_reg >= 5'h18; // @[ctrl.scala 610:39:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126261.6]
  assign _T_147 = _T_146 & buffer_valid; // @[ctrl.scala 610:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126262.6]
  assign _GEN_1019 = {{32'd0}, hashed}; // @[ctrl.scala 610:81:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126263.6]
  assign _T_148 = _GEN_1019 <= msg_len; // @[ctrl.scala 610:81:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126263.6]
  assign _T_149 = _T_147 & _T_148; // @[ctrl.scala 610:71:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126264.6]
  assign _T_150 = busy & _T_149; // @[ctrl.scala 610:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126265.6]
  assign _GEN_834 = _T_150 | _GEN_31; // @[ctrl.scala 611:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126266.6]
  assign _T_151 = 3'h1 == state; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126275.6]
  assign _T_152 = areg == 1'h0; // @[ctrl.scala 619:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126277.8]
  assign _T_154 = aindex + 5'h1; // @[ctrl.scala 621:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126281.8]
  assign _T_155 = io_aindex >= 5'h10; // @[ctrl.scala 622:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126283.8]
  assign _T_157 = hashed + 32'h88; // @[ctrl.scala 630:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126291.10]
  assign _T_158 = 3'h2 == state; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126300.8]
  assign _T_159 = 3'h3 == state; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126306.10]
  assign _T_160 = rindex < 5'h18; // @[ctrl.scala 642:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126308.12]
  assign _T_165 = rindex + 5'h1; // @[ctrl.scala 651:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126323.16]
  assign _T_166 = _GEN_1019 > msg_len; // @[ctrl.scala 658:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126332.14]
  assign _T_167 = _GEN_1019 == msg_len; // @[ctrl.scala 658:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126333.14]
  assign _T_168 = rindex == 5'h18; // @[ctrl.scala 658:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126334.14]
  assign _T_169 = _T_167 & _T_168; // @[ctrl.scala 658:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126335.14]
  assign _T_170 = _T_166 | _T_169; // @[ctrl.scala 658:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126336.14]
  assign _GEN_854 = _T_160 ? 1'h0 : 1'h1; // @[ctrl.scala 642:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126309.12]
  assign _T_171 = 3'h4 == state; // @[Conditional.scala 37:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126347.12]
  assign _T_172 = windex < 3'h4; // @[ctrl.scala 669:31:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126349.14]
  assign _GEN_1022 = {{2'd0}, windex}; // @[ctrl.scala 671:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126352.14]
  assign _T_174 = 5'h11 + _GEN_1022; // @[ctrl.scala 671:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126353.14]
  assign _T_176 = windex + 3'h1; // @[ctrl.scala 675:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126358.16]
  assign _T_178 = hash_addr + 64'h8; // @[ctrl.scala 676:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126361.16]
  assign _T_179 = dmem_resp_tag_reg[4:0]; // @[ctrl.scala 682:29:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126365.16]
  assign _T_180 = _T_179 >= 5'h11; // @[ctrl.scala 682:35:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126366.16]
  assign _T_183 = _T_179 - 5'h11; // @[ctrl.scala 684:43:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126370.18]
  assign _T_184 = _T_183[1:0]; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126371.18]
  assign _GEN_1023 = 2'h0 == _T_184; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_860 = _GEN_1023 | writes_done_0; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_1024 = 2'h1 == _T_184; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_861 = _GEN_1024 | writes_done_1; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_1025 = 2'h2 == _T_184; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_862 = _GEN_1025 | writes_done_2; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_1026 = 2'h3 == _T_184; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _GEN_863 = _GEN_1026 | writes_done_3; // @[ctrl.scala 684:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126372.18]
  assign _T_185 = writes_done_0 & writes_done_1; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126375.14]
  assign _T_186 = _T_185 & writes_done_2; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126376.14]
  assign _T_187 = _T_186 & writes_done_3; // @[ctrl.scala 687:30:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126377.14]
  assign _GEN_888 = _T_171 ? _T_172 : _GEN_752; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  assign _GEN_889 = _T_171 ? hash_addr : _GEN_753; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  assign _GEN_890 = _T_171 ? _T_174 : _GEN_754; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  assign _GEN_906 = _T_171 & _T_187; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126348.12]
  assign _GEN_911 = _T_159 ? _GEN_854 : 1'h1; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_915 = _T_159 ? _GEN_752 : _GEN_888; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_916 = _T_159 ? _GEN_753 : _GEN_889; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_917 = _T_159 ? _GEN_754 : _GEN_890; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_918 = _T_159 ? 1'h0 : _T_171; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_931 = _T_159 ? 1'h0 : _GEN_906; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126307.10]
  assign _GEN_937 = _T_158 | _GEN_911; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_940 = _T_158 ? _GEN_752 : _GEN_915; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_941 = _T_158 ? _GEN_753 : _GEN_916; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_942 = _T_158 ? _GEN_754 : _GEN_917; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_943 = _T_158 ? 1'h0 : _GEN_918; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_956 = _T_158 ? 1'h0 : _GEN_931; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126301.8]
  assign _GEN_957 = _T_151 ? _T_152 : _GEN_937; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_969 = _T_151 ? _GEN_752 : _GEN_940; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_970 = _T_151 ? _GEN_753 : _GEN_941; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_971 = _T_151 ? _GEN_754 : _GEN_942; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_972 = _T_151 ? 1'h0 : _GEN_943; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_982 = _T_151 ? 1'h0 : _GEN_956; // @[Conditional.scala 39:67:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126276.6]
  assign _GEN_997 = _T_145 ? _GEN_753 : _GEN_970; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  assign _GEN_998 = _T_145 ? _GEN_754 : _GEN_971; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  assign _GEN_999 = _T_145 ? 1'h0 : _GEN_972; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126260.4]
  assign io_rocc_req_rdy = _T_12 ? _GEN_21 : _T_10; // @[ctrl.scala 176:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125875.4 ctrl.scala 194:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125892.6 ctrl.scala 197:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125898.10 ctrl.scala 204:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125907.12]
  assign io_busy = _T_12 ? _GEN_24 : busy; // @[ctrl.scala 178:11:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125877.4 ctrl.scala 201:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125901.10 ctrl.scala 205:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125908.12]
  assign io_dmem_req_val = _T_145 ? _GEN_752 : _GEN_969; // @[ctrl.scala 182:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125881.4 ctrl.scala 243:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125942.10 ctrl.scala 669:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126350.14]
  assign io_dmem_req_tag = {{1'd0}, _GEN_998}; // @[ctrl.scala 183:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125882.4 ctrl.scala 245:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125944.10 ctrl.scala 671:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126354.14]
  assign io_dmem_req_addr = _GEN_997[39:0]; // @[ctrl.scala 184:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125883.4 ctrl.scala 244:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125943.10 ctrl.scala 670:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126351.14]
  assign io_dmem_req_cmd = {{4'd0}, _GEN_999}; // @[ctrl.scala 185:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125884.4 ctrl.scala 246:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125945.10 ctrl.scala 672:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126355.14]
  assign io_round = rindex; // @[ctrl.scala 179:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125878.4 ctrl.scala 645:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126315.16 ctrl.scala 652:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126325.16]
  assign io_absorb = areg; // @[ctrl.scala 133:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125862.4]
  assign io_aindex = _T_5; // @[ctrl.scala 132:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125861.4]
  assign io_init = _T_145 ? 1'h0 : _GEN_982; // @[ctrl.scala 177:11:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125876.4 ctrl.scala 702:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126396.16]
  assign io_write = _T_145 | _GEN_957; // @[ctrl.scala 181:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125880.4 ctrl.scala 619:14:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126278.8 ctrl.scala 647:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126317.16 ctrl.scala 653:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126326.16 ctrl.scala 657:16:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126331.14]
  assign io_windex = windex; // @[ctrl.scala 148:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125865.4]
  assign io_buffer_out = 5'h10 == io_aindex ? buffer_16 : _GEN_15; // @[ctrl.scala 146:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@125864.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  msg_addr = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  hash_addr = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  msg_len = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  busy = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  dmem_resp_val_reg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  dmem_resp_tag_reg = _RAND_5[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mem_s = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  buffer_0 = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  buffer_1 = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  buffer_2 = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {2{`RANDOM}};
  buffer_3 = _RAND_10[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  buffer_4 = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  buffer_5 = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{`RANDOM}};
  buffer_6 = _RAND_13[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {2{`RANDOM}};
  buffer_7 = _RAND_14[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {2{`RANDOM}};
  buffer_8 = _RAND_15[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {2{`RANDOM}};
  buffer_9 = _RAND_16[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {2{`RANDOM}};
  buffer_10 = _RAND_17[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{`RANDOM}};
  buffer_11 = _RAND_18[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{`RANDOM}};
  buffer_12 = _RAND_19[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {2{`RANDOM}};
  buffer_13 = _RAND_20[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {2{`RANDOM}};
  buffer_14 = _RAND_21[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {2{`RANDOM}};
  buffer_15 = _RAND_22[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {2{`RANDOM}};
  buffer_16 = _RAND_23[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  buffer_valid = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  buffer_count = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  read = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  hashed = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  areg = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  mindex = _RAND_29[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  windex = _RAND_30[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  aindex = _RAND_31[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  pindex = _RAND_32[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  writes_done_0 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  writes_done_1 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  writes_done_2 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  writes_done_3 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  next_buff_val = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_5 = _RAND_38[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  state = _RAND_39[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  rindex = _RAND_40[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  rindex_reg = _RAND_41[4:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      msg_addr <= 64'h0;
    end else begin
      if (_T_145) begin
        if (_T_15) begin
          if (_T_12) begin
            if (_T_13) begin
              msg_addr <= io_rocc_rs1;
            end
          end
        end else begin
          if (_T_26) begin
            if (_T_39) begin
              if (_T_27) begin
                if (_T_31) begin
                  msg_addr <= _T_35;
                end else begin
                  if (_T_12) begin
                    if (_T_13) begin
                      msg_addr <= io_rocc_rs1;
                    end
                  end
                end
              end else begin
                if (_T_12) begin
                  if (_T_13) begin
                    msg_addr <= io_rocc_rs1;
                  end
                end
              end
            end else begin
              if (_T_47) begin
                if (_T_27) begin
                  if (_T_31) begin
                    msg_addr <= _T_35;
                  end else begin
                    if (_T_12) begin
                      if (_T_13) begin
                        msg_addr <= io_rocc_rs1;
                      end
                    end
                  end
                end else begin
                  msg_addr <= _GEN_28;
                end
              end else begin
                msg_addr <= _T_35;
              end
            end
          end else begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (_T_39) begin
                  msg_addr <= _GEN_28;
                end else begin
                  if (_T_47) begin
                    msg_addr <= _GEN_28;
                  end else begin
                    msg_addr <= _T_72;
                  end
                end
              end else begin
                msg_addr <= _GEN_28;
              end
            end else begin
              msg_addr <= _GEN_28;
            end
          end
        end
      end else begin
        if (_T_151) begin
          if (_T_15) begin
            msg_addr <= _GEN_28;
          end else begin
            if (_T_26) begin
              if (_T_39) begin
                if (_T_27) begin
                  if (_T_31) begin
                    msg_addr <= _T_35;
                  end else begin
                    msg_addr <= _GEN_28;
                  end
                end else begin
                  msg_addr <= _GEN_28;
                end
              end else begin
                if (_T_47) begin
                  if (_T_27) begin
                    if (_T_31) begin
                      msg_addr <= _T_35;
                    end else begin
                      msg_addr <= _GEN_28;
                    end
                  end else begin
                    msg_addr <= _GEN_28;
                  end
                end else begin
                  msg_addr <= _T_35;
                end
              end
            end else begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (_T_39) begin
                    msg_addr <= _GEN_28;
                  end else begin
                    if (_T_47) begin
                      msg_addr <= _GEN_28;
                    end else begin
                      msg_addr <= _T_72;
                    end
                  end
                end else begin
                  msg_addr <= _GEN_28;
                end
              end else begin
                msg_addr <= _GEN_28;
              end
            end
          end
        end else begin
          if (_T_158) begin
            if (_T_15) begin
              msg_addr <= _GEN_28;
            end else begin
              if (_T_26) begin
                if (_T_39) begin
                  msg_addr <= _GEN_52;
                end else begin
                  if (_T_47) begin
                    msg_addr <= _GEN_52;
                  end else begin
                    msg_addr <= _T_35;
                  end
                end
              end else begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (_T_39) begin
                      msg_addr <= _GEN_28;
                    end else begin
                      if (_T_47) begin
                        msg_addr <= _GEN_28;
                      end else begin
                        msg_addr <= _T_72;
                      end
                    end
                  end else begin
                    msg_addr <= _GEN_28;
                  end
                end else begin
                  msg_addr <= _GEN_28;
                end
              end
            end
          end else begin
            if (_T_159) begin
              if (_T_15) begin
                msg_addr <= _GEN_28;
              end else begin
                if (_T_26) begin
                  if (_T_39) begin
                    msg_addr <= _GEN_52;
                  end else begin
                    if (_T_47) begin
                      msg_addr <= _GEN_52;
                    end else begin
                      msg_addr <= _T_35;
                    end
                  end
                end else begin
                  if (_T_57) begin
                    if (io_dmem_resp_val) begin
                      if (_T_39) begin
                        msg_addr <= _GEN_28;
                      end else begin
                        if (_T_47) begin
                          msg_addr <= _GEN_28;
                        end else begin
                          msg_addr <= _T_72;
                        end
                      end
                    end else begin
                      msg_addr <= _GEN_28;
                    end
                  end else begin
                    msg_addr <= _GEN_28;
                  end
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  msg_addr <= 64'h0;
                end else begin
                  msg_addr <= _GEN_757;
                end
              end else begin
                msg_addr <= _GEN_757;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      hash_addr <= 64'h0;
    end else begin
      if (_T_145) begin
        if (_T_12) begin
          if (_T_13) begin
            hash_addr <= io_rocc_rs2;
          end
        end
      end else begin
        if (_T_151) begin
          if (_T_12) begin
            if (_T_13) begin
              hash_addr <= io_rocc_rs2;
            end
          end
        end else begin
          if (_T_158) begin
            if (_T_12) begin
              if (_T_13) begin
                hash_addr <= io_rocc_rs2;
              end
            end
          end else begin
            if (_T_159) begin
              if (_T_12) begin
                if (_T_13) begin
                  hash_addr <= io_rocc_rs2;
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  hash_addr <= 64'h0;
                end else begin
                  if (io_dmem_req_rdy) begin
                    hash_addr <= _T_178;
                  end else begin
                    hash_addr <= _GEN_29;
                  end
                end
              end else begin
                hash_addr <= _GEN_29;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      msg_len <= 64'h0;
    end else begin
      if (_T_145) begin
        if (_T_12) begin
          if (!(_T_13)) begin
            if (_T_14) begin
              msg_len <= io_rocc_rs1;
            end
          end
        end
      end else begin
        if (_T_151) begin
          if (_T_12) begin
            if (!(_T_13)) begin
              if (_T_14) begin
                msg_len <= io_rocc_rs1;
              end
            end
          end
        end else begin
          if (_T_158) begin
            if (_T_12) begin
              if (!(_T_13)) begin
                if (_T_14) begin
                  msg_len <= io_rocc_rs1;
                end
              end
            end
          end else begin
            if (_T_159) begin
              if (_T_12) begin
                if (!(_T_13)) begin
                  if (_T_14) begin
                    msg_len <= io_rocc_rs1;
                  end
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  msg_len <= 64'h0;
                end else begin
                  msg_len <= _GEN_32;
                end
              end else begin
                msg_len <= _GEN_32;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      busy <= 1'h0;
    end else begin
      if (_T_145) begin
        busy <= _GEN_834;
      end else begin
        if (_T_151) begin
          if (_T_12) begin
            if (!(_T_13)) begin
              busy <= _GEN_17;
            end
          end
        end else begin
          if (_T_158) begin
            if (_T_12) begin
              if (!(_T_13)) begin
                busy <= _GEN_17;
              end
            end
          end else begin
            if (_T_159) begin
              if (_T_12) begin
                if (!(_T_13)) begin
                  busy <= _GEN_17;
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  busy <= 1'h0;
                end else begin
                  if (_T_12) begin
                    if (!(_T_13)) begin
                      busy <= _GEN_17;
                    end
                  end
                end
              end else begin
                busy <= _GEN_31;
              end
            end
          end
        end
      end
    end
    dmem_resp_val_reg <= io_dmem_resp_val;
    dmem_resp_tag_reg <= io_dmem_resp_tag;
    if (reset) begin
      mem_s <= 3'h0;
    end else begin
      if (_T_15) begin
        if (_T_25) begin
          mem_s <= 3'h1;
        end else begin
          mem_s <= 3'h0;
        end
      end else begin
        if (_T_26) begin
          if (_T_39) begin
            if (_T_40) begin
              mem_s <= 3'h1;
            end else begin
              mem_s <= 3'h3;
            end
          end else begin
            if (_T_47) begin
              mem_s <= 3'h1;
            end else begin
              if (_T_56) begin
                mem_s <= 3'h3;
              end else begin
                mem_s <= 3'h0;
              end
            end
          end
        end else begin
          if (_T_57) begin
            if (io_dmem_resp_val) begin
              if (_T_39) begin
                if (_T_40) begin
                  mem_s <= 3'h1;
                end else begin
                  mem_s <= 3'h3;
                end
              end else begin
                if (_T_47) begin
                  mem_s <= 3'h1;
                end else begin
                  if (_T_56) begin
                    mem_s <= 3'h3;
                  end else begin
                    mem_s <= 3'h0;
                  end
                end
              end
            end
          end else begin
            if (_T_76) begin
              if (next_buff_val) begin
                if (areg) begin
                  mem_s <= 3'h0;
                end else begin
                  mem_s <= 3'h4;
                end
              end else begin
                mem_s <= 3'h3;
              end
            end else begin
              if (_T_134) begin
                if (_T_135) begin
                  mem_s <= 3'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_0 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h0 == _T_136) begin
            buffer_0 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h0 == _T_8) begin
                      buffer_0 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h0 == pindex) begin
                            buffer_0 <= 64'h6;
                          end
                        end else begin
                          if (5'h0 == pindex) begin
                            buffer_0 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h0 == pindex) begin
                                  buffer_0 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h0 == pindex) begin
                                    buffer_0 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h0 == pindex) begin
                                      buffer_0 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h0 == pindex) begin
                                        buffer_0 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h0 == pindex) begin
                                          buffer_0 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h0 == pindex) begin
                                            buffer_0 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h0 == pindex) begin
                                              buffer_0 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h0 == pindex) begin
                                  buffer_0 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h0 == _T_8) begin
                    buffer_0 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h0 == pindex) begin
                          buffer_0 <= 64'h6;
                        end
                      end else begin
                        if (5'h0 == pindex) begin
                          buffer_0 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h0 == pindex) begin
                              buffer_0 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h0 == pindex) begin
                              buffer_0 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h0 == pindex) begin
                              buffer_0 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h0 == pindex) begin
                                  buffer_0 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h0 == pindex) begin
                                    buffer_0 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h0 == pindex) begin
                                      buffer_0 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h0 == pindex) begin
                                        buffer_0 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h0 == pindex) begin
                                          buffer_0 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h0 == pindex) begin
                                            buffer_0 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h0 == _T_8) begin
                  buffer_0 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_0 <= _GEN_131;
                    end else begin
                      if (5'h0 == pindex) begin
                        buffer_0 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h0 == pindex) begin
                            buffer_0 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h0 == pindex) begin
                            buffer_0 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h0 == pindex) begin
                            buffer_0 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h0 == pindex) begin
                              buffer_0 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h0 == pindex) begin
                                buffer_0 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h0 == pindex) begin
                                  buffer_0 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h0 == pindex) begin
                                    buffer_0 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h0 == pindex) begin
                                      buffer_0 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h0 == pindex) begin
                                        buffer_0 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h0 == pindex) begin
                                          buffer_0 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_0 <= _GEN_131;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_1 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h1 == _T_136) begin
            buffer_1 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h1 == _T_8) begin
                      buffer_1 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h1 == pindex) begin
                            buffer_1 <= 64'h6;
                          end
                        end else begin
                          if (5'h1 == pindex) begin
                            buffer_1 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h1 == pindex) begin
                                  buffer_1 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h1 == pindex) begin
                                    buffer_1 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h1 == pindex) begin
                                      buffer_1 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h1 == pindex) begin
                                        buffer_1 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h1 == pindex) begin
                                          buffer_1 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h1 == pindex) begin
                                            buffer_1 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h1 == pindex) begin
                                              buffer_1 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h1 == pindex) begin
                                  buffer_1 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h1 == _T_8) begin
                    buffer_1 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h1 == pindex) begin
                          buffer_1 <= 64'h6;
                        end
                      end else begin
                        if (5'h1 == pindex) begin
                          buffer_1 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h1 == pindex) begin
                              buffer_1 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h1 == pindex) begin
                              buffer_1 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h1 == pindex) begin
                              buffer_1 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h1 == pindex) begin
                                  buffer_1 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h1 == pindex) begin
                                    buffer_1 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h1 == pindex) begin
                                      buffer_1 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h1 == pindex) begin
                                        buffer_1 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h1 == pindex) begin
                                          buffer_1 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h1 == pindex) begin
                                            buffer_1 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h1 == _T_8) begin
                  buffer_1 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_1 <= _GEN_132;
                    end else begin
                      if (5'h1 == pindex) begin
                        buffer_1 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h1 == pindex) begin
                            buffer_1 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h1 == pindex) begin
                            buffer_1 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h1 == pindex) begin
                            buffer_1 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h1 == pindex) begin
                              buffer_1 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h1 == pindex) begin
                                buffer_1 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h1 == pindex) begin
                                  buffer_1 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h1 == pindex) begin
                                    buffer_1 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h1 == pindex) begin
                                      buffer_1 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h1 == pindex) begin
                                        buffer_1 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h1 == pindex) begin
                                          buffer_1 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_1 <= _GEN_132;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_2 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h2 == _T_136) begin
            buffer_2 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h2 == _T_8) begin
                      buffer_2 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h2 == pindex) begin
                            buffer_2 <= 64'h6;
                          end
                        end else begin
                          if (5'h2 == pindex) begin
                            buffer_2 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h2 == pindex) begin
                                  buffer_2 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h2 == pindex) begin
                                    buffer_2 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h2 == pindex) begin
                                      buffer_2 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h2 == pindex) begin
                                        buffer_2 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h2 == pindex) begin
                                          buffer_2 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h2 == pindex) begin
                                            buffer_2 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h2 == pindex) begin
                                              buffer_2 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h2 == pindex) begin
                                  buffer_2 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h2 == _T_8) begin
                    buffer_2 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h2 == pindex) begin
                          buffer_2 <= 64'h6;
                        end
                      end else begin
                        if (5'h2 == pindex) begin
                          buffer_2 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h2 == pindex) begin
                              buffer_2 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h2 == pindex) begin
                              buffer_2 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h2 == pindex) begin
                              buffer_2 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h2 == pindex) begin
                                  buffer_2 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h2 == pindex) begin
                                    buffer_2 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h2 == pindex) begin
                                      buffer_2 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h2 == pindex) begin
                                        buffer_2 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h2 == pindex) begin
                                          buffer_2 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h2 == pindex) begin
                                            buffer_2 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h2 == _T_8) begin
                  buffer_2 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_2 <= _GEN_133;
                    end else begin
                      if (5'h2 == pindex) begin
                        buffer_2 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h2 == pindex) begin
                            buffer_2 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h2 == pindex) begin
                            buffer_2 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h2 == pindex) begin
                            buffer_2 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h2 == pindex) begin
                              buffer_2 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h2 == pindex) begin
                                buffer_2 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h2 == pindex) begin
                                  buffer_2 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h2 == pindex) begin
                                    buffer_2 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h2 == pindex) begin
                                      buffer_2 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h2 == pindex) begin
                                        buffer_2 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h2 == pindex) begin
                                          buffer_2 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_2 <= _GEN_133;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_3 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h3 == _T_136) begin
            buffer_3 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h3 == _T_8) begin
                      buffer_3 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h3 == pindex) begin
                            buffer_3 <= 64'h6;
                          end
                        end else begin
                          if (5'h3 == pindex) begin
                            buffer_3 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h3 == pindex) begin
                                  buffer_3 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h3 == pindex) begin
                                    buffer_3 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h3 == pindex) begin
                                      buffer_3 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h3 == pindex) begin
                                        buffer_3 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h3 == pindex) begin
                                          buffer_3 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h3 == pindex) begin
                                            buffer_3 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h3 == pindex) begin
                                              buffer_3 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h3 == pindex) begin
                                  buffer_3 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h3 == _T_8) begin
                    buffer_3 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h3 == pindex) begin
                          buffer_3 <= 64'h6;
                        end
                      end else begin
                        if (5'h3 == pindex) begin
                          buffer_3 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h3 == pindex) begin
                              buffer_3 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h3 == pindex) begin
                              buffer_3 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h3 == pindex) begin
                              buffer_3 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h3 == pindex) begin
                                  buffer_3 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h3 == pindex) begin
                                    buffer_3 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h3 == pindex) begin
                                      buffer_3 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h3 == pindex) begin
                                        buffer_3 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h3 == pindex) begin
                                          buffer_3 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h3 == pindex) begin
                                            buffer_3 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h3 == _T_8) begin
                  buffer_3 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_3 <= _GEN_134;
                    end else begin
                      if (5'h3 == pindex) begin
                        buffer_3 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h3 == pindex) begin
                            buffer_3 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h3 == pindex) begin
                            buffer_3 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h3 == pindex) begin
                            buffer_3 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h3 == pindex) begin
                              buffer_3 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h3 == pindex) begin
                                buffer_3 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h3 == pindex) begin
                                  buffer_3 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h3 == pindex) begin
                                    buffer_3 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h3 == pindex) begin
                                      buffer_3 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h3 == pindex) begin
                                        buffer_3 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h3 == pindex) begin
                                          buffer_3 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_3 <= _GEN_134;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_4 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h4 == _T_136) begin
            buffer_4 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h4 == _T_8) begin
                      buffer_4 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h4 == pindex) begin
                            buffer_4 <= 64'h6;
                          end
                        end else begin
                          if (5'h4 == pindex) begin
                            buffer_4 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h4 == pindex) begin
                                  buffer_4 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h4 == pindex) begin
                                    buffer_4 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h4 == pindex) begin
                                      buffer_4 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h4 == pindex) begin
                                        buffer_4 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h4 == pindex) begin
                                          buffer_4 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h4 == pindex) begin
                                            buffer_4 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h4 == pindex) begin
                                              buffer_4 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h4 == pindex) begin
                                  buffer_4 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h4 == _T_8) begin
                    buffer_4 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h4 == pindex) begin
                          buffer_4 <= 64'h6;
                        end
                      end else begin
                        if (5'h4 == pindex) begin
                          buffer_4 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h4 == pindex) begin
                              buffer_4 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h4 == pindex) begin
                              buffer_4 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h4 == pindex) begin
                              buffer_4 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h4 == pindex) begin
                                  buffer_4 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h4 == pindex) begin
                                    buffer_4 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h4 == pindex) begin
                                      buffer_4 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h4 == pindex) begin
                                        buffer_4 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h4 == pindex) begin
                                          buffer_4 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h4 == pindex) begin
                                            buffer_4 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h4 == _T_8) begin
                  buffer_4 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_4 <= _GEN_135;
                    end else begin
                      if (5'h4 == pindex) begin
                        buffer_4 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h4 == pindex) begin
                            buffer_4 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h4 == pindex) begin
                            buffer_4 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h4 == pindex) begin
                            buffer_4 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h4 == pindex) begin
                              buffer_4 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h4 == pindex) begin
                                buffer_4 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h4 == pindex) begin
                                  buffer_4 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h4 == pindex) begin
                                    buffer_4 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h4 == pindex) begin
                                      buffer_4 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h4 == pindex) begin
                                        buffer_4 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h4 == pindex) begin
                                          buffer_4 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_4 <= _GEN_135;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_5 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h5 == _T_136) begin
            buffer_5 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h5 == _T_8) begin
                      buffer_5 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h5 == pindex) begin
                            buffer_5 <= 64'h6;
                          end
                        end else begin
                          if (5'h5 == pindex) begin
                            buffer_5 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h5 == pindex) begin
                                  buffer_5 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h5 == pindex) begin
                                    buffer_5 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h5 == pindex) begin
                                      buffer_5 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h5 == pindex) begin
                                        buffer_5 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h5 == pindex) begin
                                          buffer_5 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h5 == pindex) begin
                                            buffer_5 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h5 == pindex) begin
                                              buffer_5 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h5 == pindex) begin
                                  buffer_5 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h5 == _T_8) begin
                    buffer_5 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h5 == pindex) begin
                          buffer_5 <= 64'h6;
                        end
                      end else begin
                        if (5'h5 == pindex) begin
                          buffer_5 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h5 == pindex) begin
                              buffer_5 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h5 == pindex) begin
                              buffer_5 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h5 == pindex) begin
                              buffer_5 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h5 == pindex) begin
                                  buffer_5 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h5 == pindex) begin
                                    buffer_5 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h5 == pindex) begin
                                      buffer_5 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h5 == pindex) begin
                                        buffer_5 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h5 == pindex) begin
                                          buffer_5 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h5 == pindex) begin
                                            buffer_5 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h5 == _T_8) begin
                  buffer_5 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_5 <= _GEN_136;
                    end else begin
                      if (5'h5 == pindex) begin
                        buffer_5 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h5 == pindex) begin
                            buffer_5 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h5 == pindex) begin
                            buffer_5 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h5 == pindex) begin
                            buffer_5 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h5 == pindex) begin
                              buffer_5 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h5 == pindex) begin
                                buffer_5 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h5 == pindex) begin
                                  buffer_5 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h5 == pindex) begin
                                    buffer_5 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h5 == pindex) begin
                                      buffer_5 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h5 == pindex) begin
                                        buffer_5 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h5 == pindex) begin
                                          buffer_5 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_5 <= _GEN_136;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_6 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h6 == _T_136) begin
            buffer_6 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h6 == _T_8) begin
                      buffer_6 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h6 == pindex) begin
                            buffer_6 <= 64'h6;
                          end
                        end else begin
                          if (5'h6 == pindex) begin
                            buffer_6 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h6 == pindex) begin
                                  buffer_6 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h6 == pindex) begin
                                    buffer_6 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h6 == pindex) begin
                                      buffer_6 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h6 == pindex) begin
                                        buffer_6 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h6 == pindex) begin
                                          buffer_6 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h6 == pindex) begin
                                            buffer_6 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h6 == pindex) begin
                                              buffer_6 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h6 == pindex) begin
                                  buffer_6 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h6 == _T_8) begin
                    buffer_6 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h6 == pindex) begin
                          buffer_6 <= 64'h6;
                        end
                      end else begin
                        if (5'h6 == pindex) begin
                          buffer_6 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h6 == pindex) begin
                              buffer_6 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h6 == pindex) begin
                              buffer_6 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h6 == pindex) begin
                              buffer_6 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h6 == pindex) begin
                                  buffer_6 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h6 == pindex) begin
                                    buffer_6 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h6 == pindex) begin
                                      buffer_6 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h6 == pindex) begin
                                        buffer_6 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h6 == pindex) begin
                                          buffer_6 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h6 == pindex) begin
                                            buffer_6 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h6 == _T_8) begin
                  buffer_6 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_6 <= _GEN_137;
                    end else begin
                      if (5'h6 == pindex) begin
                        buffer_6 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h6 == pindex) begin
                            buffer_6 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h6 == pindex) begin
                            buffer_6 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h6 == pindex) begin
                            buffer_6 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h6 == pindex) begin
                              buffer_6 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h6 == pindex) begin
                                buffer_6 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h6 == pindex) begin
                                  buffer_6 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h6 == pindex) begin
                                    buffer_6 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h6 == pindex) begin
                                      buffer_6 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h6 == pindex) begin
                                        buffer_6 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h6 == pindex) begin
                                          buffer_6 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_6 <= _GEN_137;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_7 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h7 == _T_136) begin
            buffer_7 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h7 == _T_8) begin
                      buffer_7 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h7 == pindex) begin
                            buffer_7 <= 64'h6;
                          end
                        end else begin
                          if (5'h7 == pindex) begin
                            buffer_7 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h7 == pindex) begin
                                  buffer_7 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h7 == pindex) begin
                                    buffer_7 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h7 == pindex) begin
                                      buffer_7 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h7 == pindex) begin
                                        buffer_7 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h7 == pindex) begin
                                          buffer_7 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h7 == pindex) begin
                                            buffer_7 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h7 == pindex) begin
                                              buffer_7 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h7 == pindex) begin
                                  buffer_7 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h7 == _T_8) begin
                    buffer_7 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h7 == pindex) begin
                          buffer_7 <= 64'h6;
                        end
                      end else begin
                        if (5'h7 == pindex) begin
                          buffer_7 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h7 == pindex) begin
                              buffer_7 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h7 == pindex) begin
                              buffer_7 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h7 == pindex) begin
                              buffer_7 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h7 == pindex) begin
                                  buffer_7 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h7 == pindex) begin
                                    buffer_7 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h7 == pindex) begin
                                      buffer_7 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h7 == pindex) begin
                                        buffer_7 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h7 == pindex) begin
                                          buffer_7 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h7 == pindex) begin
                                            buffer_7 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h7 == _T_8) begin
                  buffer_7 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_7 <= _GEN_138;
                    end else begin
                      if (5'h7 == pindex) begin
                        buffer_7 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h7 == pindex) begin
                            buffer_7 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h7 == pindex) begin
                            buffer_7 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h7 == pindex) begin
                            buffer_7 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h7 == pindex) begin
                              buffer_7 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h7 == pindex) begin
                                buffer_7 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h7 == pindex) begin
                                  buffer_7 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h7 == pindex) begin
                                    buffer_7 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h7 == pindex) begin
                                      buffer_7 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h7 == pindex) begin
                                        buffer_7 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h7 == pindex) begin
                                          buffer_7 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_7 <= _GEN_138;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_8 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h8 == _T_136) begin
            buffer_8 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h8 == _T_8) begin
                      buffer_8 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h8 == pindex) begin
                            buffer_8 <= 64'h6;
                          end
                        end else begin
                          if (5'h8 == pindex) begin
                            buffer_8 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h8 == pindex) begin
                                  buffer_8 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h8 == pindex) begin
                                    buffer_8 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h8 == pindex) begin
                                      buffer_8 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h8 == pindex) begin
                                        buffer_8 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h8 == pindex) begin
                                          buffer_8 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h8 == pindex) begin
                                            buffer_8 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h8 == pindex) begin
                                              buffer_8 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h8 == pindex) begin
                                  buffer_8 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h8 == _T_8) begin
                    buffer_8 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h8 == pindex) begin
                          buffer_8 <= 64'h6;
                        end
                      end else begin
                        if (5'h8 == pindex) begin
                          buffer_8 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h8 == pindex) begin
                              buffer_8 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h8 == pindex) begin
                              buffer_8 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h8 == pindex) begin
                              buffer_8 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h8 == pindex) begin
                                  buffer_8 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h8 == pindex) begin
                                    buffer_8 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h8 == pindex) begin
                                      buffer_8 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h8 == pindex) begin
                                        buffer_8 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h8 == pindex) begin
                                          buffer_8 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h8 == pindex) begin
                                            buffer_8 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h8 == _T_8) begin
                  buffer_8 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_8 <= _GEN_139;
                    end else begin
                      if (5'h8 == pindex) begin
                        buffer_8 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h8 == pindex) begin
                            buffer_8 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h8 == pindex) begin
                            buffer_8 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h8 == pindex) begin
                            buffer_8 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h8 == pindex) begin
                              buffer_8 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h8 == pindex) begin
                                buffer_8 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h8 == pindex) begin
                                  buffer_8 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h8 == pindex) begin
                                    buffer_8 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h8 == pindex) begin
                                      buffer_8 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h8 == pindex) begin
                                        buffer_8 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h8 == pindex) begin
                                          buffer_8 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_8 <= _GEN_139;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_9 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h9 == _T_136) begin
            buffer_9 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h9 == _T_8) begin
                      buffer_9 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h9 == pindex) begin
                            buffer_9 <= 64'h6;
                          end
                        end else begin
                          if (5'h9 == pindex) begin
                            buffer_9 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h9 == pindex) begin
                                  buffer_9 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h9 == pindex) begin
                                    buffer_9 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h9 == pindex) begin
                                      buffer_9 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h9 == pindex) begin
                                        buffer_9 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h9 == pindex) begin
                                          buffer_9 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h9 == pindex) begin
                                            buffer_9 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h9 == pindex) begin
                                              buffer_9 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h9 == pindex) begin
                                  buffer_9 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h9 == _T_8) begin
                    buffer_9 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h9 == pindex) begin
                          buffer_9 <= 64'h6;
                        end
                      end else begin
                        if (5'h9 == pindex) begin
                          buffer_9 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h9 == pindex) begin
                              buffer_9 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h9 == pindex) begin
                              buffer_9 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h9 == pindex) begin
                              buffer_9 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h9 == pindex) begin
                                  buffer_9 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h9 == pindex) begin
                                    buffer_9 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h9 == pindex) begin
                                      buffer_9 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h9 == pindex) begin
                                        buffer_9 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h9 == pindex) begin
                                          buffer_9 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h9 == pindex) begin
                                            buffer_9 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h9 == _T_8) begin
                  buffer_9 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_9 <= _GEN_140;
                    end else begin
                      if (5'h9 == pindex) begin
                        buffer_9 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h9 == pindex) begin
                            buffer_9 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h9 == pindex) begin
                            buffer_9 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h9 == pindex) begin
                            buffer_9 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h9 == pindex) begin
                              buffer_9 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h9 == pindex) begin
                                buffer_9 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h9 == pindex) begin
                                  buffer_9 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h9 == pindex) begin
                                    buffer_9 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h9 == pindex) begin
                                      buffer_9 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h9 == pindex) begin
                                        buffer_9 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h9 == pindex) begin
                                          buffer_9 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_9 <= _GEN_140;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_10 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'ha == _T_136) begin
            buffer_10 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'ha == _T_8) begin
                      buffer_10 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'ha == pindex) begin
                            buffer_10 <= 64'h6;
                          end
                        end else begin
                          if (5'ha == pindex) begin
                            buffer_10 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'ha == pindex) begin
                                buffer_10 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'ha == pindex) begin
                                buffer_10 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'ha == pindex) begin
                                buffer_10 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'ha == pindex) begin
                                  buffer_10 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'ha == pindex) begin
                                    buffer_10 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'ha == pindex) begin
                                      buffer_10 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'ha == pindex) begin
                                        buffer_10 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'ha == pindex) begin
                                          buffer_10 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'ha == pindex) begin
                                            buffer_10 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'ha == pindex) begin
                                              buffer_10 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'ha == pindex) begin
                                  buffer_10 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'ha == _T_8) begin
                    buffer_10 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'ha == pindex) begin
                          buffer_10 <= 64'h6;
                        end
                      end else begin
                        if (5'ha == pindex) begin
                          buffer_10 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'ha == pindex) begin
                              buffer_10 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'ha == pindex) begin
                              buffer_10 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'ha == pindex) begin
                              buffer_10 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'ha == pindex) begin
                                buffer_10 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'ha == pindex) begin
                                  buffer_10 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'ha == pindex) begin
                                    buffer_10 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'ha == pindex) begin
                                      buffer_10 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'ha == pindex) begin
                                        buffer_10 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'ha == pindex) begin
                                          buffer_10 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'ha == pindex) begin
                                            buffer_10 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'ha == pindex) begin
                                buffer_10 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'ha == _T_8) begin
                  buffer_10 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_10 <= _GEN_141;
                    end else begin
                      if (5'ha == pindex) begin
                        buffer_10 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'ha == pindex) begin
                            buffer_10 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'ha == pindex) begin
                            buffer_10 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'ha == pindex) begin
                            buffer_10 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'ha == pindex) begin
                              buffer_10 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'ha == pindex) begin
                                buffer_10 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'ha == pindex) begin
                                  buffer_10 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'ha == pindex) begin
                                    buffer_10 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'ha == pindex) begin
                                      buffer_10 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'ha == pindex) begin
                                        buffer_10 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'ha == pindex) begin
                                          buffer_10 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_10 <= _GEN_141;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_11 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'hb == _T_136) begin
            buffer_11 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'hb == _T_8) begin
                      buffer_11 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'hb == pindex) begin
                            buffer_11 <= 64'h6;
                          end
                        end else begin
                          if (5'hb == pindex) begin
                            buffer_11 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'hb == pindex) begin
                                buffer_11 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'hb == pindex) begin
                                buffer_11 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'hb == pindex) begin
                                buffer_11 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'hb == pindex) begin
                                  buffer_11 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'hb == pindex) begin
                                    buffer_11 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'hb == pindex) begin
                                      buffer_11 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'hb == pindex) begin
                                        buffer_11 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'hb == pindex) begin
                                          buffer_11 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'hb == pindex) begin
                                            buffer_11 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'hb == pindex) begin
                                              buffer_11 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'hb == pindex) begin
                                  buffer_11 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'hb == _T_8) begin
                    buffer_11 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'hb == pindex) begin
                          buffer_11 <= 64'h6;
                        end
                      end else begin
                        if (5'hb == pindex) begin
                          buffer_11 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'hb == pindex) begin
                              buffer_11 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'hb == pindex) begin
                              buffer_11 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'hb == pindex) begin
                              buffer_11 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'hb == pindex) begin
                                buffer_11 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'hb == pindex) begin
                                  buffer_11 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'hb == pindex) begin
                                    buffer_11 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'hb == pindex) begin
                                      buffer_11 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'hb == pindex) begin
                                        buffer_11 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'hb == pindex) begin
                                          buffer_11 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'hb == pindex) begin
                                            buffer_11 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'hb == pindex) begin
                                buffer_11 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'hb == _T_8) begin
                  buffer_11 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_11 <= _GEN_142;
                    end else begin
                      if (5'hb == pindex) begin
                        buffer_11 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'hb == pindex) begin
                            buffer_11 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'hb == pindex) begin
                            buffer_11 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'hb == pindex) begin
                            buffer_11 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'hb == pindex) begin
                              buffer_11 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'hb == pindex) begin
                                buffer_11 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'hb == pindex) begin
                                  buffer_11 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'hb == pindex) begin
                                    buffer_11 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'hb == pindex) begin
                                      buffer_11 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'hb == pindex) begin
                                        buffer_11 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'hb == pindex) begin
                                          buffer_11 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_11 <= _GEN_142;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_12 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'hc == _T_136) begin
            buffer_12 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'hc == _T_8) begin
                      buffer_12 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'hc == pindex) begin
                            buffer_12 <= 64'h6;
                          end
                        end else begin
                          if (5'hc == pindex) begin
                            buffer_12 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'hc == pindex) begin
                                buffer_12 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'hc == pindex) begin
                                buffer_12 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'hc == pindex) begin
                                buffer_12 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'hc == pindex) begin
                                  buffer_12 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'hc == pindex) begin
                                    buffer_12 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'hc == pindex) begin
                                      buffer_12 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'hc == pindex) begin
                                        buffer_12 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'hc == pindex) begin
                                          buffer_12 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'hc == pindex) begin
                                            buffer_12 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'hc == pindex) begin
                                              buffer_12 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'hc == pindex) begin
                                  buffer_12 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'hc == _T_8) begin
                    buffer_12 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'hc == pindex) begin
                          buffer_12 <= 64'h6;
                        end
                      end else begin
                        if (5'hc == pindex) begin
                          buffer_12 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'hc == pindex) begin
                              buffer_12 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'hc == pindex) begin
                              buffer_12 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'hc == pindex) begin
                              buffer_12 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'hc == pindex) begin
                                buffer_12 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'hc == pindex) begin
                                  buffer_12 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'hc == pindex) begin
                                    buffer_12 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'hc == pindex) begin
                                      buffer_12 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'hc == pindex) begin
                                        buffer_12 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'hc == pindex) begin
                                          buffer_12 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'hc == pindex) begin
                                            buffer_12 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'hc == pindex) begin
                                buffer_12 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'hc == _T_8) begin
                  buffer_12 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_12 <= _GEN_143;
                    end else begin
                      if (5'hc == pindex) begin
                        buffer_12 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'hc == pindex) begin
                            buffer_12 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'hc == pindex) begin
                            buffer_12 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'hc == pindex) begin
                            buffer_12 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'hc == pindex) begin
                              buffer_12 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'hc == pindex) begin
                                buffer_12 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'hc == pindex) begin
                                  buffer_12 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'hc == pindex) begin
                                    buffer_12 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'hc == pindex) begin
                                      buffer_12 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'hc == pindex) begin
                                        buffer_12 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'hc == pindex) begin
                                          buffer_12 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_12 <= _GEN_143;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_13 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'hd == _T_136) begin
            buffer_13 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'hd == _T_8) begin
                      buffer_13 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'hd == pindex) begin
                            buffer_13 <= 64'h6;
                          end
                        end else begin
                          if (5'hd == pindex) begin
                            buffer_13 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'hd == pindex) begin
                                buffer_13 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'hd == pindex) begin
                                buffer_13 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'hd == pindex) begin
                                buffer_13 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'hd == pindex) begin
                                  buffer_13 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'hd == pindex) begin
                                    buffer_13 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'hd == pindex) begin
                                      buffer_13 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'hd == pindex) begin
                                        buffer_13 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'hd == pindex) begin
                                          buffer_13 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'hd == pindex) begin
                                            buffer_13 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'hd == pindex) begin
                                              buffer_13 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'hd == pindex) begin
                                  buffer_13 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'hd == _T_8) begin
                    buffer_13 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'hd == pindex) begin
                          buffer_13 <= 64'h6;
                        end
                      end else begin
                        if (5'hd == pindex) begin
                          buffer_13 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'hd == pindex) begin
                              buffer_13 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'hd == pindex) begin
                              buffer_13 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'hd == pindex) begin
                              buffer_13 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'hd == pindex) begin
                                buffer_13 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'hd == pindex) begin
                                  buffer_13 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'hd == pindex) begin
                                    buffer_13 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'hd == pindex) begin
                                      buffer_13 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'hd == pindex) begin
                                        buffer_13 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'hd == pindex) begin
                                          buffer_13 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'hd == pindex) begin
                                            buffer_13 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'hd == pindex) begin
                                buffer_13 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'hd == _T_8) begin
                  buffer_13 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_13 <= _GEN_144;
                    end else begin
                      if (5'hd == pindex) begin
                        buffer_13 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'hd == pindex) begin
                            buffer_13 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'hd == pindex) begin
                            buffer_13 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'hd == pindex) begin
                            buffer_13 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'hd == pindex) begin
                              buffer_13 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'hd == pindex) begin
                                buffer_13 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'hd == pindex) begin
                                  buffer_13 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'hd == pindex) begin
                                    buffer_13 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'hd == pindex) begin
                                      buffer_13 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'hd == pindex) begin
                                        buffer_13 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'hd == pindex) begin
                                          buffer_13 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_13 <= _GEN_144;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_14 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'he == _T_136) begin
            buffer_14 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'he == _T_8) begin
                      buffer_14 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'he == pindex) begin
                            buffer_14 <= 64'h6;
                          end
                        end else begin
                          if (5'he == pindex) begin
                            buffer_14 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'he == pindex) begin
                                buffer_14 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'he == pindex) begin
                                buffer_14 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'he == pindex) begin
                                buffer_14 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'he == pindex) begin
                                  buffer_14 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'he == pindex) begin
                                    buffer_14 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'he == pindex) begin
                                      buffer_14 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'he == pindex) begin
                                        buffer_14 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'he == pindex) begin
                                          buffer_14 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'he == pindex) begin
                                            buffer_14 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'he == pindex) begin
                                              buffer_14 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'he == pindex) begin
                                  buffer_14 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'he == _T_8) begin
                    buffer_14 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'he == pindex) begin
                          buffer_14 <= 64'h6;
                        end
                      end else begin
                        if (5'he == pindex) begin
                          buffer_14 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'he == pindex) begin
                              buffer_14 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'he == pindex) begin
                              buffer_14 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'he == pindex) begin
                              buffer_14 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'he == pindex) begin
                                buffer_14 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'he == pindex) begin
                                  buffer_14 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'he == pindex) begin
                                    buffer_14 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'he == pindex) begin
                                      buffer_14 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'he == pindex) begin
                                        buffer_14 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'he == pindex) begin
                                          buffer_14 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'he == pindex) begin
                                            buffer_14 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'he == pindex) begin
                                buffer_14 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'he == _T_8) begin
                  buffer_14 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_14 <= _GEN_145;
                    end else begin
                      if (5'he == pindex) begin
                        buffer_14 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'he == pindex) begin
                            buffer_14 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'he == pindex) begin
                            buffer_14 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'he == pindex) begin
                            buffer_14 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'he == pindex) begin
                              buffer_14 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'he == pindex) begin
                                buffer_14 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'he == pindex) begin
                                  buffer_14 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'he == pindex) begin
                                    buffer_14 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'he == pindex) begin
                                      buffer_14 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'he == pindex) begin
                                        buffer_14 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'he == pindex) begin
                                          buffer_14 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_14 <= _GEN_145;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_15 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'hf == _T_136) begin
            buffer_15 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'hf == _T_8) begin
                      buffer_15 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'hf == pindex) begin
                            buffer_15 <= 64'h6;
                          end
                        end else begin
                          if (5'hf == pindex) begin
                            buffer_15 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'hf == pindex) begin
                                buffer_15 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'hf == pindex) begin
                                buffer_15 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'hf == pindex) begin
                                buffer_15 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'hf == pindex) begin
                                  buffer_15 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'hf == pindex) begin
                                    buffer_15 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'hf == pindex) begin
                                      buffer_15 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'hf == pindex) begin
                                        buffer_15 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'hf == pindex) begin
                                          buffer_15 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'hf == pindex) begin
                                            buffer_15 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'hf == pindex) begin
                                              buffer_15 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'hf == pindex) begin
                                  buffer_15 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'hf == _T_8) begin
                    buffer_15 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'hf == pindex) begin
                          buffer_15 <= 64'h6;
                        end
                      end else begin
                        if (5'hf == pindex) begin
                          buffer_15 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'hf == pindex) begin
                              buffer_15 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'hf == pindex) begin
                              buffer_15 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'hf == pindex) begin
                              buffer_15 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'hf == pindex) begin
                                buffer_15 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'hf == pindex) begin
                                  buffer_15 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'hf == pindex) begin
                                    buffer_15 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'hf == pindex) begin
                                      buffer_15 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'hf == pindex) begin
                                        buffer_15 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'hf == pindex) begin
                                          buffer_15 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'hf == pindex) begin
                                            buffer_15 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'hf == pindex) begin
                                buffer_15 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'hf == _T_8) begin
                  buffer_15 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_15 <= _GEN_146;
                    end else begin
                      if (5'hf == pindex) begin
                        buffer_15 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'hf == pindex) begin
                            buffer_15 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'hf == pindex) begin
                            buffer_15 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'hf == pindex) begin
                            buffer_15 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'hf == pindex) begin
                              buffer_15 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'hf == pindex) begin
                                buffer_15 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'hf == pindex) begin
                                  buffer_15 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'hf == pindex) begin
                                    buffer_15 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'hf == pindex) begin
                                      buffer_15 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'hf == pindex) begin
                                        buffer_15 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'hf == pindex) begin
                                          buffer_15 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_15 <= _GEN_146;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_16 <= 64'h0;
    end else begin
      if (io_dmem_resp_val) begin
        if (_T_137) begin
          if (5'h10 == _T_136) begin
            buffer_16 <= io_dmem_resp_data;
          end else begin
            if (!(_T_15)) begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (5'h10 == _T_8) begin
                      buffer_16 <= io_dmem_resp_data;
                    end
                  end
                end else begin
                  if (_T_76) begin
                    if (_T_80) begin
                      if (_T_83) begin
                        if (_T_90) begin
                          if (5'h10 == pindex) begin
                            buffer_16 <= 64'h6;
                          end
                        end else begin
                          if (5'h10 == pindex) begin
                            buffer_16 <= 64'h0;
                          end
                        end
                      end else begin
                        if (_T_92) begin
                          if (_T_93) begin
                            if (_T_94) begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= _T_96;
                              end
                            end
                          end else begin
                            if (_T_98) begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= 64'h8000000000000000;
                              end
                            end else begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= _T_101;
                              end
                            end
                          end
                        end else begin
                          if (_T_102) begin
                            if (_T_103) begin
                              if (_T_104) begin
                                if (5'h10 == pindex) begin
                                  buffer_16 <= _buffer_pindex_7;
                                end
                              end else begin
                                if (_T_107) begin
                                  if (5'h10 == pindex) begin
                                    buffer_16 <= _buffer_pindex_9;
                                  end
                                end else begin
                                  if (_T_110) begin
                                    if (5'h10 == pindex) begin
                                      buffer_16 <= _buffer_pindex_11;
                                    end
                                  end else begin
                                    if (_T_113) begin
                                      if (5'h10 == pindex) begin
                                        buffer_16 <= _buffer_pindex_13;
                                      end
                                    end else begin
                                      if (_T_116) begin
                                        if (5'h10 == pindex) begin
                                          buffer_16 <= _buffer_pindex_15;
                                        end
                                      end else begin
                                        if (_T_119) begin
                                          if (5'h10 == pindex) begin
                                            buffer_16 <= _buffer_pindex_17;
                                          end
                                        end else begin
                                          if (_T_94) begin
                                            if (5'h10 == pindex) begin
                                              buffer_16 <= _buffer_pindex_19;
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end else begin
                              if (_T_127) begin
                                if (5'h10 == pindex) begin
                                  buffer_16 <= 64'h6;
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (!(_T_15)) begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (5'h10 == _T_8) begin
                    buffer_16 <= io_dmem_resp_data;
                  end
                end
              end else begin
                if (_T_76) begin
                  if (_T_80) begin
                    if (_T_83) begin
                      if (_T_90) begin
                        if (5'h10 == pindex) begin
                          buffer_16 <= 64'h6;
                        end
                      end else begin
                        if (5'h10 == pindex) begin
                          buffer_16 <= 64'h0;
                        end
                      end
                    end else begin
                      if (_T_92) begin
                        if (_T_93) begin
                          if (_T_94) begin
                            if (5'h10 == pindex) begin
                              buffer_16 <= _T_96;
                            end
                          end
                        end else begin
                          if (_T_98) begin
                            if (5'h10 == pindex) begin
                              buffer_16 <= 64'h8000000000000000;
                            end
                          end else begin
                            if (5'h10 == pindex) begin
                              buffer_16 <= _T_101;
                            end
                          end
                        end
                      end else begin
                        if (_T_102) begin
                          if (_T_103) begin
                            if (_T_104) begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= _buffer_pindex_7;
                              end
                            end else begin
                              if (_T_107) begin
                                if (5'h10 == pindex) begin
                                  buffer_16 <= _buffer_pindex_9;
                                end
                              end else begin
                                if (_T_110) begin
                                  if (5'h10 == pindex) begin
                                    buffer_16 <= _buffer_pindex_11;
                                  end
                                end else begin
                                  if (_T_113) begin
                                    if (5'h10 == pindex) begin
                                      buffer_16 <= _buffer_pindex_13;
                                    end
                                  end else begin
                                    if (_T_116) begin
                                      if (5'h10 == pindex) begin
                                        buffer_16 <= _buffer_pindex_15;
                                      end
                                    end else begin
                                      if (_T_119) begin
                                        if (5'h10 == pindex) begin
                                          buffer_16 <= _buffer_pindex_17;
                                        end
                                      end else begin
                                        if (_T_94) begin
                                          if (5'h10 == pindex) begin
                                            buffer_16 <= _buffer_pindex_19;
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end else begin
                            if (_T_127) begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= 64'h6;
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (!(_T_15)) begin
          if (!(_T_26)) begin
            if (_T_57) begin
              if (io_dmem_resp_val) begin
                if (5'h10 == _T_8) begin
                  buffer_16 <= io_dmem_resp_data;
                end
              end
            end else begin
              if (_T_76) begin
                if (_T_80) begin
                  if (_T_83) begin
                    if (_T_90) begin
                      buffer_16 <= _GEN_147;
                    end else begin
                      if (5'h10 == pindex) begin
                        buffer_16 <= 64'h0;
                      end
                    end
                  end else begin
                    if (_T_92) begin
                      if (_T_93) begin
                        if (_T_94) begin
                          if (5'h10 == pindex) begin
                            buffer_16 <= _T_96;
                          end
                        end
                      end else begin
                        if (_T_98) begin
                          if (5'h10 == pindex) begin
                            buffer_16 <= 64'h8000000000000000;
                          end
                        end else begin
                          if (5'h10 == pindex) begin
                            buffer_16 <= _T_101;
                          end
                        end
                      end
                    end else begin
                      if (_T_102) begin
                        if (_T_103) begin
                          if (_T_104) begin
                            if (5'h10 == pindex) begin
                              buffer_16 <= _buffer_pindex_7;
                            end
                          end else begin
                            if (_T_107) begin
                              if (5'h10 == pindex) begin
                                buffer_16 <= _buffer_pindex_9;
                              end
                            end else begin
                              if (_T_110) begin
                                if (5'h10 == pindex) begin
                                  buffer_16 <= _buffer_pindex_11;
                                end
                              end else begin
                                if (_T_113) begin
                                  if (5'h10 == pindex) begin
                                    buffer_16 <= _buffer_pindex_13;
                                  end
                                end else begin
                                  if (_T_116) begin
                                    if (5'h10 == pindex) begin
                                      buffer_16 <= _buffer_pindex_15;
                                    end
                                  end else begin
                                    if (_T_119) begin
                                      if (5'h10 == pindex) begin
                                        buffer_16 <= _buffer_pindex_17;
                                      end
                                    end else begin
                                      if (_T_94) begin
                                        if (5'h10 == pindex) begin
                                          buffer_16 <= _buffer_pindex_19;
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end else begin
                          if (_T_127) begin
                            buffer_16 <= _GEN_147;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_valid <= 1'h0;
    end else begin
      if (_T_145) begin
        if (_T_143) begin
          if (_T_144) begin
            if (!(_T_15)) begin
              if (_T_26) begin
                if (_T_39) begin
                  buffer_valid <= _GEN_57;
                end else begin
                  if (!(_T_47)) begin
                    if (_T_56) begin
                      buffer_valid <= 1'h0;
                    end
                  end
                end
              end else begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    if (_T_39) begin
                      buffer_valid <= _GEN_57;
                    end else begin
                      if (!(_T_47)) begin
                        if (_T_56) begin
                          buffer_valid <= 1'h0;
                        end else begin
                          buffer_valid <= 1'h1;
                        end
                      end
                    end
                  end
                end else begin
                  if (_T_76) begin
                    buffer_valid <= next_buff_val;
                  end else begin
                    buffer_valid <= _GEN_670;
                  end
                end
              end
            end
          end else begin
            buffer_valid <= 1'h1;
          end
        end else begin
          if (!(_T_15)) begin
            if (_T_26) begin
              if (_T_39) begin
                buffer_valid <= _GEN_57;
              end else begin
                if (!(_T_47)) begin
                  if (_T_56) begin
                    buffer_valid <= 1'h0;
                  end
                end
              end
            end else begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  if (_T_39) begin
                    buffer_valid <= _GEN_57;
                  end else begin
                    if (!(_T_47)) begin
                      if (_T_56) begin
                        buffer_valid <= 1'h0;
                      end else begin
                        buffer_valid <= 1'h1;
                      end
                    end
                  end
                end
              end else begin
                if (_T_76) begin
                  buffer_valid <= next_buff_val;
                end else begin
                  buffer_valid <= _GEN_670;
                end
              end
            end
          end
        end
      end else begin
        if (_T_151) begin
          if (_T_155) begin
            buffer_valid <= 1'h0;
          end else begin
            if (_T_143) begin
              if (_T_144) begin
                if (!(_T_15)) begin
                  if (_T_26) begin
                    if (_T_39) begin
                      buffer_valid <= _GEN_57;
                    end else begin
                      if (!(_T_47)) begin
                        if (_T_56) begin
                          buffer_valid <= 1'h0;
                        end
                      end
                    end
                  end else begin
                    if (_T_57) begin
                      if (io_dmem_resp_val) begin
                        if (_T_39) begin
                          buffer_valid <= _GEN_57;
                        end else begin
                          if (!(_T_47)) begin
                            if (_T_56) begin
                              buffer_valid <= 1'h0;
                            end else begin
                              buffer_valid <= 1'h1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (_T_76) begin
                        buffer_valid <= next_buff_val;
                      end else begin
                        buffer_valid <= _GEN_670;
                      end
                    end
                  end
                end
              end else begin
                buffer_valid <= 1'h1;
              end
            end else begin
              if (!(_T_15)) begin
                if (_T_26) begin
                  if (_T_39) begin
                    buffer_valid <= _GEN_57;
                  end else begin
                    if (!(_T_47)) begin
                      if (_T_56) begin
                        buffer_valid <= 1'h0;
                      end
                    end
                  end
                end else begin
                  if (_T_57) begin
                    if (io_dmem_resp_val) begin
                      if (_T_39) begin
                        buffer_valid <= _GEN_57;
                      end else begin
                        if (!(_T_47)) begin
                          if (_T_56) begin
                            buffer_valid <= 1'h0;
                          end else begin
                            buffer_valid <= 1'h1;
                          end
                        end
                      end
                    end
                  end else begin
                    if (_T_76) begin
                      buffer_valid <= next_buff_val;
                    end else begin
                      buffer_valid <= _GEN_670;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_158) begin
            if (_T_143) begin
              if (_T_144) begin
                buffer_valid <= _GEN_759;
              end else begin
                buffer_valid <= 1'h1;
              end
            end else begin
              buffer_valid <= _GEN_759;
            end
          end else begin
            if (_T_159) begin
              if (_T_143) begin
                if (_T_144) begin
                  buffer_valid <= _GEN_759;
                end else begin
                  buffer_valid <= 1'h1;
                end
              end else begin
                buffer_valid <= _GEN_759;
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  buffer_valid <= 1'h0;
                end else begin
                  buffer_valid <= _GEN_833;
                end
              end else begin
                buffer_valid <= _GEN_833;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      buffer_count <= 5'h0;
    end else begin
      if (_T_145) begin
        if (io_dmem_resp_val) begin
          if (_T_137) begin
            buffer_count <= _T_61;
          end else begin
            if (_T_15) begin
              if (_T_25) begin
                buffer_count <= 5'h0;
              end
            end else begin
              if (!(_T_26)) begin
                if (_T_57) begin
                  if (io_dmem_resp_val) begin
                    buffer_count <= _T_61;
                  end
                end else begin
                  if (_T_76) begin
                    if (next_buff_val) begin
                      if (areg) begin
                        buffer_count <= 5'h0;
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_15) begin
            if (_T_25) begin
              buffer_count <= 5'h0;
            end
          end else begin
            if (!(_T_26)) begin
              if (_T_57) begin
                if (io_dmem_resp_val) begin
                  buffer_count <= _T_61;
                end
              end else begin
                if (_T_76) begin
                  if (next_buff_val) begin
                    if (areg) begin
                      buffer_count <= 5'h0;
                    end
                  end
                end
              end
            end
          end
        end
      end else begin
        if (_T_151) begin
          if (_T_155) begin
            buffer_count <= 5'h0;
          end else begin
            if (io_dmem_resp_val) begin
              if (_T_137) begin
                buffer_count <= _T_61;
              end else begin
                if (_T_15) begin
                  if (_T_25) begin
                    buffer_count <= 5'h0;
                  end
                end else begin
                  if (!(_T_26)) begin
                    if (_T_57) begin
                      if (io_dmem_resp_val) begin
                        buffer_count <= _T_61;
                      end
                    end else begin
                      if (_T_76) begin
                        if (next_buff_val) begin
                          if (areg) begin
                            buffer_count <= 5'h0;
                          end
                        end
                      end
                    end
                  end
                end
              end
            end else begin
              if (_T_15) begin
                if (_T_25) begin
                  buffer_count <= 5'h0;
                end
              end else begin
                if (!(_T_26)) begin
                  if (_T_57) begin
                    if (io_dmem_resp_val) begin
                      buffer_count <= _T_61;
                    end
                  end else begin
                    if (_T_76) begin
                      if (next_buff_val) begin
                        if (areg) begin
                          buffer_count <= 5'h0;
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_158) begin
            if (io_dmem_resp_val) begin
              if (_T_137) begin
                buffer_count <= _T_61;
              end else begin
                buffer_count <= _GEN_749;
              end
            end else begin
              buffer_count <= _GEN_749;
            end
          end else begin
            if (_T_159) begin
              if (io_dmem_resp_val) begin
                if (_T_137) begin
                  buffer_count <= _T_61;
                end else begin
                  buffer_count <= _GEN_749;
                end
              end else begin
                buffer_count <= _GEN_749;
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  buffer_count <= 5'h0;
                end else begin
                  buffer_count <= _GEN_831;
                end
              end else begin
                buffer_count <= _GEN_831;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      read <= 32'h0;
    end else begin
      if (_T_145) begin
        if (!(_T_15)) begin
          if (_T_26) begin
            if (_T_39) begin
              if (_T_27) begin
                if (_T_18) begin
                  read <= 32'h1;
                end else begin
                  if (_T_31) begin
                    read <= _T_37;
                  end
                end
              end
            end else begin
              if (_T_47) begin
                if (_T_27) begin
                  if (_T_18) begin
                    read <= 32'h1;
                  end else begin
                    if (_T_31) begin
                      read <= _T_37;
                    end
                  end
                end
              end else begin
                read <= _T_37;
              end
            end
          end
        end
      end else begin
        if (_T_151) begin
          if (!(_T_15)) begin
            if (_T_26) begin
              if (_T_39) begin
                if (_T_27) begin
                  if (_T_18) begin
                    read <= 32'h1;
                  end else begin
                    if (_T_31) begin
                      read <= _T_37;
                    end
                  end
                end
              end else begin
                if (_T_47) begin
                  if (_T_27) begin
                    if (_T_18) begin
                      read <= 32'h1;
                    end else begin
                      if (_T_31) begin
                        read <= _T_37;
                      end
                    end
                  end
                end else begin
                  read <= _T_37;
                end
              end
            end
          end
        end else begin
          if (_T_158) begin
            if (!(_T_15)) begin
              if (_T_26) begin
                if (_T_39) begin
                  read <= _GEN_53;
                end else begin
                  if (_T_47) begin
                    read <= _GEN_53;
                  end else begin
                    read <= _T_37;
                  end
                end
              end
            end
          end else begin
            if (_T_159) begin
              if (!(_T_15)) begin
                if (_T_26) begin
                  if (_T_39) begin
                    read <= _GEN_53;
                  end else begin
                    if (_T_47) begin
                      read <= _GEN_53;
                    end else begin
                      read <= _T_37;
                    end
                  end
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  read <= 32'h0;
                end else begin
                  read <= _GEN_758;
                end
              end else begin
                read <= _GEN_758;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      hashed <= 32'h0;
    end else begin
      if (!(_T_145)) begin
        if (_T_151) begin
          if (_T_155) begin
            hashed <= _T_157;
          end
        end else begin
          if (!(_T_158)) begin
            if (!(_T_159)) begin
              if (_T_171) begin
                if (_T_187) begin
                  hashed <= 32'h0;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      areg <= 1'h0;
    end else begin
      if (_T_145) begin
        areg <= 1'h0;
      end else begin
        areg <= _T_151;
      end
    end
    if (reset) begin
      mindex <= 5'h0;
    end else begin
      if (_T_15) begin
        if (_T_25) begin
          mindex <= 5'h0;
        end
      end else begin
        if (_T_26) begin
          if (_T_39) begin
            if (_T_27) begin
              if (_T_31) begin
                mindex <= _T_33;
              end
            end
          end else begin
            if (_T_47) begin
              if (_T_27) begin
                if (_T_31) begin
                  mindex <= _T_33;
                end
              end
            end else begin
              mindex <= _T_33;
            end
          end
        end else begin
          if (!(_T_57)) begin
            if (_T_76) begin
              if (next_buff_val) begin
                mindex <= 5'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      windex <= 3'h0;
    end else begin
      if (!(_T_145)) begin
        if (!(_T_151)) begin
          if (!(_T_158)) begin
            if (_T_159) begin
              if (!(_T_160)) begin
                if (_T_170) begin
                  windex <= 3'h0;
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  windex <= 3'h4;
                end else begin
                  if (io_dmem_req_rdy) begin
                    windex <= _T_176;
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      aindex <= 5'h0;
    end else begin
      if (!(_T_145)) begin
        if (_T_151) begin
          if (_T_155) begin
            aindex <= 5'h0;
          end else begin
            aindex <= _T_154;
          end
        end
      end
    end
    if (reset) begin
      pindex <= 5'h0;
    end else begin
      if (!(_T_15)) begin
        if (_T_26) begin
          if (_T_39) begin
            if (_T_40) begin
              if (_T_43) begin
                if (_T_6) begin
                  pindex <= _T_8;
                end else begin
                  pindex <= mindex;
                end
              end
            end else begin
              if (_T_6) begin
                pindex <= _T_8;
              end else begin
                pindex <= mindex;
              end
            end
          end else begin
            if (!(_T_47)) begin
              if (_T_56) begin
                if (_T_6) begin
                  pindex <= _T_8;
                end else begin
                  pindex <= mindex;
                end
              end
            end
          end
        end else begin
          if (_T_57) begin
            if (io_dmem_resp_val) begin
              if (_T_39) begin
                if (_T_40) begin
                  if (_T_43) begin
                    if (_T_6) begin
                      pindex <= _T_8;
                    end else begin
                      pindex <= mindex;
                    end
                  end
                end else begin
                  pindex <= words_filled;
                end
              end else begin
                if (!(_T_47)) begin
                  if (_T_56) begin
                    pindex <= words_filled;
                  end
                end
              end
            end
          end else begin
            if (_T_76) begin
              if (next_buff_val) begin
                pindex <= 5'h0;
              end else begin
                if (!(_T_79)) begin
                  pindex <= _T_133;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      writes_done_0 <= 1'h0;
    end else begin
      if (!(_T_145)) begin
        if (!(_T_151)) begin
          if (!(_T_158)) begin
            if (!(_T_159)) begin
              if (_T_171) begin
                if (_T_187) begin
                  writes_done_0 <= 1'h0;
                end else begin
                  if (dmem_resp_val_reg) begin
                    if (_T_180) begin
                      writes_done_0 <= _GEN_860;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      writes_done_1 <= 1'h0;
    end else begin
      if (!(_T_145)) begin
        if (!(_T_151)) begin
          if (!(_T_158)) begin
            if (!(_T_159)) begin
              if (_T_171) begin
                if (_T_187) begin
                  writes_done_1 <= 1'h0;
                end else begin
                  if (dmem_resp_val_reg) begin
                    if (_T_180) begin
                      writes_done_1 <= _GEN_861;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      writes_done_2 <= 1'h0;
    end else begin
      if (!(_T_145)) begin
        if (!(_T_151)) begin
          if (!(_T_158)) begin
            if (!(_T_159)) begin
              if (_T_171) begin
                if (_T_187) begin
                  writes_done_2 <= 1'h0;
                end else begin
                  if (dmem_resp_val_reg) begin
                    if (_T_180) begin
                      writes_done_2 <= _GEN_862;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      writes_done_3 <= 1'h0;
    end else begin
      if (!(_T_145)) begin
        if (!(_T_151)) begin
          if (!(_T_158)) begin
            if (!(_T_159)) begin
              if (_T_171) begin
                if (_T_187) begin
                  writes_done_3 <= 1'h0;
                end else begin
                  if (dmem_resp_val_reg) begin
                    if (_T_180) begin
                      writes_done_3 <= _GEN_863;
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      next_buff_val <= 1'h0;
    end else begin
      next_buff_val <= _T_4;
    end
    _T_5 <= aindex;
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_145) begin
        if (_T_150) begin
          state <= 3'h1;
        end else begin
          state <= 3'h0;
        end
      end else begin
        if (_T_151) begin
          if (_T_155) begin
            state <= 3'h2;
          end else begin
            state <= 3'h1;
          end
        end else begin
          if (_T_158) begin
            state <= 3'h3;
          end else begin
            if (_T_159) begin
              if (_T_160) begin
                state <= 3'h3;
              end else begin
                if (_T_170) begin
                  state <= 3'h4;
                end else begin
                  state <= 3'h0;
                end
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  state <= 3'h0;
                end else begin
                  state <= 3'h4;
                end
              end
            end
          end
        end
      end
    end
    if (reset) begin
      rindex <= 5'h19;
    end else begin
      if (!(_T_145)) begin
        if (_T_151) begin
          if (_T_155) begin
            rindex <= 5'h0;
          end
        end else begin
          if (!(_T_158)) begin
            if (_T_159) begin
              if (_T_160) begin
                rindex <= _T_165;
              end
            end else begin
              if (_T_171) begin
                if (_T_187) begin
                  rindex <= 5'h19;
                end
              end
            end
          end
        end
      end
    end
    rindex_reg <= rindex;
  end
endmodule
module ThetaModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126404.2]
  input  [63:0] io_state_i_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  input  [63:0] io_state_i_24, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
  output [63:0] io_state_o_24 // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126407.4]
);
  wire [63:0] _T_5; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126429.4]
  wire [63:0] _T_6; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126430.4]
  wire [63:0] _T_7; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126431.4]
  wire [63:0] bc_0; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126432.4]
  wire [63:0] _T_9; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126434.4]
  wire [63:0] _T_10; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126435.4]
  wire [63:0] _T_11; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126436.4]
  wire [63:0] bc_1; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126437.4]
  wire [63:0] _T_13; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126439.4]
  wire [63:0] _T_14; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126440.4]
  wire [63:0] _T_15; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126441.4]
  wire [63:0] bc_2; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126442.4]
  wire [63:0] _T_17; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126444.4]
  wire [63:0] _T_18; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126445.4]
  wire [63:0] _T_19; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126446.4]
  wire [63:0] bc_3; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126447.4]
  wire [63:0] _T_21; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126449.4]
  wire [63:0] _T_22; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126450.4]
  wire [63:0] _T_23; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126451.4]
  wire [63:0] bc_4; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126452.4]
  wire [64:0] _T_26; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126456.4]
  wire [6:0] _T_28; // @[common.scala 24:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126458.4]
  wire [63:0] _T_29; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126459.4]
  wire [64:0] _GEN_0; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126460.4]
  wire [64:0] _T_30; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126460.4]
  wire [64:0] _GEN_1; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126461.4]
  wire [64:0] _T_31; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126461.4]
  wire [63:0] _T_25; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126454.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126462.4]
  wire [64:0] _T_38; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126475.4]
  wire [63:0] _T_41; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126478.4]
  wire [64:0] _GEN_2; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126479.4]
  wire [64:0] _T_42; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126479.4]
  wire [64:0] _GEN_3; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126480.4]
  wire [64:0] _T_43; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126480.4]
  wire [63:0] _T_37; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126473.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126481.4]
  wire [64:0] _T_50; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126494.4]
  wire [63:0] _T_53; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126497.4]
  wire [64:0] _GEN_4; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126498.4]
  wire [64:0] _T_54; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126498.4]
  wire [64:0] _GEN_5; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126499.4]
  wire [64:0] _T_55; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126499.4]
  wire [63:0] _T_49; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126492.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126500.4]
  wire [64:0] _T_62; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126513.4]
  wire [63:0] _T_65; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126516.4]
  wire [64:0] _GEN_6; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126517.4]
  wire [64:0] _T_66; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126517.4]
  wire [64:0] _GEN_7; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126518.4]
  wire [64:0] _T_67; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126518.4]
  wire [63:0] _T_61; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126511.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126519.4]
  wire [64:0] _T_74; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126532.4]
  wire [63:0] _T_77; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126535.4]
  wire [64:0] _GEN_8; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126536.4]
  wire [64:0] _T_78; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126536.4]
  wire [64:0] _GEN_9; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126537.4]
  wire [64:0] _T_79; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126537.4]
  wire [63:0] _T_73; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126530.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126538.4]
  assign _T_5 = io_state_i_0 ^ io_state_i_1; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126429.4]
  assign _T_6 = _T_5 ^ io_state_i_2; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126430.4]
  assign _T_7 = _T_6 ^ io_state_i_3; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126431.4]
  assign bc_0 = _T_7 ^ io_state_i_4; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126432.4]
  assign _T_9 = io_state_i_5 ^ io_state_i_6; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126434.4]
  assign _T_10 = _T_9 ^ io_state_i_7; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126435.4]
  assign _T_11 = _T_10 ^ io_state_i_8; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126436.4]
  assign bc_1 = _T_11 ^ io_state_i_9; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126437.4]
  assign _T_13 = io_state_i_10 ^ io_state_i_11; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126439.4]
  assign _T_14 = _T_13 ^ io_state_i_12; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126440.4]
  assign _T_15 = _T_14 ^ io_state_i_13; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126441.4]
  assign bc_2 = _T_15 ^ io_state_i_14; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126442.4]
  assign _T_17 = io_state_i_15 ^ io_state_i_16; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126444.4]
  assign _T_18 = _T_17 ^ io_state_i_17; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126445.4]
  assign _T_19 = _T_18 ^ io_state_i_18; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126446.4]
  assign bc_3 = _T_19 ^ io_state_i_19; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126447.4]
  assign _T_21 = io_state_i_20 ^ io_state_i_21; // @[theta.scala 21:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126449.4]
  assign _T_22 = _T_21 ^ io_state_i_22; // @[theta.scala 21:52:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126450.4]
  assign _T_23 = _T_22 ^ io_state_i_23; // @[theta.scala 21:72:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126451.4]
  assign bc_4 = _T_23 ^ io_state_i_24; // @[theta.scala 21:92:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126452.4]
  assign _T_26 = {bc_1, 1'h0}; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126456.4]
  assign _T_28 = 7'h40 - 7'h1; // @[common.scala 24:68:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126458.4]
  assign _T_29 = bc_1 >> _T_28; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126459.4]
  assign _GEN_0 = {{1'd0}, _T_29}; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126460.4]
  assign _T_30 = _T_26 | _GEN_0; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126460.4]
  assign _GEN_1 = {{1'd0}, bc_4}; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126461.4]
  assign _T_31 = _GEN_1 ^ _T_30; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126461.4]
  assign _T_25 = _T_31[63:0]; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126454.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126462.4]
  assign _T_38 = {bc_2, 1'h0}; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126475.4]
  assign _T_41 = bc_2 >> _T_28; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126478.4]
  assign _GEN_2 = {{1'd0}, _T_41}; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126479.4]
  assign _T_42 = _T_38 | _GEN_2; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126479.4]
  assign _GEN_3 = {{1'd0}, bc_0}; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126480.4]
  assign _T_43 = _GEN_3 ^ _T_42; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126480.4]
  assign _T_37 = _T_43[63:0]; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126473.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126481.4]
  assign _T_50 = {bc_3, 1'h0}; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126494.4]
  assign _T_53 = bc_3 >> _T_28; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126497.4]
  assign _GEN_4 = {{1'd0}, _T_53}; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126498.4]
  assign _T_54 = _T_50 | _GEN_4; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126498.4]
  assign _GEN_5 = {{1'd0}, bc_1}; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126499.4]
  assign _T_55 = _GEN_5 ^ _T_54; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126499.4]
  assign _T_49 = _T_55[63:0]; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126492.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126500.4]
  assign _T_62 = {bc_4, 1'h0}; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126513.4]
  assign _T_65 = bc_4 >> _T_28; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126516.4]
  assign _GEN_6 = {{1'd0}, _T_65}; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126517.4]
  assign _T_66 = _T_62 | _GEN_6; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126517.4]
  assign _GEN_7 = {{1'd0}, bc_2}; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126518.4]
  assign _T_67 = _GEN_7 ^ _T_66; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126518.4]
  assign _T_61 = _T_67[63:0]; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126511.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126519.4]
  assign _T_74 = {bc_0, 1'h0}; // @[common.scala 24:47:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126532.4]
  assign _T_77 = bc_0 >> _T_28; // @[common.scala 24:62:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126535.4]
  assign _GEN_8 = {{1'd0}, _T_77}; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126536.4]
  assign _T_78 = _T_74 | _GEN_8; // @[common.scala 24:55:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126536.4]
  assign _GEN_9 = {{1'd0}, bc_3}; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126537.4]
  assign _T_79 = _GEN_9 ^ _T_78; // @[theta.scala 26:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126537.4]
  assign _T_73 = _T_79[63:0]; // @[theta.scala 25:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126530.4 theta.scala 26:7:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126538.4]
  assign io_state_o_0 = io_state_i_0 ^ _T_25; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126464.4]
  assign io_state_o_1 = io_state_i_1 ^ _T_25; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126466.4]
  assign io_state_o_2 = io_state_i_2 ^ _T_25; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126468.4]
  assign io_state_o_3 = io_state_i_3 ^ _T_25; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126470.4]
  assign io_state_o_4 = io_state_i_4 ^ _T_25; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126472.4]
  assign io_state_o_5 = io_state_i_5 ^ _T_37; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126483.4]
  assign io_state_o_6 = io_state_i_6 ^ _T_37; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126485.4]
  assign io_state_o_7 = io_state_i_7 ^ _T_37; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126487.4]
  assign io_state_o_8 = io_state_i_8 ^ _T_37; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126489.4]
  assign io_state_o_9 = io_state_i_9 ^ _T_37; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126491.4]
  assign io_state_o_10 = io_state_i_10 ^ _T_49; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126502.4]
  assign io_state_o_11 = io_state_i_11 ^ _T_49; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126504.4]
  assign io_state_o_12 = io_state_i_12 ^ _T_49; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126506.4]
  assign io_state_o_13 = io_state_i_13 ^ _T_49; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126508.4]
  assign io_state_o_14 = io_state_i_14 ^ _T_49; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126510.4]
  assign io_state_o_15 = io_state_i_15 ^ _T_61; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126521.4]
  assign io_state_o_16 = io_state_i_16 ^ _T_61; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126523.4]
  assign io_state_o_17 = io_state_i_17 ^ _T_61; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126525.4]
  assign io_state_o_18 = io_state_i_18 ^ _T_61; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126527.4]
  assign io_state_o_19 = io_state_i_19 ^ _T_61; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126529.4]
  assign io_state_o_20 = io_state_i_20 ^ _T_73; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126540.4]
  assign io_state_o_21 = io_state_i_21 ^ _T_73; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126542.4]
  assign io_state_o_22 = io_state_i_22 ^ _T_73; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126544.4]
  assign io_state_o_23 = io_state_i_23 ^ _T_73; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126546.4]
  assign io_state_o_24 = io_state_i_24 ^ _T_73; // @[theta.scala 28:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126548.4]
endmodule
module RhoPiModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126550.2]
  input  [63:0] io_state_i_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  input  [63:0] io_state_i_24, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
  output [63:0] io_state_o_24 // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126553.4]
);
  wire [28:0] _T_2; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126564.4]
  wire [35:0] _T_3; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126565.4]
  wire [64:0] _T_4; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126566.4]
  wire [61:0] _T_6; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126571.4]
  wire [2:0] _T_7; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126572.4]
  wire [64:0] _T_8; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126573.4]
  wire [23:0] _T_10; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126578.4]
  wire [40:0] _T_11; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126579.4]
  wire [64:0] _T_12; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126580.4]
  wire [46:0] _T_14; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126585.4]
  wire [17:0] _T_15; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126586.4]
  wire [64:0] _T_16; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126587.4]
  wire  _T_19; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126593.4]
  wire [64:0] _T_20; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126594.4]
  wire [20:0] _T_22; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126599.4]
  wire [43:0] _T_23; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126600.4]
  wire [64:0] _T_24; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126601.4]
  wire [54:0] _T_26; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126606.4]
  wire [9:0] _T_27; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126607.4]
  wire [64:0] _T_28; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126608.4]
  wire [19:0] _T_30; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126613.4]
  wire [44:0] _T_31; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126614.4]
  wire [64:0] _T_32; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126615.4]
  wire [62:0] _T_34; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126620.4]
  wire [1:0] _T_35; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126621.4]
  wire [64:0] _T_36; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126622.4]
  wire [2:0] _T_38; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126627.4]
  wire [61:0] _T_39; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126628.4]
  wire [64:0] _T_40; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126629.4]
  wire [58:0] _T_42; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126634.4]
  wire [5:0] _T_43; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126635.4]
  wire [64:0] _T_44; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126636.4]
  wire [21:0] _T_46; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126641.4]
  wire [42:0] _T_47; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126642.4]
  wire [64:0] _T_48; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126643.4]
  wire [49:0] _T_50; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126648.4]
  wire [14:0] _T_51; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126649.4]
  wire [64:0] _T_52; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126650.4]
  wire [3:0] _T_54; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126655.4]
  wire [60:0] _T_55; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126656.4]
  wire [64:0] _T_56; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126657.4]
  wire [36:0] _T_58; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126662.4]
  wire [27:0] _T_59; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126663.4]
  wire [64:0] _T_60; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126664.4]
  wire [9:0] _T_62; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126669.4]
  wire [54:0] _T_63; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126670.4]
  wire [64:0] _T_64; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126671.4]
  wire [39:0] _T_66; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126676.4]
  wire [24:0] _T_67; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126677.4]
  wire [64:0] _T_68; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126678.4]
  wire [43:0] _T_70; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126683.4]
  wire [20:0] _T_71; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126684.4]
  wire [64:0] _T_72; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126685.4]
  wire [8:0] _T_74; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126690.4]
  wire [55:0] _T_75; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126691.4]
  wire [64:0] _T_76; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126692.4]
  wire [37:0] _T_78; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126697.4]
  wire [26:0] _T_79; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126698.4]
  wire [64:0] _T_80; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126699.4]
  wire [44:0] _T_82; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126704.4]
  wire [19:0] _T_83; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126705.4]
  wire [64:0] _T_84; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126706.4]
  wire [25:0] _T_86; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126711.4]
  wire [38:0] _T_87; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126712.4]
  wire [64:0] _T_88; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126713.4]
  wire [56:0] _T_90; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126718.4]
  wire [7:0] _T_91; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126719.4]
  wire [64:0] _T_92; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126720.4]
  wire [50:0] _T_94; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126725.4]
  wire [13:0] _T_95; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126726.4]
  wire [64:0] _T_96; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126727.4]
  assign _T_2 = io_state_i_1[28:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126564.4]
  assign _T_3 = io_state_i_1[63:28]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126565.4]
  assign _T_4 = {_T_2,_T_3}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126566.4]
  assign _T_6 = io_state_i_2[61:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126571.4]
  assign _T_7 = io_state_i_2[63:61]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126572.4]
  assign _T_8 = {_T_6,_T_7}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126573.4]
  assign _T_10 = io_state_i_3[23:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126578.4]
  assign _T_11 = io_state_i_3[63:23]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126579.4]
  assign _T_12 = {_T_10,_T_11}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126580.4]
  assign _T_14 = io_state_i_4[46:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126585.4]
  assign _T_15 = io_state_i_4[63:46]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126586.4]
  assign _T_16 = {_T_14,_T_15}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126587.4]
  assign _T_19 = io_state_i_5[63]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126593.4]
  assign _T_20 = {io_state_i_5,_T_19}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126594.4]
  assign _T_22 = io_state_i_6[20:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126599.4]
  assign _T_23 = io_state_i_6[63:20]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126600.4]
  assign _T_24 = {_T_22,_T_23}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126601.4]
  assign _T_26 = io_state_i_7[54:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126606.4]
  assign _T_27 = io_state_i_7[63:54]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126607.4]
  assign _T_28 = {_T_26,_T_27}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126608.4]
  assign _T_30 = io_state_i_8[19:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126613.4]
  assign _T_31 = io_state_i_8[63:19]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126614.4]
  assign _T_32 = {_T_30,_T_31}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126615.4]
  assign _T_34 = io_state_i_9[62:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126620.4]
  assign _T_35 = io_state_i_9[63:62]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126621.4]
  assign _T_36 = {_T_34,_T_35}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126622.4]
  assign _T_38 = io_state_i_10[2:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126627.4]
  assign _T_39 = io_state_i_10[63:2]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126628.4]
  assign _T_40 = {_T_38,_T_39}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126629.4]
  assign _T_42 = io_state_i_11[58:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126634.4]
  assign _T_43 = io_state_i_11[63:58]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126635.4]
  assign _T_44 = {_T_42,_T_43}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126636.4]
  assign _T_46 = io_state_i_12[21:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126641.4]
  assign _T_47 = io_state_i_12[63:21]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126642.4]
  assign _T_48 = {_T_46,_T_47}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126643.4]
  assign _T_50 = io_state_i_13[49:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126648.4]
  assign _T_51 = io_state_i_13[63:49]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126649.4]
  assign _T_52 = {_T_50,_T_51}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126650.4]
  assign _T_54 = io_state_i_14[3:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126655.4]
  assign _T_55 = io_state_i_14[63:3]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126656.4]
  assign _T_56 = {_T_54,_T_55}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126657.4]
  assign _T_58 = io_state_i_15[36:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126662.4]
  assign _T_59 = io_state_i_15[63:36]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126663.4]
  assign _T_60 = {_T_58,_T_59}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126664.4]
  assign _T_62 = io_state_i_16[9:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126669.4]
  assign _T_63 = io_state_i_16[63:9]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126670.4]
  assign _T_64 = {_T_62,_T_63}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126671.4]
  assign _T_66 = io_state_i_17[39:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126676.4]
  assign _T_67 = io_state_i_17[63:39]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126677.4]
  assign _T_68 = {_T_66,_T_67}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126678.4]
  assign _T_70 = io_state_i_18[43:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126683.4]
  assign _T_71 = io_state_i_18[63:43]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126684.4]
  assign _T_72 = {_T_70,_T_71}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126685.4]
  assign _T_74 = io_state_i_19[8:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126690.4]
  assign _T_75 = io_state_i_19[63:8]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126691.4]
  assign _T_76 = {_T_74,_T_75}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126692.4]
  assign _T_78 = io_state_i_20[37:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126697.4]
  assign _T_79 = io_state_i_20[63:37]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126698.4]
  assign _T_80 = {_T_78,_T_79}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126699.4]
  assign _T_82 = io_state_i_21[44:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126704.4]
  assign _T_83 = io_state_i_21[63:44]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126705.4]
  assign _T_84 = {_T_82,_T_83}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126706.4]
  assign _T_86 = io_state_i_22[25:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126711.4]
  assign _T_87 = io_state_i_22[63:25]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126712.4]
  assign _T_88 = {_T_86,_T_87}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126713.4]
  assign _T_90 = io_state_i_23[56:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126718.4]
  assign _T_91 = io_state_i_23[63:56]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126719.4]
  assign _T_92 = {_T_90,_T_91}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126720.4]
  assign _T_94 = io_state_i_24[50:0]; // @[rhopi.scala 43:38:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126725.4]
  assign _T_95 = io_state_i_24[63:50]; // @[rhopi.scala 43:90:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126726.4]
  assign _T_96 = {_T_94,_T_95}; // @[Cat.scala 29:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126727.4]
  assign io_state_o_0 = io_state_i_0; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126561.4]
  assign io_state_o_1 = _T_60[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126666.4]
  assign io_state_o_2 = _T_20[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126596.4]
  assign io_state_o_3 = _T_80[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126701.4]
  assign io_state_o_4 = _T_40[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126631.4]
  assign io_state_o_5 = _T_24[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126603.4]
  assign io_state_o_6 = _T_84[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126708.4]
  assign io_state_o_7 = _T_44[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126638.4]
  assign io_state_o_8 = _T_4[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126568.4]
  assign io_state_o_9 = _T_64[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126673.4]
  assign io_state_o_10 = _T_48[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126645.4]
  assign io_state_o_11 = _T_8[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126575.4]
  assign io_state_o_12 = _T_68[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126680.4]
  assign io_state_o_13 = _T_28[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126610.4]
  assign io_state_o_14 = _T_88[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126715.4]
  assign io_state_o_15 = _T_72[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126687.4]
  assign io_state_o_16 = _T_32[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126617.4]
  assign io_state_o_17 = _T_92[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126722.4]
  assign io_state_o_18 = _T_52[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126652.4]
  assign io_state_o_19 = _T_12[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126582.4]
  assign io_state_o_20 = _T_96[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126729.4]
  assign io_state_o_21 = _T_56[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126659.4]
  assign io_state_o_22 = _T_16[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126589.4]
  assign io_state_o_23 = _T_76[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126694.4]
  assign io_state_o_24 = _T_36[63:0]; // @[rhopi.scala 45:37:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126624.4]
endmodule
module ChiModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126731.2]
  input  [63:0] io_state_i_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  input  [63:0] io_state_i_24, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
  output [63:0] io_state_o_24 // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126734.4]
);
  wire [63:0] _T; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126739.4]
  wire [63:0] _T_1; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126740.4]
  wire [63:0] _T_3; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126743.4]
  wire [63:0] _T_4; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126744.4]
  wire [63:0] _T_6; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126747.4]
  wire [63:0] _T_7; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126748.4]
  wire [63:0] _T_9; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126751.4]
  wire [63:0] _T_10; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126752.4]
  wire [63:0] _T_12; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126755.4]
  wire [63:0] _T_13; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126756.4]
  wire [63:0] _T_15; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126759.4]
  wire [63:0] _T_16; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126760.4]
  wire [63:0] _T_18; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126763.4]
  wire [63:0] _T_19; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126764.4]
  wire [63:0] _T_21; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126767.4]
  wire [63:0] _T_22; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126768.4]
  wire [63:0] _T_24; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126771.4]
  wire [63:0] _T_25; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126772.4]
  wire [63:0] _T_27; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126775.4]
  wire [63:0] _T_28; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126776.4]
  wire [63:0] _T_30; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126779.4]
  wire [63:0] _T_31; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126780.4]
  wire [63:0] _T_33; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126783.4]
  wire [63:0] _T_34; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126784.4]
  wire [63:0] _T_36; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126787.4]
  wire [63:0] _T_37; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126788.4]
  wire [63:0] _T_39; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126791.4]
  wire [63:0] _T_40; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126792.4]
  wire [63:0] _T_42; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126795.4]
  wire [63:0] _T_43; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126796.4]
  wire [63:0] _T_45; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126799.4]
  wire [63:0] _T_46; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126800.4]
  wire [63:0] _T_48; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126803.4]
  wire [63:0] _T_49; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126804.4]
  wire [63:0] _T_51; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126807.4]
  wire [63:0] _T_52; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126808.4]
  wire [63:0] _T_54; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126811.4]
  wire [63:0] _T_55; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126812.4]
  wire [63:0] _T_57; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126815.4]
  wire [63:0] _T_58; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126816.4]
  wire [63:0] _T_60; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126819.4]
  wire [63:0] _T_61; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126820.4]
  wire [63:0] _T_63; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126823.4]
  wire [63:0] _T_64; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126824.4]
  wire [63:0] _T_66; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126827.4]
  wire [63:0] _T_67; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126828.4]
  wire [63:0] _T_69; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126831.4]
  wire [63:0] _T_70; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126832.4]
  wire [63:0] _T_72; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126835.4]
  wire [63:0] _T_73; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126836.4]
  assign _T = ~ io_state_i_5; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126739.4]
  assign _T_1 = _T & io_state_i_10; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126740.4]
  assign _T_3 = ~ io_state_i_6; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126743.4]
  assign _T_4 = _T_3 & io_state_i_11; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126744.4]
  assign _T_6 = ~ io_state_i_7; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126747.4]
  assign _T_7 = _T_6 & io_state_i_12; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126748.4]
  assign _T_9 = ~ io_state_i_8; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126751.4]
  assign _T_10 = _T_9 & io_state_i_13; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126752.4]
  assign _T_12 = ~ io_state_i_9; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126755.4]
  assign _T_13 = _T_12 & io_state_i_14; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126756.4]
  assign _T_15 = ~ io_state_i_10; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126759.4]
  assign _T_16 = _T_15 & io_state_i_15; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126760.4]
  assign _T_18 = ~ io_state_i_11; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126763.4]
  assign _T_19 = _T_18 & io_state_i_16; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126764.4]
  assign _T_21 = ~ io_state_i_12; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126767.4]
  assign _T_22 = _T_21 & io_state_i_17; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126768.4]
  assign _T_24 = ~ io_state_i_13; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126771.4]
  assign _T_25 = _T_24 & io_state_i_18; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126772.4]
  assign _T_27 = ~ io_state_i_14; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126775.4]
  assign _T_28 = _T_27 & io_state_i_19; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126776.4]
  assign _T_30 = ~ io_state_i_15; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126779.4]
  assign _T_31 = _T_30 & io_state_i_20; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126780.4]
  assign _T_33 = ~ io_state_i_16; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126783.4]
  assign _T_34 = _T_33 & io_state_i_21; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126784.4]
  assign _T_36 = ~ io_state_i_17; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126787.4]
  assign _T_37 = _T_36 & io_state_i_22; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126788.4]
  assign _T_39 = ~ io_state_i_18; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126791.4]
  assign _T_40 = _T_39 & io_state_i_23; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126792.4]
  assign _T_42 = ~ io_state_i_19; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126795.4]
  assign _T_43 = _T_42 & io_state_i_24; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126796.4]
  assign _T_45 = ~ io_state_i_20; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126799.4]
  assign _T_46 = _T_45 & io_state_i_0; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126800.4]
  assign _T_48 = ~ io_state_i_21; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126803.4]
  assign _T_49 = _T_48 & io_state_i_1; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126804.4]
  assign _T_51 = ~ io_state_i_22; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126807.4]
  assign _T_52 = _T_51 & io_state_i_2; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126808.4]
  assign _T_54 = ~ io_state_i_23; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126811.4]
  assign _T_55 = _T_54 & io_state_i_3; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126812.4]
  assign _T_57 = ~ io_state_i_24; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126815.4]
  assign _T_58 = _T_57 & io_state_i_4; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126816.4]
  assign _T_60 = ~ io_state_i_0; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126819.4]
  assign _T_61 = _T_60 & io_state_i_5; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126820.4]
  assign _T_63 = ~ io_state_i_1; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126823.4]
  assign _T_64 = _T_63 & io_state_i_6; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126824.4]
  assign _T_66 = ~ io_state_i_2; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126827.4]
  assign _T_67 = _T_66 & io_state_i_7; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126828.4]
  assign _T_69 = ~ io_state_i_3; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126831.4]
  assign _T_70 = _T_69 & io_state_i_8; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126832.4]
  assign _T_72 = ~ io_state_i_4; // @[chi.scala 22:10:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126835.4]
  assign _T_73 = _T_72 & io_state_i_9; // @[chi.scala 22:44:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126836.4]
  assign io_state_o_0 = io_state_i_0 ^ _T_1; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126742.4]
  assign io_state_o_1 = io_state_i_1 ^ _T_4; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126746.4]
  assign io_state_o_2 = io_state_i_2 ^ _T_7; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126750.4]
  assign io_state_o_3 = io_state_i_3 ^ _T_10; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126754.4]
  assign io_state_o_4 = io_state_i_4 ^ _T_13; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126758.4]
  assign io_state_o_5 = io_state_i_5 ^ _T_16; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126762.4]
  assign io_state_o_6 = io_state_i_6 ^ _T_19; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126766.4]
  assign io_state_o_7 = io_state_i_7 ^ _T_22; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126770.4]
  assign io_state_o_8 = io_state_i_8 ^ _T_25; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126774.4]
  assign io_state_o_9 = io_state_i_9 ^ _T_28; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126778.4]
  assign io_state_o_10 = io_state_i_10 ^ _T_31; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126782.4]
  assign io_state_o_11 = io_state_i_11 ^ _T_34; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126786.4]
  assign io_state_o_12 = io_state_i_12 ^ _T_37; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126790.4]
  assign io_state_o_13 = io_state_i_13 ^ _T_40; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126794.4]
  assign io_state_o_14 = io_state_i_14 ^ _T_43; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126798.4]
  assign io_state_o_15 = io_state_i_15 ^ _T_46; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126802.4]
  assign io_state_o_16 = io_state_i_16 ^ _T_49; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126806.4]
  assign io_state_o_17 = io_state_i_17 ^ _T_52; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126810.4]
  assign io_state_o_18 = io_state_i_18 ^ _T_55; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126814.4]
  assign io_state_o_19 = io_state_i_19 ^ _T_58; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126818.4]
  assign io_state_o_20 = io_state_i_20 ^ _T_61; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126822.4]
  assign io_state_o_21 = io_state_i_21 ^ _T_64; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126826.4]
  assign io_state_o_22 = io_state_i_22 ^ _T_67; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126830.4]
  assign io_state_o_23 = io_state_i_23 ^ _T_70; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126834.4]
  assign io_state_o_24 = io_state_i_24 ^ _T_73; // @[chi.scala 21:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126838.4]
endmodule
module IotaModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126840.2]
  input  [63:0] io_state_i_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [63:0] io_state_i_24, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_4, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_5, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_6, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_7, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_8, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_9, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_10, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_11, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_13, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_14, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_15, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_16, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_17, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_18, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_19, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_20, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_21, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_22, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  output [63:0] io_state_o_24, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
  input  [4:0]  io_round // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126843.4]
);
  wire [63:0] _GEN_1; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_2; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_3; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_4; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_5; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_6; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_7; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_8; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_9; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_10; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_11; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_12; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_13; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_14; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_15; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_16; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_17; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_18; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_19; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_20; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_21; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_22; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_23; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  wire [63:0] _GEN_24; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_1 = 5'h1 == io_round ? 64'h8082 : 64'h1; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_2 = 5'h2 == io_round ? 64'h800000000000808a : _GEN_1; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_3 = 5'h3 == io_round ? 64'h8000000080008000 : _GEN_2; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_4 = 5'h4 == io_round ? 64'h808b : _GEN_3; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_5 = 5'h5 == io_round ? 64'h80000001 : _GEN_4; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_6 = 5'h6 == io_round ? 64'h8000000080008081 : _GEN_5; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_7 = 5'h7 == io_round ? 64'h8000000000008009 : _GEN_6; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_8 = 5'h8 == io_round ? 64'h8a : _GEN_7; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_9 = 5'h9 == io_round ? 64'h88 : _GEN_8; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_10 = 5'ha == io_round ? 64'h80008009 : _GEN_9; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_11 = 5'hb == io_round ? 64'h8000000a : _GEN_10; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_12 = 5'hc == io_round ? 64'h8000808b : _GEN_11; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_13 = 5'hd == io_round ? 64'h800000000000008b : _GEN_12; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_14 = 5'he == io_round ? 64'h8000000000008089 : _GEN_13; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_15 = 5'hf == io_round ? 64'h8000000000008003 : _GEN_14; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_16 = 5'h10 == io_round ? 64'h8000000000008002 : _GEN_15; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_17 = 5'h11 == io_round ? 64'h8000000000000080 : _GEN_16; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_18 = 5'h12 == io_round ? 64'h800a : _GEN_17; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_19 = 5'h13 == io_round ? 64'h800000008000000a : _GEN_18; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_20 = 5'h14 == io_round ? 64'h8000000080008081 : _GEN_19; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_21 = 5'h15 == io_round ? 64'h8000000000008080 : _GEN_20; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_22 = 5'h16 == io_round ? 64'h80000001 : _GEN_21; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_23 = 5'h17 == io_round ? 64'h8000000080008008 : _GEN_22; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign _GEN_24 = 5'h18 == io_round ? 64'h0 : _GEN_23; // @[iota.scala 28:34:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126899.4]
  assign io_state_o_0 = io_state_i_0 ^ _GEN_24; // @[iota.scala 28:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126900.4]
  assign io_state_o_1 = io_state_i_1; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126848.4]
  assign io_state_o_2 = io_state_i_2; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126849.4]
  assign io_state_o_3 = io_state_i_3; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126850.4]
  assign io_state_o_4 = io_state_i_4; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126851.4]
  assign io_state_o_5 = io_state_i_5; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126852.4]
  assign io_state_o_6 = io_state_i_6; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126853.4]
  assign io_state_o_7 = io_state_i_7; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126854.4]
  assign io_state_o_8 = io_state_i_8; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126855.4]
  assign io_state_o_9 = io_state_i_9; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126856.4]
  assign io_state_o_10 = io_state_i_10; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126857.4]
  assign io_state_o_11 = io_state_i_11; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126858.4]
  assign io_state_o_12 = io_state_i_12; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126859.4]
  assign io_state_o_13 = io_state_i_13; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126860.4]
  assign io_state_o_14 = io_state_i_14; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126861.4]
  assign io_state_o_15 = io_state_i_15; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126862.4]
  assign io_state_o_16 = io_state_i_16; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126863.4]
  assign io_state_o_17 = io_state_i_17; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126864.4]
  assign io_state_o_18 = io_state_i_18; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126865.4]
  assign io_state_o_19 = io_state_i_19; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126866.4]
  assign io_state_o_20 = io_state_i_20; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126867.4]
  assign io_state_o_21 = io_state_i_21; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126868.4]
  assign io_state_o_22 = io_state_i_22; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126869.4]
  assign io_state_o_23 = io_state_i_23; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126870.4]
  assign io_state_o_24 = io_state_i_24; // @[iota.scala 22:27:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126871.4]
endmodule
module DpathModule( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126902.2]
  input         clock, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126903.4]
  input         reset, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126904.4]
  input         io_absorb, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  input         io_init, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  input         io_write, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  input  [4:0]  io_round, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  input  [4:0]  io_aindex, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  input  [63:0] io_message_in, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  output [63:0] io_hash_out_0, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  output [63:0] io_hash_out_1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  output [63:0] io_hash_out_2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
  output [63:0] io_hash_out_3 // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126905.4]
);
  wire [63:0] ThetaModule_io_state_i_0; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_1; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_2; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_3; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_4; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_5; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_6; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_7; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_8; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_9; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_10; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_11; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_12; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_13; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_14; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_15; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_16; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_17; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_18; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_19; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_20; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_21; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_22; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_23; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_i_24; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_0; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_1; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_2; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_3; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_4; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_5; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_6; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_7; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_8; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_9; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_10; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_11; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_12; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_13; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_14; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_15; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_16; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_17; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_18; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_19; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_20; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_21; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_22; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_23; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] ThetaModule_io_state_o_24; // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
  wire [63:0] RhoPiModule_io_state_i_0; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_1; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_2; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_3; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_4; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_5; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_6; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_7; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_8; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_9; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_10; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_11; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_12; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_13; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_14; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_15; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_16; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_17; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_18; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_19; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_20; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_21; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_22; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_23; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_i_24; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_0; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_1; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_2; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_3; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_4; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_5; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_6; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_7; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_8; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_9; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_10; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_11; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_12; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_13; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_14; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_15; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_16; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_17; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_18; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_19; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_20; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_21; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_22; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_23; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] RhoPiModule_io_state_o_24; // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
  wire [63:0] ChiModule_io_state_i_0; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_1; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_2; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_3; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_4; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_5; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_6; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_7; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_8; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_9; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_10; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_11; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_12; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_13; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_14; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_15; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_16; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_17; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_18; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_19; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_20; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_21; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_22; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_23; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_i_24; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_0; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_1; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_2; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_3; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_4; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_5; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_6; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_7; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_8; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_9; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_10; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_11; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_12; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_13; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_14; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_15; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_16; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_17; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_18; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_19; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_20; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_21; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_22; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_23; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] ChiModule_io_state_o_24; // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
  wire [63:0] iota_io_state_i_0; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_1; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_2; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_3; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_4; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_5; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_6; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_7; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_8; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_9; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_10; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_11; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_12; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_13; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_14; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_15; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_16; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_17; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_18; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_19; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_20; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_21; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_22; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_23; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_i_24; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_0; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_1; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_2; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_3; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_4; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_5; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_6; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_7; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_8; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_9; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_10; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_11; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_12; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_13; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_14; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_15; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_16; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_17; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_18; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_19; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_20; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_21; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_22; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_23; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [63:0] iota_io_state_o_24; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  wire [4:0] iota_io_round; // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
  reg [63:0] state_0; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_0;
  reg [63:0] state_1; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_1;
  reg [63:0] state_2; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_2;
  reg [63:0] state_3; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_3;
  reg [63:0] state_4; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_4;
  reg [63:0] state_5; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_5;
  reg [63:0] state_6; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_6;
  reg [63:0] state_7; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_7;
  reg [63:0] state_8; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_8;
  reg [63:0] state_9; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_9;
  reg [63:0] state_10; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_10;
  reg [63:0] state_11; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_11;
  reg [63:0] state_12; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_12;
  reg [63:0] state_13; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_13;
  reg [63:0] state_14; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_14;
  reg [63:0] state_15; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_15;
  reg [63:0] state_16; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_16;
  reg [63:0] state_17; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_17;
  reg [63:0] state_18; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_18;
  reg [63:0] state_19; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_19;
  reg [63:0] state_20; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_20;
  reg [63:0] state_21; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_21;
  reg [63:0] state_22; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_22;
  reg [63:0] state_23; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_23;
  reg [63:0] state_24; // @[dpath.scala 31:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126937.4]
  reg [63:0] _RAND_24;
  wire [63:0] _GEN_0; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_1; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_2; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_3; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_4; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_5; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_6; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_7; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_8; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_9; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_10; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_11; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_12; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_13; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_14; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_15; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_16; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_17; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_18; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_19; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_20; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_21; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_22; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_23; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire [63:0] _GEN_24; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  wire  _T_6; // @[dpath.scala 108:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127007.6]
  wire [4:0] _GEN_25; // @[dpath.scala 109:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127009.8]
  wire [2:0] _T_7; // @[dpath.scala 109:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127009.8]
  wire [5:0] _T_8; // @[dpath.scala 109:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127010.8]
  wire [4:0] _T_9; // @[dpath.scala 109:51:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127011.8]
  wire [5:0] _GEN_200; // @[dpath.scala 109:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127012.8]
  wire [5:0] _T_11; // @[dpath.scala 109:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127013.8]
  wire [4:0] _T_12; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127014.8]
  wire [63:0] _GEN_26; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_27; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_28; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_29; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_30; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_31; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_32; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_33; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_34; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_35; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_36; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_37; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_38; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_39; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_40; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_41; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_42; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_43; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_44; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_45; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_46; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_47; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_48; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _GEN_49; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  wire [63:0] _T_19; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  ThetaModule ThetaModule ( // @[dpath.scala 34:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126938.4]
    .io_state_i_0(ThetaModule_io_state_i_0),
    .io_state_i_1(ThetaModule_io_state_i_1),
    .io_state_i_2(ThetaModule_io_state_i_2),
    .io_state_i_3(ThetaModule_io_state_i_3),
    .io_state_i_4(ThetaModule_io_state_i_4),
    .io_state_i_5(ThetaModule_io_state_i_5),
    .io_state_i_6(ThetaModule_io_state_i_6),
    .io_state_i_7(ThetaModule_io_state_i_7),
    .io_state_i_8(ThetaModule_io_state_i_8),
    .io_state_i_9(ThetaModule_io_state_i_9),
    .io_state_i_10(ThetaModule_io_state_i_10),
    .io_state_i_11(ThetaModule_io_state_i_11),
    .io_state_i_12(ThetaModule_io_state_i_12),
    .io_state_i_13(ThetaModule_io_state_i_13),
    .io_state_i_14(ThetaModule_io_state_i_14),
    .io_state_i_15(ThetaModule_io_state_i_15),
    .io_state_i_16(ThetaModule_io_state_i_16),
    .io_state_i_17(ThetaModule_io_state_i_17),
    .io_state_i_18(ThetaModule_io_state_i_18),
    .io_state_i_19(ThetaModule_io_state_i_19),
    .io_state_i_20(ThetaModule_io_state_i_20),
    .io_state_i_21(ThetaModule_io_state_i_21),
    .io_state_i_22(ThetaModule_io_state_i_22),
    .io_state_i_23(ThetaModule_io_state_i_23),
    .io_state_i_24(ThetaModule_io_state_i_24),
    .io_state_o_0(ThetaModule_io_state_o_0),
    .io_state_o_1(ThetaModule_io_state_o_1),
    .io_state_o_2(ThetaModule_io_state_o_2),
    .io_state_o_3(ThetaModule_io_state_o_3),
    .io_state_o_4(ThetaModule_io_state_o_4),
    .io_state_o_5(ThetaModule_io_state_o_5),
    .io_state_o_6(ThetaModule_io_state_o_6),
    .io_state_o_7(ThetaModule_io_state_o_7),
    .io_state_o_8(ThetaModule_io_state_o_8),
    .io_state_o_9(ThetaModule_io_state_o_9),
    .io_state_o_10(ThetaModule_io_state_o_10),
    .io_state_o_11(ThetaModule_io_state_o_11),
    .io_state_o_12(ThetaModule_io_state_o_12),
    .io_state_o_13(ThetaModule_io_state_o_13),
    .io_state_o_14(ThetaModule_io_state_o_14),
    .io_state_o_15(ThetaModule_io_state_o_15),
    .io_state_o_16(ThetaModule_io_state_o_16),
    .io_state_o_17(ThetaModule_io_state_o_17),
    .io_state_o_18(ThetaModule_io_state_o_18),
    .io_state_o_19(ThetaModule_io_state_o_19),
    .io_state_o_20(ThetaModule_io_state_o_20),
    .io_state_o_21(ThetaModule_io_state_o_21),
    .io_state_o_22(ThetaModule_io_state_o_22),
    .io_state_o_23(ThetaModule_io_state_o_23),
    .io_state_o_24(ThetaModule_io_state_o_24)
  );
  RhoPiModule RhoPiModule ( // @[dpath.scala 35:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126942.4]
    .io_state_i_0(RhoPiModule_io_state_i_0),
    .io_state_i_1(RhoPiModule_io_state_i_1),
    .io_state_i_2(RhoPiModule_io_state_i_2),
    .io_state_i_3(RhoPiModule_io_state_i_3),
    .io_state_i_4(RhoPiModule_io_state_i_4),
    .io_state_i_5(RhoPiModule_io_state_i_5),
    .io_state_i_6(RhoPiModule_io_state_i_6),
    .io_state_i_7(RhoPiModule_io_state_i_7),
    .io_state_i_8(RhoPiModule_io_state_i_8),
    .io_state_i_9(RhoPiModule_io_state_i_9),
    .io_state_i_10(RhoPiModule_io_state_i_10),
    .io_state_i_11(RhoPiModule_io_state_i_11),
    .io_state_i_12(RhoPiModule_io_state_i_12),
    .io_state_i_13(RhoPiModule_io_state_i_13),
    .io_state_i_14(RhoPiModule_io_state_i_14),
    .io_state_i_15(RhoPiModule_io_state_i_15),
    .io_state_i_16(RhoPiModule_io_state_i_16),
    .io_state_i_17(RhoPiModule_io_state_i_17),
    .io_state_i_18(RhoPiModule_io_state_i_18),
    .io_state_i_19(RhoPiModule_io_state_i_19),
    .io_state_i_20(RhoPiModule_io_state_i_20),
    .io_state_i_21(RhoPiModule_io_state_i_21),
    .io_state_i_22(RhoPiModule_io_state_i_22),
    .io_state_i_23(RhoPiModule_io_state_i_23),
    .io_state_i_24(RhoPiModule_io_state_i_24),
    .io_state_o_0(RhoPiModule_io_state_o_0),
    .io_state_o_1(RhoPiModule_io_state_o_1),
    .io_state_o_2(RhoPiModule_io_state_o_2),
    .io_state_o_3(RhoPiModule_io_state_o_3),
    .io_state_o_4(RhoPiModule_io_state_o_4),
    .io_state_o_5(RhoPiModule_io_state_o_5),
    .io_state_o_6(RhoPiModule_io_state_o_6),
    .io_state_o_7(RhoPiModule_io_state_o_7),
    .io_state_o_8(RhoPiModule_io_state_o_8),
    .io_state_o_9(RhoPiModule_io_state_o_9),
    .io_state_o_10(RhoPiModule_io_state_o_10),
    .io_state_o_11(RhoPiModule_io_state_o_11),
    .io_state_o_12(RhoPiModule_io_state_o_12),
    .io_state_o_13(RhoPiModule_io_state_o_13),
    .io_state_o_14(RhoPiModule_io_state_o_14),
    .io_state_o_15(RhoPiModule_io_state_o_15),
    .io_state_o_16(RhoPiModule_io_state_o_16),
    .io_state_o_17(RhoPiModule_io_state_o_17),
    .io_state_o_18(RhoPiModule_io_state_o_18),
    .io_state_o_19(RhoPiModule_io_state_o_19),
    .io_state_o_20(RhoPiModule_io_state_o_20),
    .io_state_o_21(RhoPiModule_io_state_o_21),
    .io_state_o_22(RhoPiModule_io_state_o_22),
    .io_state_o_23(RhoPiModule_io_state_o_23),
    .io_state_o_24(RhoPiModule_io_state_o_24)
  );
  ChiModule ChiModule ( // @[dpath.scala 36:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126946.4]
    .io_state_i_0(ChiModule_io_state_i_0),
    .io_state_i_1(ChiModule_io_state_i_1),
    .io_state_i_2(ChiModule_io_state_i_2),
    .io_state_i_3(ChiModule_io_state_i_3),
    .io_state_i_4(ChiModule_io_state_i_4),
    .io_state_i_5(ChiModule_io_state_i_5),
    .io_state_i_6(ChiModule_io_state_i_6),
    .io_state_i_7(ChiModule_io_state_i_7),
    .io_state_i_8(ChiModule_io_state_i_8),
    .io_state_i_9(ChiModule_io_state_i_9),
    .io_state_i_10(ChiModule_io_state_i_10),
    .io_state_i_11(ChiModule_io_state_i_11),
    .io_state_i_12(ChiModule_io_state_i_12),
    .io_state_i_13(ChiModule_io_state_i_13),
    .io_state_i_14(ChiModule_io_state_i_14),
    .io_state_i_15(ChiModule_io_state_i_15),
    .io_state_i_16(ChiModule_io_state_i_16),
    .io_state_i_17(ChiModule_io_state_i_17),
    .io_state_i_18(ChiModule_io_state_i_18),
    .io_state_i_19(ChiModule_io_state_i_19),
    .io_state_i_20(ChiModule_io_state_i_20),
    .io_state_i_21(ChiModule_io_state_i_21),
    .io_state_i_22(ChiModule_io_state_i_22),
    .io_state_i_23(ChiModule_io_state_i_23),
    .io_state_i_24(ChiModule_io_state_i_24),
    .io_state_o_0(ChiModule_io_state_o_0),
    .io_state_o_1(ChiModule_io_state_o_1),
    .io_state_o_2(ChiModule_io_state_o_2),
    .io_state_o_3(ChiModule_io_state_o_3),
    .io_state_o_4(ChiModule_io_state_o_4),
    .io_state_o_5(ChiModule_io_state_o_5),
    .io_state_o_6(ChiModule_io_state_o_6),
    .io_state_o_7(ChiModule_io_state_o_7),
    .io_state_o_8(ChiModule_io_state_o_8),
    .io_state_o_9(ChiModule_io_state_o_9),
    .io_state_o_10(ChiModule_io_state_o_10),
    .io_state_o_11(ChiModule_io_state_o_11),
    .io_state_o_12(ChiModule_io_state_o_12),
    .io_state_o_13(ChiModule_io_state_o_13),
    .io_state_o_14(ChiModule_io_state_o_14),
    .io_state_o_15(ChiModule_io_state_o_15),
    .io_state_o_16(ChiModule_io_state_o_16),
    .io_state_o_17(ChiModule_io_state_o_17),
    .io_state_o_18(ChiModule_io_state_o_18),
    .io_state_o_19(ChiModule_io_state_o_19),
    .io_state_o_20(ChiModule_io_state_o_20),
    .io_state_o_21(ChiModule_io_state_o_21),
    .io_state_o_22(ChiModule_io_state_o_22),
    .io_state_o_23(ChiModule_io_state_o_23),
    .io_state_o_24(ChiModule_io_state_o_24)
  );
  IotaModule iota ( // @[dpath.scala 37:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126950.4]
    .io_state_i_0(iota_io_state_i_0),
    .io_state_i_1(iota_io_state_i_1),
    .io_state_i_2(iota_io_state_i_2),
    .io_state_i_3(iota_io_state_i_3),
    .io_state_i_4(iota_io_state_i_4),
    .io_state_i_5(iota_io_state_i_5),
    .io_state_i_6(iota_io_state_i_6),
    .io_state_i_7(iota_io_state_i_7),
    .io_state_i_8(iota_io_state_i_8),
    .io_state_i_9(iota_io_state_i_9),
    .io_state_i_10(iota_io_state_i_10),
    .io_state_i_11(iota_io_state_i_11),
    .io_state_i_12(iota_io_state_i_12),
    .io_state_i_13(iota_io_state_i_13),
    .io_state_i_14(iota_io_state_i_14),
    .io_state_i_15(iota_io_state_i_15),
    .io_state_i_16(iota_io_state_i_16),
    .io_state_i_17(iota_io_state_i_17),
    .io_state_i_18(iota_io_state_i_18),
    .io_state_i_19(iota_io_state_i_19),
    .io_state_i_20(iota_io_state_i_20),
    .io_state_i_21(iota_io_state_i_21),
    .io_state_i_22(iota_io_state_i_22),
    .io_state_i_23(iota_io_state_i_23),
    .io_state_i_24(iota_io_state_i_24),
    .io_state_o_0(iota_io_state_o_0),
    .io_state_o_1(iota_io_state_o_1),
    .io_state_o_2(iota_io_state_o_2),
    .io_state_o_3(iota_io_state_o_3),
    .io_state_o_4(iota_io_state_o_4),
    .io_state_o_5(iota_io_state_o_5),
    .io_state_o_6(iota_io_state_o_6),
    .io_state_o_7(iota_io_state_o_7),
    .io_state_o_8(iota_io_state_o_8),
    .io_state_o_9(iota_io_state_o_9),
    .io_state_o_10(iota_io_state_o_10),
    .io_state_o_11(iota_io_state_o_11),
    .io_state_o_12(iota_io_state_o_12),
    .io_state_o_13(iota_io_state_o_13),
    .io_state_o_14(iota_io_state_o_14),
    .io_state_o_15(iota_io_state_o_15),
    .io_state_o_16(iota_io_state_o_16),
    .io_state_o_17(iota_io_state_o_17),
    .io_state_o_18(iota_io_state_o_18),
    .io_state_o_19(iota_io_state_o_19),
    .io_state_o_20(iota_io_state_o_20),
    .io_state_o_21(iota_io_state_o_21),
    .io_state_o_22(iota_io_state_o_22),
    .io_state_o_23(iota_io_state_o_23),
    .io_state_o_24(iota_io_state_o_24),
    .io_round(iota_io_round)
  );
  assign _GEN_0 = iota_io_state_o_0; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_1 = iota_io_state_o_1; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_2 = iota_io_state_o_2; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_3 = iota_io_state_o_3; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_4 = iota_io_state_o_4; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_5 = iota_io_state_o_5; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_6 = iota_io_state_o_6; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_7 = iota_io_state_o_7; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_8 = iota_io_state_o_8; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_9 = iota_io_state_o_9; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_10 = iota_io_state_o_10; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_11 = iota_io_state_o_11; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_12 = iota_io_state_o_12; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_13 = iota_io_state_o_13; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_14 = iota_io_state_o_14; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_15 = iota_io_state_o_15; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_16 = iota_io_state_o_16; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_17 = iota_io_state_o_17; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_18 = iota_io_state_o_18; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_19 = iota_io_state_o_19; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_20 = iota_io_state_o_20; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_21 = iota_io_state_o_21; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_22 = iota_io_state_o_22; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_23 = iota_io_state_o_23; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _GEN_24 = iota_io_state_o_24; // @[Conditional.scala 40:58:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126990.4]
  assign _T_6 = io_aindex < 5'h11; // @[dpath.scala 108:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127007.6]
  assign _GEN_25 = io_aindex % 5'h5; // @[dpath.scala 109:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127009.8]
  assign _T_7 = _GEN_25[2:0]; // @[dpath.scala 109:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127009.8]
  assign _T_8 = _T_7 * 3'h5; // @[dpath.scala 109:32:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127010.8]
  assign _T_9 = io_aindex / 5'h5; // @[dpath.scala 109:51:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127011.8]
  assign _GEN_200 = {{1'd0}, _T_9}; // @[dpath.scala 109:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127012.8]
  assign _T_11 = _T_8 + _GEN_200; // @[dpath.scala 109:40:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127013.8]
  assign _T_12 = _T_11[4:0]; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127014.8]
  assign _GEN_26 = 5'h1 == _T_12 ? state_1 : state_0; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_27 = 5'h2 == _T_12 ? state_2 : _GEN_26; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_28 = 5'h3 == _T_12 ? state_3 : _GEN_27; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_29 = 5'h4 == _T_12 ? state_4 : _GEN_28; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_30 = 5'h5 == _T_12 ? state_5 : _GEN_29; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_31 = 5'h6 == _T_12 ? state_6 : _GEN_30; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_32 = 5'h7 == _T_12 ? state_7 : _GEN_31; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_33 = 5'h8 == _T_12 ? state_8 : _GEN_32; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_34 = 5'h9 == _T_12 ? state_9 : _GEN_33; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_35 = 5'ha == _T_12 ? state_10 : _GEN_34; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_36 = 5'hb == _T_12 ? state_11 : _GEN_35; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_37 = 5'hc == _T_12 ? state_12 : _GEN_36; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_38 = 5'hd == _T_12 ? state_13 : _GEN_37; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_39 = 5'he == _T_12 ? state_14 : _GEN_38; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_40 = 5'hf == _T_12 ? state_15 : _GEN_39; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_41 = 5'h10 == _T_12 ? state_16 : _GEN_40; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_42 = 5'h11 == _T_12 ? state_17 : _GEN_41; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_43 = 5'h12 == _T_12 ? state_18 : _GEN_42; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_44 = 5'h13 == _T_12 ? state_19 : _GEN_43; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_45 = 5'h14 == _T_12 ? state_20 : _GEN_44; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_46 = 5'h15 == _T_12 ? state_21 : _GEN_45; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_47 = 5'h16 == _T_12 ? state_22 : _GEN_46; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_48 = 5'h17 == _T_12 ? state_23 : _GEN_47; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _GEN_49 = 5'h18 == _T_12 ? state_24 : _GEN_48; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign _T_19 = _GEN_49 ^ io_message_in; // @[dpath.scala 110:64:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127021.8]
  assign io_hash_out_0 = state_0; // @[dpath.scala 116:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127027.4]
  assign io_hash_out_1 = state_5; // @[dpath.scala 116:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127028.4]
  assign io_hash_out_2 = state_10; // @[dpath.scala 116:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127029.4]
  assign io_hash_out_3 = state_15; // @[dpath.scala 116:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127030.4]
  assign ThetaModule_io_state_i_0 = state_0; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_1 = state_1; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_2 = state_2; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_3 = state_3; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_4 = state_4; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_5 = state_5; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_6 = state_6; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_7 = state_7; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_8 = state_8; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_9 = state_9; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_10 = state_10; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_11 = state_11; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_12 = state_12; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_13 = state_13; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_14 = state_14; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_15 = state_15; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_16 = state_16; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_17 = state_17; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_18 = state_18; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_19 = state_19; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_20 = state_20; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_21 = state_21; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_22 = state_22; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_23 = state_23; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign ThetaModule_io_state_i_24 = state_24; // @[dpath.scala 40:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126981.4 dpath.scala 45:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126983.4]
  assign RhoPiModule_io_state_i_0 = ThetaModule_io_state_o_0; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_1 = ThetaModule_io_state_o_1; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_2 = ThetaModule_io_state_o_2; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_3 = ThetaModule_io_state_o_3; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_4 = ThetaModule_io_state_o_4; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_5 = ThetaModule_io_state_o_5; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_6 = ThetaModule_io_state_o_6; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_7 = ThetaModule_io_state_o_7; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_8 = ThetaModule_io_state_o_8; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_9 = ThetaModule_io_state_o_9; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_10 = ThetaModule_io_state_o_10; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_11 = ThetaModule_io_state_o_11; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_12 = ThetaModule_io_state_o_12; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_13 = ThetaModule_io_state_o_13; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_14 = ThetaModule_io_state_o_14; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_15 = ThetaModule_io_state_o_15; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_16 = ThetaModule_io_state_o_16; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_17 = ThetaModule_io_state_o_17; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_18 = ThetaModule_io_state_o_18; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_19 = ThetaModule_io_state_o_19; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_20 = ThetaModule_io_state_o_20; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_21 = ThetaModule_io_state_o_21; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_22 = ThetaModule_io_state_o_22; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_23 = ThetaModule_io_state_o_23; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign RhoPiModule_io_state_i_24 = ThetaModule_io_state_o_24; // @[dpath.scala 46:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126984.4]
  assign ChiModule_io_state_i_0 = RhoPiModule_io_state_o_0; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_1 = RhoPiModule_io_state_o_1; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_2 = RhoPiModule_io_state_o_2; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_3 = RhoPiModule_io_state_o_3; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_4 = RhoPiModule_io_state_o_4; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_5 = RhoPiModule_io_state_o_5; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_6 = RhoPiModule_io_state_o_6; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_7 = RhoPiModule_io_state_o_7; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_8 = RhoPiModule_io_state_o_8; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_9 = RhoPiModule_io_state_o_9; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_10 = RhoPiModule_io_state_o_10; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_11 = RhoPiModule_io_state_o_11; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_12 = RhoPiModule_io_state_o_12; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_13 = RhoPiModule_io_state_o_13; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_14 = RhoPiModule_io_state_o_14; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_15 = RhoPiModule_io_state_o_15; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_16 = RhoPiModule_io_state_o_16; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_17 = RhoPiModule_io_state_o_17; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_18 = RhoPiModule_io_state_o_18; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_19 = RhoPiModule_io_state_o_19; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_20 = RhoPiModule_io_state_o_20; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_21 = RhoPiModule_io_state_o_21; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_22 = RhoPiModule_io_state_o_22; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_23 = RhoPiModule_io_state_o_23; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign ChiModule_io_state_i_24 = RhoPiModule_io_state_o_24; // @[dpath.scala 47:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126985.4]
  assign iota_io_state_i_0 = ChiModule_io_state_o_0; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_1 = ChiModule_io_state_o_1; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_2 = ChiModule_io_state_o_2; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_3 = ChiModule_io_state_o_3; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_4 = ChiModule_io_state_o_4; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_5 = ChiModule_io_state_o_5; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_6 = ChiModule_io_state_o_6; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_7 = ChiModule_io_state_o_7; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_8 = ChiModule_io_state_o_8; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_9 = ChiModule_io_state_o_9; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_10 = ChiModule_io_state_o_10; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_11 = ChiModule_io_state_o_11; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_12 = ChiModule_io_state_o_12; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_13 = ChiModule_io_state_o_13; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_14 = ChiModule_io_state_o_14; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_15 = ChiModule_io_state_o_15; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_16 = ChiModule_io_state_o_16; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_17 = ChiModule_io_state_o_17; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_18 = ChiModule_io_state_o_18; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_19 = ChiModule_io_state_o_19; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_20 = ChiModule_io_state_o_20; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_21 = ChiModule_io_state_o_21; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_22 = ChiModule_io_state_o_22; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_23 = ChiModule_io_state_o_23; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_state_i_24 = ChiModule_io_state_o_24; // @[dpath.scala 48:24:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126986.4]
  assign iota_io_round = io_round; // @[dpath.scala 41:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126982.4 dpath.scala 71:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@126988.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  state_0 = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  state_1 = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  state_2 = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  state_3 = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  state_4 = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  state_5 = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  state_6 = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  state_7 = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {2{`RANDOM}};
  state_8 = _RAND_8[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {2{`RANDOM}};
  state_9 = _RAND_9[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {2{`RANDOM}};
  state_10 = _RAND_10[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {2{`RANDOM}};
  state_11 = _RAND_11[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {2{`RANDOM}};
  state_12 = _RAND_12[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {2{`RANDOM}};
  state_13 = _RAND_13[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {2{`RANDOM}};
  state_14 = _RAND_14[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {2{`RANDOM}};
  state_15 = _RAND_15[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {2{`RANDOM}};
  state_16 = _RAND_16[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {2{`RANDOM}};
  state_17 = _RAND_17[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{`RANDOM}};
  state_18 = _RAND_18[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{`RANDOM}};
  state_19 = _RAND_19[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {2{`RANDOM}};
  state_20 = _RAND_20[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {2{`RANDOM}};
  state_21 = _RAND_21[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {2{`RANDOM}};
  state_22 = _RAND_22[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {2{`RANDOM}};
  state_23 = _RAND_23[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {2{`RANDOM}};
  state_24 = _RAND_24[63:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      state_0 <= 64'h0;
    end else begin
      if (reset) begin
        state_0 <= 64'h0;
      end else begin
        if (io_init) begin
          state_0 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h0 == _T_12) begin
                  state_0 <= _T_19;
                end
              end
            end else begin
              state_0 <= _GEN_0;
            end
          end
        end
      end
    end
    if (reset) begin
      state_1 <= 64'h0;
    end else begin
      if (reset) begin
        state_1 <= 64'h0;
      end else begin
        if (io_init) begin
          state_1 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h1 == _T_12) begin
                  state_1 <= _T_19;
                end
              end
            end else begin
              state_1 <= _GEN_1;
            end
          end
        end
      end
    end
    if (reset) begin
      state_2 <= 64'h0;
    end else begin
      if (reset) begin
        state_2 <= 64'h0;
      end else begin
        if (io_init) begin
          state_2 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h2 == _T_12) begin
                  state_2 <= _T_19;
                end
              end
            end else begin
              state_2 <= _GEN_2;
            end
          end
        end
      end
    end
    if (reset) begin
      state_3 <= 64'h0;
    end else begin
      if (reset) begin
        state_3 <= 64'h0;
      end else begin
        if (io_init) begin
          state_3 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h3 == _T_12) begin
                  state_3 <= _T_19;
                end
              end
            end else begin
              state_3 <= _GEN_3;
            end
          end
        end
      end
    end
    if (reset) begin
      state_4 <= 64'h0;
    end else begin
      if (reset) begin
        state_4 <= 64'h0;
      end else begin
        if (io_init) begin
          state_4 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h4 == _T_12) begin
                  state_4 <= _T_19;
                end
              end
            end else begin
              state_4 <= _GEN_4;
            end
          end
        end
      end
    end
    if (reset) begin
      state_5 <= 64'h0;
    end else begin
      if (reset) begin
        state_5 <= 64'h0;
      end else begin
        if (io_init) begin
          state_5 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h5 == _T_12) begin
                  state_5 <= _T_19;
                end
              end
            end else begin
              state_5 <= _GEN_5;
            end
          end
        end
      end
    end
    if (reset) begin
      state_6 <= 64'h0;
    end else begin
      if (reset) begin
        state_6 <= 64'h0;
      end else begin
        if (io_init) begin
          state_6 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h6 == _T_12) begin
                  state_6 <= _T_19;
                end
              end
            end else begin
              state_6 <= _GEN_6;
            end
          end
        end
      end
    end
    if (reset) begin
      state_7 <= 64'h0;
    end else begin
      if (reset) begin
        state_7 <= 64'h0;
      end else begin
        if (io_init) begin
          state_7 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h7 == _T_12) begin
                  state_7 <= _T_19;
                end
              end
            end else begin
              state_7 <= _GEN_7;
            end
          end
        end
      end
    end
    if (reset) begin
      state_8 <= 64'h0;
    end else begin
      if (reset) begin
        state_8 <= 64'h0;
      end else begin
        if (io_init) begin
          state_8 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h8 == _T_12) begin
                  state_8 <= _T_19;
                end
              end
            end else begin
              state_8 <= _GEN_8;
            end
          end
        end
      end
    end
    if (reset) begin
      state_9 <= 64'h0;
    end else begin
      if (reset) begin
        state_9 <= 64'h0;
      end else begin
        if (io_init) begin
          state_9 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h9 == _T_12) begin
                  state_9 <= _T_19;
                end
              end
            end else begin
              state_9 <= _GEN_9;
            end
          end
        end
      end
    end
    if (reset) begin
      state_10 <= 64'h0;
    end else begin
      if (reset) begin
        state_10 <= 64'h0;
      end else begin
        if (io_init) begin
          state_10 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'ha == _T_12) begin
                  state_10 <= _T_19;
                end
              end
            end else begin
              state_10 <= _GEN_10;
            end
          end
        end
      end
    end
    if (reset) begin
      state_11 <= 64'h0;
    end else begin
      if (reset) begin
        state_11 <= 64'h0;
      end else begin
        if (io_init) begin
          state_11 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'hb == _T_12) begin
                  state_11 <= _T_19;
                end
              end
            end else begin
              state_11 <= _GEN_11;
            end
          end
        end
      end
    end
    if (reset) begin
      state_12 <= 64'h0;
    end else begin
      if (reset) begin
        state_12 <= 64'h0;
      end else begin
        if (io_init) begin
          state_12 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'hc == _T_12) begin
                  state_12 <= _T_19;
                end
              end
            end else begin
              state_12 <= _GEN_12;
            end
          end
        end
      end
    end
    if (reset) begin
      state_13 <= 64'h0;
    end else begin
      if (reset) begin
        state_13 <= 64'h0;
      end else begin
        if (io_init) begin
          state_13 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'hd == _T_12) begin
                  state_13 <= _T_19;
                end
              end
            end else begin
              state_13 <= _GEN_13;
            end
          end
        end
      end
    end
    if (reset) begin
      state_14 <= 64'h0;
    end else begin
      if (reset) begin
        state_14 <= 64'h0;
      end else begin
        if (io_init) begin
          state_14 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'he == _T_12) begin
                  state_14 <= _T_19;
                end
              end
            end else begin
              state_14 <= _GEN_14;
            end
          end
        end
      end
    end
    if (reset) begin
      state_15 <= 64'h0;
    end else begin
      if (reset) begin
        state_15 <= 64'h0;
      end else begin
        if (io_init) begin
          state_15 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'hf == _T_12) begin
                  state_15 <= _T_19;
                end
              end
            end else begin
              state_15 <= _GEN_15;
            end
          end
        end
      end
    end
    if (reset) begin
      state_16 <= 64'h0;
    end else begin
      if (reset) begin
        state_16 <= 64'h0;
      end else begin
        if (io_init) begin
          state_16 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h10 == _T_12) begin
                  state_16 <= _T_19;
                end
              end
            end else begin
              state_16 <= _GEN_16;
            end
          end
        end
      end
    end
    if (reset) begin
      state_17 <= 64'h0;
    end else begin
      if (reset) begin
        state_17 <= 64'h0;
      end else begin
        if (io_init) begin
          state_17 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h11 == _T_12) begin
                  state_17 <= _T_19;
                end
              end
            end else begin
              state_17 <= _GEN_17;
            end
          end
        end
      end
    end
    if (reset) begin
      state_18 <= 64'h0;
    end else begin
      if (reset) begin
        state_18 <= 64'h0;
      end else begin
        if (io_init) begin
          state_18 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h12 == _T_12) begin
                  state_18 <= _T_19;
                end
              end
            end else begin
              state_18 <= _GEN_18;
            end
          end
        end
      end
    end
    if (reset) begin
      state_19 <= 64'h0;
    end else begin
      if (reset) begin
        state_19 <= 64'h0;
      end else begin
        if (io_init) begin
          state_19 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h13 == _T_12) begin
                  state_19 <= _T_19;
                end
              end
            end else begin
              state_19 <= _GEN_19;
            end
          end
        end
      end
    end
    if (reset) begin
      state_20 <= 64'h0;
    end else begin
      if (reset) begin
        state_20 <= 64'h0;
      end else begin
        if (io_init) begin
          state_20 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h14 == _T_12) begin
                  state_20 <= _T_19;
                end
              end
            end else begin
              state_20 <= _GEN_20;
            end
          end
        end
      end
    end
    if (reset) begin
      state_21 <= 64'h0;
    end else begin
      if (reset) begin
        state_21 <= 64'h0;
      end else begin
        if (io_init) begin
          state_21 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h15 == _T_12) begin
                  state_21 <= _T_19;
                end
              end
            end else begin
              state_21 <= _GEN_21;
            end
          end
        end
      end
    end
    if (reset) begin
      state_22 <= 64'h0;
    end else begin
      if (reset) begin
        state_22 <= 64'h0;
      end else begin
        if (io_init) begin
          state_22 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h16 == _T_12) begin
                  state_22 <= _T_19;
                end
              end
            end else begin
              state_22 <= _GEN_22;
            end
          end
        end
      end
    end
    if (reset) begin
      state_23 <= 64'h0;
    end else begin
      if (reset) begin
        state_23 <= 64'h0;
      end else begin
        if (io_init) begin
          state_23 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h17 == _T_12) begin
                  state_23 <= _T_19;
                end
              end
            end else begin
              state_23 <= _GEN_23;
            end
          end
        end
      end
    end
    if (reset) begin
      state_24 <= 64'h0;
    end else begin
      if (reset) begin
        state_24 <= 64'h0;
      end else begin
        if (io_init) begin
          state_24 <= 64'h0;
        end else begin
          if (!(io_write)) begin
            if (io_absorb) begin
              if (_T_6) begin
                if (5'h18 == _T_12) begin
                  state_24 <= _T_19;
                end
              end
            end else begin
              state_24 <= _GEN_24;
            end
          end
        end
      end
    end
  end
endmodule
module Sha3BlackBox( // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127096.2]
  input         clock, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127097.4]
  input         reset, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127098.4]
  output        io_cmd_ready, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [6:0]  io_cmd_bits_inst_funct, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [4:0]  io_cmd_bits_inst_rs2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [4:0]  io_cmd_bits_inst_rs1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_inst_xd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_inst_xs1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_inst_xs2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [4:0]  io_cmd_bits_inst_rd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [6:0]  io_cmd_bits_inst_opcode, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_cmd_bits_rs1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_cmd_bits_rs2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_debug, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_cease, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [31:0] io_cmd_bits_status_isa, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_dprv, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_prv, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_sd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [26:0] io_cmd_bits_status_zero2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_sxl, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_uxl, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_sd_rv32, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [7:0]  io_cmd_bits_status_zero1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_tsr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_tw, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_tvm, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_mxr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_sum, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_mprv, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_xs, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_fs, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_mpp, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_cmd_bits_status_hpp, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_spp, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_mpie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_hpie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_spie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_upie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_mie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_hie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_sie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_cmd_bits_status_uie, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_resp_ready, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_resp_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [4:0]  io_resp_bits_rd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [63:0] io_resp_bits_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_req_ready, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_req_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [39:0] io_mem_req_bits_addr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [7:0]  io_mem_req_bits_tag, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [4:0]  io_mem_req_bits_cmd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [1:0]  io_mem_req_bits_size, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_req_bits_signed, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_req_bits_phys, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_req_bits_no_alloc, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_req_bits_no_xcpt, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [63:0] io_mem_req_bits_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [7:0]  io_mem_req_bits_mask, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_s1_kill, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [63:0] io_mem_s1_data_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [7:0]  io_mem_s1_data_mask, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_nack, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_nack_cause_raw, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_s2_kill, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_uncached, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [31:0] io_mem_s2_paddr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_resp_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [39:0] io_mem_resp_bits_addr, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [7:0]  io_mem_resp_bits_tag, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [4:0]  io_mem_resp_bits_cmd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [1:0]  io_mem_resp_bits_size, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_resp_bits_signed, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_mem_resp_bits_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [7:0]  io_mem_resp_bits_mask, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_resp_bits_replay, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_resp_bits_has_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_mem_resp_bits_data_word_bypass, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_mem_resp_bits_data_raw, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [63:0] io_mem_resp_bits_store_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_replay_next, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_ma_ld, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_ma_st, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_pf_ld, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_pf_st, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_ae_ld, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_s2_xcpt_ae_st, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_ordered, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_acquire, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_release, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_grant, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_tlbMiss, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_blocked, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_canAcceptStoreThenLoad, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_canAcceptStoreThenRMW, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_canAcceptLoadThenLoad, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_storeBufferEmptyAfterLoad, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_perf_storeBufferEmptyAfterStore, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_mem_keep_clock_enabled, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_mem_clock_enabled, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_busy, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_interrupt, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_exception, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_fpu_req_ready, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_ldst, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_wen, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_ren1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_ren2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_ren3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_swap12, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_swap23, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_singleIn, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_singleOut, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_fromint, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_toint, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_fastpipe, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_fma, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_div, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_sqrt, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_req_bits_wflags, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [2:0]  io_fpu_req_bits_rm, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [1:0]  io_fpu_req_bits_fmaCmd, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [1:0]  io_fpu_req_bits_typ, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [64:0] io_fpu_req_bits_in1, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [64:0] io_fpu_req_bits_in2, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output [64:0] io_fpu_req_bits_in3, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  output        io_fpu_resp_ready, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input         io_fpu_resp_valid, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [64:0] io_fpu_resp_bits_data, // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
  input  [4:0]  io_fpu_resp_bits_exc // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127100.4]
);
  wire  CtrlModule_clock; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_reset; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_rocc_req_val; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_rocc_req_rdy; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [1:0] CtrlModule_io_rocc_funct; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [63:0] CtrlModule_io_rocc_rs1; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [63:0] CtrlModule_io_rocc_rs2; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_busy; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_dmem_req_val; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_dmem_req_rdy; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [5:0] CtrlModule_io_dmem_req_tag; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [39:0] CtrlModule_io_dmem_req_addr; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [4:0] CtrlModule_io_dmem_req_cmd; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_dmem_resp_val; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [6:0] CtrlModule_io_dmem_resp_tag; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [63:0] CtrlModule_io_dmem_resp_data; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [4:0] CtrlModule_io_round; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_absorb; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [4:0] CtrlModule_io_aindex; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_init; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  CtrlModule_io_write; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [2:0] CtrlModule_io_windex; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire [63:0] CtrlModule_io_buffer_out; // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
  wire  DpathModule_clock; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire  DpathModule_reset; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire  DpathModule_io_absorb; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire  DpathModule_io_init; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire  DpathModule_io_write; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [4:0] DpathModule_io_round; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [4:0] DpathModule_io_aindex; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [63:0] DpathModule_io_message_in; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [63:0] DpathModule_io_hash_out_0; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [63:0] DpathModule_io_hash_out_1; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [63:0] DpathModule_io_hash_out_2; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [63:0] DpathModule_io_hash_out_3; // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
  wire [1:0] _T_1; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127137.4]
  wire [63:0] _GEN_0; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  wire [63:0] _GEN_1; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  wire [63:0] _GEN_2; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  CtrlModule CtrlModule ( // @[sha3.scala 107:22:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127107.4]
    .clock(CtrlModule_clock),
    .reset(CtrlModule_reset),
    .io_rocc_req_val(CtrlModule_io_rocc_req_val),
    .io_rocc_req_rdy(CtrlModule_io_rocc_req_rdy),
    .io_rocc_funct(CtrlModule_io_rocc_funct),
    .io_rocc_rs1(CtrlModule_io_rocc_rs1),
    .io_rocc_rs2(CtrlModule_io_rocc_rs2),
    .io_busy(CtrlModule_io_busy),
    .io_dmem_req_val(CtrlModule_io_dmem_req_val),
    .io_dmem_req_rdy(CtrlModule_io_dmem_req_rdy),
    .io_dmem_req_tag(CtrlModule_io_dmem_req_tag),
    .io_dmem_req_addr(CtrlModule_io_dmem_req_addr),
    .io_dmem_req_cmd(CtrlModule_io_dmem_req_cmd),
    .io_dmem_resp_val(CtrlModule_io_dmem_resp_val),
    .io_dmem_resp_tag(CtrlModule_io_dmem_resp_tag),
    .io_dmem_resp_data(CtrlModule_io_dmem_resp_data),
    .io_round(CtrlModule_io_round),
    .io_absorb(CtrlModule_io_absorb),
    .io_aindex(CtrlModule_io_aindex),
    .io_init(CtrlModule_io_init),
    .io_write(CtrlModule_io_write),
    .io_windex(CtrlModule_io_windex),
    .io_buffer_out(CtrlModule_io_buffer_out)
  );
  DpathModule DpathModule ( // @[sha3.scala 148:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127132.4]
    .clock(DpathModule_clock),
    .reset(DpathModule_reset),
    .io_absorb(DpathModule_io_absorb),
    .io_init(DpathModule_io_init),
    .io_write(DpathModule_io_write),
    .io_round(DpathModule_io_round),
    .io_aindex(DpathModule_io_aindex),
    .io_message_in(DpathModule_io_message_in),
    .io_hash_out_0(DpathModule_io_hash_out_0),
    .io_hash_out_1(DpathModule_io_hash_out_1),
    .io_hash_out_2(DpathModule_io_hash_out_2),
    .io_hash_out_3(DpathModule_io_hash_out_3)
  );
  assign _T_1 = CtrlModule_io_windex[1:0]; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127137.4]
  assign _GEN_0 = DpathModule_io_hash_out_0; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  assign _GEN_1 = 2'h1 == _T_1 ? DpathModule_io_hash_out_1 : _GEN_0; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  assign _GEN_2 = 2'h2 == _T_1 ? DpathModule_io_hash_out_2 : _GEN_1; // @[sha3.scala 151:15:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127138.4]
  assign io_cmd_ready = CtrlModule_io_rocc_req_rdy; // @[sha3.scala 110:18:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127112.4]
  assign io_resp_valid = 1'h0; // @[sha3.scala 94:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127106.4]
  assign io_resp_bits_rd = 5'h0;
  assign io_resp_bits_data = 64'h0;
  assign io_mem_req_valid = CtrlModule_io_dmem_req_val; // @[sha3.scala 119:17:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127120.4]
  assign io_mem_req_bits_addr = CtrlModule_io_dmem_req_addr; // @[sha3.scala 122:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127123.4]
  assign io_mem_req_bits_tag = {{2'd0}, CtrlModule_io_dmem_req_tag}; // @[sha3.scala 121:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127122.4]
  assign io_mem_req_bits_cmd = CtrlModule_io_dmem_req_cmd; // @[sha3.scala 123:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127124.4]
  assign io_mem_req_bits_size = 2'h3; // @[sha3.scala 124:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127125.4]
  assign io_mem_req_bits_signed = 1'h0; // @[sha3.scala 126:23:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127127.4]
  assign io_mem_req_bits_phys = 1'h0; // @[sha3.scala 127:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127128.4]
  assign io_mem_req_bits_no_alloc = 1'h0;
  assign io_mem_req_bits_no_xcpt = 1'h0;
  assign io_mem_req_bits_data = 2'h3 == _T_1 ? DpathModule_io_hash_out_3 : _GEN_2; // @[sha3.scala 125:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127126.4]
  assign io_mem_req_bits_mask = 8'h0;
  assign io_mem_s1_kill = 1'h0;
  assign io_mem_s1_data_data = 64'h0;
  assign io_mem_s1_data_mask = 8'h0;
  assign io_mem_s2_kill = 1'h0;
  assign io_mem_keep_clock_enabled = 1'h0;
  assign io_busy = CtrlModule_io_busy; // @[sha3.scala 115:13:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127117.4]
  assign io_interrupt = 1'h0;
  assign io_fpu_req_valid = 1'h0;
  assign io_fpu_req_bits_ldst = 1'h0;
  assign io_fpu_req_bits_wen = 1'h0;
  assign io_fpu_req_bits_ren1 = 1'h0;
  assign io_fpu_req_bits_ren2 = 1'h0;
  assign io_fpu_req_bits_ren3 = 1'h0;
  assign io_fpu_req_bits_swap12 = 1'h0;
  assign io_fpu_req_bits_swap23 = 1'h0;
  assign io_fpu_req_bits_singleIn = 1'h0;
  assign io_fpu_req_bits_singleOut = 1'h0;
  assign io_fpu_req_bits_fromint = 1'h0;
  assign io_fpu_req_bits_toint = 1'h0;
  assign io_fpu_req_bits_fastpipe = 1'h0;
  assign io_fpu_req_bits_fma = 1'h0;
  assign io_fpu_req_bits_div = 1'h0;
  assign io_fpu_req_bits_sqrt = 1'h0;
  assign io_fpu_req_bits_wflags = 1'h0;
  assign io_fpu_req_bits_rm = 3'h0;
  assign io_fpu_req_bits_fmaCmd = 2'h0;
  assign io_fpu_req_bits_typ = 2'h0;
  assign io_fpu_req_bits_in1 = 65'h0;
  assign io_fpu_req_bits_in2 = 65'h0;
  assign io_fpu_req_bits_in3 = 65'h0;
  assign io_fpu_resp_ready = 1'h0;
  assign CtrlModule_clock = clock; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127109.4]
  assign CtrlModule_reset = reset; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127110.4]
  assign CtrlModule_io_rocc_req_val = io_cmd_valid; // @[sha3.scala 109:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127111.4]
  assign CtrlModule_io_rocc_funct = io_cmd_bits_inst_funct[1:0]; // @[sha3.scala 111:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127113.4]
  assign CtrlModule_io_rocc_rs1 = io_cmd_bits_rs1; // @[sha3.scala 112:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127114.4]
  assign CtrlModule_io_rocc_rs2 = io_cmd_bits_rs2; // @[sha3.scala 113:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127115.4]
  assign CtrlModule_io_dmem_req_rdy = io_mem_req_ready; // @[sha3.scala 120:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127121.4]
  assign CtrlModule_io_dmem_resp_val = io_mem_resp_valid; // @[sha3.scala 144:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127129.4]
  assign CtrlModule_io_dmem_resp_tag = io_mem_resp_bits_tag[6:0]; // @[sha3.scala 145:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127130.4]
  assign CtrlModule_io_dmem_resp_data = io_mem_resp_bits_data; // @[sha3.scala 146:28:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127131.4]
  assign DpathModule_clock = clock; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127134.4]
  assign DpathModule_reset = reset; // @[:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127135.4]
  assign DpathModule_io_absorb = CtrlModule_io_absorb; // @[sha3.scala 154:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127139.4]
  assign DpathModule_io_init = CtrlModule_io_init; // @[sha3.scala 155:19:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127140.4]
  assign DpathModule_io_write = CtrlModule_io_write; // @[sha3.scala 156:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127141.4]
  assign DpathModule_io_round = CtrlModule_io_round; // @[sha3.scala 157:20:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127142.4]
  assign DpathModule_io_aindex = CtrlModule_io_aindex; // @[sha3.scala 159:21:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127144.4]
  assign DpathModule_io_message_in = CtrlModule_io_buffer_out; // @[sha3.scala 150:25:chipyard.TestHarness.TutorialSha3BlackBoxConfig.fir@127136.4]
endmodule
