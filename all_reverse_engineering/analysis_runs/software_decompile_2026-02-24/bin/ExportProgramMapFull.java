import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileOptions;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.AddressSetView;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.Listing;
import ghidra.program.model.symbol.RefType;
import ghidra.program.model.symbol.Reference;

public class ExportProgramMapFull extends GhidraScript {
    @Override
    protected void run() throws Exception {
        String outDirArg = getScriptArgs().length > 0 ? getScriptArgs()[0] : "/tmp";
        int maxFns = getScriptArgs().length > 1 ? Integer.parseInt(getScriptArgs()[1]) : 0; // 0 => all
        int timeoutSec = getScriptArgs().length > 2 ? Integer.parseInt(getScriptArgs()[2]) : 30;

        File outDir = new File(outDirArg);
        outDir.mkdirs();

        String progName = currentProgram.getName();
        String safeName = progName.replaceAll("[^A-Za-z0-9._-]", "_");

        File fnCsv = new File(outDir, safeName + "_functions_full.csv");
        File xrefCsv = new File(outDir, safeName + "_calls_full.csv");
        File decTxt = new File(outDir, safeName + "_decomp_full.txt");

        FunctionIterator it = currentProgram.getFunctionManager().getFunctions(true);
        List<Function> funcs = new ArrayList<>();
        while (it.hasNext()) {
            funcs.add(it.next());
        }
        Collections.sort(funcs, Comparator.comparing(f -> f.getEntryPoint().toString()));

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(fnCsv))) {
            bw.write("entry,name,namespace,body_addresses,parameter_count,return_type\n");
            for (Function f : funcs) {
                String ns = f.getParentNamespace() == null ? "" : f.getParentNamespace().getName();
                long bodyCount = f.getBody().getNumAddresses();
                int pcount = f.getParameterCount();
                String rtype = f.getReturnType() == null ? "" : f.getReturnType().toString();
                bw.write(String.format("%s,%s,%s,%d,%d,%s\n",
                    f.getEntryPoint(), csv(f.getName()), csv(ns), bodyCount, pcount, csv(rtype)));
            }
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(xrefCsv))) {
            bw.write("from,to,type\n");
            Listing listing = currentProgram.getListing();
            for (Function f : funcs) {
                AddressSetView body = f.getBody();
                Iterator<Instruction> iit = listing.getInstructions(body, true);
                while (iit.hasNext()) {
                    Instruction ins = iit.next();
                    Reference[] refs = ins.getReferencesFrom();
                    for (Reference r : refs) {
                        RefType t = r.getReferenceType();
                        if (t != null && (t.isCall() || t.isJump())) {
                            bw.write(String.format("%s,%s,%s\n", ins.getAddress(), r.getToAddress(), csv(t.getName())));
                        }
                    }
                }
            }
        }

        DecompInterface ifc = new DecompInterface();
        DecompileOptions opts = new DecompileOptions();
        ifc.setOptions(opts);
        ifc.openProgram(currentProgram);

        int limit = maxFns <= 0 ? funcs.size() : Math.min(maxFns, funcs.size());
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(decTxt))) {
            bw.write("Program: " + progName + "\n");
            bw.write("Language: " + currentProgram.getLanguageID() + "\n");
            bw.write("CompilerSpec: " + currentProgram.getCompilerSpec().getCompilerSpecID() + "\n");
            bw.write("FunctionCount: " + funcs.size() + "\n");
            bw.write("DecompileCount: " + limit + "\n\n");

            for (int i = 0; i < limit; i++) {
                Function f = funcs.get(i);
                bw.write("===== " + f.getName() + " @ " + f.getEntryPoint() + " size=" + f.getBody().getNumAddresses() + " =====\n");
                try {
                    DecompileResults res = ifc.decompileFunction(f, timeoutSec, monitor);
                    if (res != null && res.decompileCompleted() && res.getDecompiledFunction() != null) {
                        bw.write(res.getDecompiledFunction().getC());
                    } else {
                        bw.write("<decompile_failed>\n");
                    }
                } catch (Exception ex) {
                    bw.write("<decompile_exception> " + ex + "\n");
                }
                bw.write("\n\n");
                if (monitor.isCancelled()) {
                    break;
                }
            }
        }

        println("Export complete: " + fnCsv.getAbsolutePath());
        println("Export complete: " + xrefCsv.getAbsolutePath());
        println("Export complete: " + decTxt.getAbsolutePath());
    }

    private String csv(String s) {
        if (s == null) return "";
        String v = s.replace("\"", "\"\"");
        return "\"" + v + "\"";
    }
}
