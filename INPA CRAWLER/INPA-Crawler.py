
import os
from subprocess import PIPE, Popen

XTRACT_PATH = "C:/EDIABAS/Bin"
ECU_PATH = "C:/EDIABAS/Ecu"


def Crawl_ECU(keyword):
    list = []
    for _, _, files in os.walk(ECU_PATH):
        #os.path.join(subdir, file)
        for name in files: 
            if name.upper().endswith(".PRG"):
                name = os.path.join(ECU_PATH, name)
                print(name)
                process = Popen(["xtract.exe", name, "-Q"], cwd=XTRACT_PATH, stdout=PIPE, stderr=PIPE, text=True)
                try:
                    result, _ = process.communicate()
                except:
                    print("error")
    return list

print(Crawl_ECU("ME9.2/N42"))