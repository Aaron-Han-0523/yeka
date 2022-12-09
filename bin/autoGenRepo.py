import sys
import os

print("example)")
print("python autoGenRepo.py repo.dart consulting")
# print("                  ref file     res file")

ref_file   = sys.argv[1]
res_file   = sys.argv[2]

# ref_str    = ref_file.split(".")[0]
ref_str    = "auto"
res_str    = res_file

ref_lower  = ref_str.lower()
ref_capital  = ref_str.capitalize()
ref_upper  = ref_str.upper()
res_lower  = res_str.lower()
res_capital  = res_str.capitalize()
res_upper  = res_str.upper()

output_path = "repository/" + res_file + "_repo.dart"
os.makedirs("repository", exist_ok=True)

f = open(ref_file, 'r')
f2 = open(output_path, 'w')

data = f.read()
f2.write(data.replace(ref_lower, res_lower).replace(ref_capital, res_capital).replace(ref_upper, res_upper))

output_path = "repository/app_constant.dart"
f3 = open(output_path, 'a')
f3.write("// "+res_upper+" \n")
f3.write("static const String ADD_" + res_upper + "_URI =\"\";\n")
f3.write("static const String UPDATE_"+res_upper+"_URI =\"\";\n")
f3.write("static const String DELETE_"+res_upper+"_URI =\"\";\n")
f3.write("static const String LIST_"+res_upper+"_URI =\"\";\n")
f3.write("static const String GET_"+res_upper+"_URI =\"\";\n\n")

f3. close()
f2. close()
f.close()
