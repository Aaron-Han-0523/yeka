import sys
import os
import re

def camel_case_upper(s):
    s = re.sub(r"[-_ ]+","",re.sub(r'([A-Z])([a-z])',r"_\1\2",s).title())
    if s == "": return ""
    return s[0].upper() + s[1:]

def camel_case_lower(s):
    s = re.sub(r"[-_ ]+","",re.sub(r'([A-Z])([a-z])',r"_\1\2",s).title())
    if s == "": return ""
    return s[0].lower() + s[1:]

def camel_to_snake(name):
    name = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', name).lower()

print("")
print("==============example==============")
print("$ python3 autoGenProvider.py auto_provider.dart")
print("")
print("input : table/Product")
print("input : table/Community")
print("input : table/Order")
print("")
print("output : provider/product_repo.dart")
print("output : provider/community_repo.dart")
print("output : provider/order_repo.dart")
print("===================================")
print("")

if len(sys.argv) < 2:
    exit(0)

path = "./table"
file_list = os.listdir(path)

for res_file in file_list:
    ref_file   = sys.argv[1]

    ref_str    = "auto"
    res_str    = res_file

    ref_lower  = ref_str.lower()
    ref_upper  = ref_str.upper()
    ref_snake  = camel_to_snake(camel_case_lower(ref_str))
    ref_camel_lower  = camel_case_lower(ref_snake)
    ref_camel_upper  = camel_case_upper(ref_snake)
    res_lower  = res_str.lower()
    res_upper  = res_str.upper()
    res_snake  = camel_to_snake(camel_case_lower(res_str))
    res_camel_lower  = camel_case_lower(res_snake)
    res_camel_upper  = camel_case_upper(res_snake)

    output_path = "provider/" + res_snake + "_provider.dart"
    os.makedirs("provider", exist_ok=True)

    f = open(ref_file, 'r')
    f2 = open(output_path, 'w')

    data = f.read()
    f2.write(data.replace(ref_camel_lower, res_camel_lower).replace(ref_camel_upper, res_camel_upper).replace(res_camel_lower + "_model.dart", res_snake + "_model.dart").replace(res_camel_lower + "_repo.dart", res_snake + "_repo.dart"))

    f2. close()
    f.close()
