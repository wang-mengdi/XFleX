import os
import sys
import platform

if __name__=='__main__':
    proj_name="flex-demo"
    if len(sys.argv)==2:
        proj_name=sys.argv[1]
    bin_dir=os.path.join('..','bin')
    build_dir=os.path.join('..','build')
    lua_file=os.path.join('demo','xmake.lua')
    proj_dir=os.path.join('demo')
    clean_cmd="xmake c -P {} -a".format(proj_dir)
    config_cmd="xmake f -o {} -P {} -y".format(bin_dir, proj_dir)
    project_cmd="xmake project -k vsxmake -v -a \"x64\" -P {} {}".format(proj_dir, build_dir)
    print(clean_cmd)
    os.system(clean_cmd)
    print(config_cmd)
    os.system(config_cmd)
    print(project_cmd)
    os.system(project_cmd)