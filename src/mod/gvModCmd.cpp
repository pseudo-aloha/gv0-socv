#ifndef GV_MOD_CMD_C
#define GV_MOD_CMD_C

#include "gvMsg.h"
#include "gvModMgr.h"
#include "gvModCmd.h"
#include "gvAbcMgr.h"
#include "kernel/yosys.h"
#include <string>
#include <vector>
#include "util.h"

bool 
GVinitModCmd() {
    if (gvModMgr) delete gvModMgr;
    gvModMgr = new GVModMgr;
    return (
         gvCmdMgr->regCmd("SEt SYStem",   2, 3,   new GVSetSystemCmd ) &&
         gvCmdMgr->regCmd("RESET SYStem", 5, 3,   new GVResetCmd )
    );
}

GVCmdExecStatus
GVSetSystemCmd ::exec(const string& option) {
    if(!gvModMgr->getInputFileExist()){
        gvMsg(GV_MSG_IFO) << "[ERROR]: Please use command \"READ DESIGN\" to read the input file first !!\n";
        return GV_CMD_EXEC_NOP;
    }
    bool setup = false, vrf = false;
    string systemPromptStr;
    vector<string> options;
    GVCmdExec::lexOptions(option, options);
    if (options.size() == 0) return GVCmdExec::errorOption(GV_CMD_OPT_MISSING, "<(string mode)>");
    size_t n = options.size();
    for (size_t i = 0; i < n; ++i) {
        const string& token = options[i];
        if (myStrNCmp("setup", token, 3) == 0) {
            if (vrf) return GVCmdExec::errorOption(GV_CMD_OPT_EXTRA, token);
            else {setup = true;}
        }
        else if (myStrNCmp("vrf", token, 3) == 0) {
            if (setup) return GVCmdExec::errorOption(GV_CMD_OPT_EXTRA, token);
            else {vrf = true;}
        }
        else return GVCmdExec::errorOption(GV_CMD_OPT_ILLEGAL, token);
    }
    if(setup)
        gvModMgr->setGVMode(GV_MOD_TYPE_SETUP);
    else if(vrf)
        gvModMgr->setGVMode(GV_MOD_TYPE_VERIFY);

    return GV_CMD_EXEC_DONE;
}

void
GVSetSystemCmd ::usage(const bool& verbose) const {
    gvMsg(GV_MSG_IFO) << "Usage: SEt SYStem <setup | vrf>" << endl;
}

void
GVSetSystemCmd ::help() const {
    gvMsg(GV_MSG_IFO) << setw(20) << left << "SEt System: " << "Switch to setup/vrf mode." << endl;
}

GVCmdExecStatus
GVResetCmd ::exec(const string& option) {

    bool delete_abc = true;
    bool delete_yosys = true;

    vector<string> options;
    GVCmdExec::lexOptions(option, options);
    if (options.size() > 1) return GVCmdExec::errorOption(GV_CMD_OPT_EXTRA, options[1]);
    if (options.size() == 1) {
        const string& token = options[0];
        if (myStrNCmp("abc", token, 1) == 0) {
            delete_yosys = false;
        }
        else if (myStrNCmp("yosys", token, 1) == 0) {
            delete_abc = false;
        }
        else {
            return GVCmdExec::errorOption(GV_CMD_OPT_ILLEGAL, token);
        }
    }

    if (delete_abc) {
        Cmd_CommandExecute(abcMgr->get_Abc_Frame_t(), "empty");
        if (abcMgr) delete abcMgr;
        abcMgr = new AbcMgr;
    }

    if (delete_yosys) {
        Yosys::run_pass("delete");
    }

    myUsage.reset();
    if (gvModMgr) delete gvModMgr;
    gvModMgr = new GVModMgr;

    return GV_CMD_EXEC_DONE;
}

void
GVResetCmd ::usage(const bool& verbose) const {
    gvMsg(GV_MSG_IFO) << "Usage: RESET SYStem [ -Abc | -Yosys ]" << endl;
    gvMsg(GV_MSG_IFO) << "       If engine is specified, only delete the ntk stored inside. However, it may be risky to only delete partial datas." << endl;
}

void
GVResetCmd ::help() const {
    gvMsg(GV_MSG_IFO) << setw(20) << left << "RESET SYStem: " << "Delete all ntks in gv and reset to setup mode." << endl;
}

#endif
