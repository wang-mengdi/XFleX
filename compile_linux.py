import os
import sys
import platform

if __name__=='__main__':
    proj_name="flex-demo"
    bin_dir=os.path.join('..','bin')
    build_dir=os.path.join('..','build')
    lua_file=os.path.join('demo','xmake.lua')
    proj_dir=os.path.join('demo')
    clean_cmd="xmake c -P {} -a".format(proj_dir)
    config_cmd="xmake f -o {} -P {} -y".format(bin_dir, proj_dir)
    compile_cmd="xmake build -v -P {} {}".format(proj_dir,proj_name)
    print(clean_cmd)
    os.system(clean_cmd)
    print(config_cmd)
    os.system(config_cmd)
    print(compile_cmd)
    os.system(compile_cmd)
