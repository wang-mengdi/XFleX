import os
import sys
import platform

if __name__=='__main__':
    compile_cmd="xmake build -P ./demo flex-demo"
    print(compile_cmd)
    os.system(compile_cmd)