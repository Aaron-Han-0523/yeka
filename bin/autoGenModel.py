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
print("$ python3 autoGen.py")
print("")
print("input : table/Product")
print("input : table/Community")
print("input : table/Order")
print("")
print("output : model/product_model.dart")
print("output : model/community_model.dart")
print("output : model/order_model.dart")
print("===================================")
print("")

if len(sys.argv) > 1:
    exit(0)

path = "./table"
file_list = os.listdir(path)

for ref_file in file_list:
    print(ref_file)
    ref_str = ref_file

    ref_lower  = ref_str.lower()
    ref_upper  = ref_str.upper()
    ref_snake  = camel_to_snake(camel_case_lower(ref_str))
    ref_camel_lower  = camel_case_lower(ref_snake)
    ref_camel_upper  = camel_case_upper(ref_snake)

    output_path = "model/" + ref_snake + "_model.dart"
    os.makedirs("model", exist_ok=True)

    f = open(path + "/" + ref_file, 'r')
    f2 = open(output_path, 'w')

    # data = f.read()
    f2.write("class " + ref_camel_upper + "Model {\n")

    lines = f.readlines()
    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write("{0} _{1};\n".format(data_type, data_name))

    f2.write(ref_camel_upper + "Model({\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write(data_type + " " + data_name + ",\n")

    f2.write("}) {\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write("this._" + data_name + " = " + data_name + ";\n")

    f2.write("}\n")

    f2.write(ref_file + "Model.fromJson(Map<String, dynamic> json) {\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write("_" + data_name + " = json['" + data_name + "'];\n")

    f2.write("}\n")

    f2.write("Map<String, dynamic> toJson() {\n")

    f2.write("final Map<String, dynamic> data = new Map<String, dynamic>();\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write("data['" + data_name + "'] = this." + data_name + ";\n")

    f2.write("return data;\n")

    f2.write("}\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write(data_type + " get " + data_name + " => " + "_" + data_name + ";\n")

    for line in lines:
        data_type = line.split(" ")[0]
        data_name = line.split(" ")[1].replace("\n", "")
        f2.write("set " + data_name + "(" + data_type + " value) { \n")
        f2.write("_" + data_name + " = value;\n")
        f2.write("}\n")

    f2.write("}\n\n")

    f2.write("class "+ref_camel_upper+"List {\n")
    f2.write("  int _count;\n")
    f2.write("  List<"+ref_camel_upper+"Model> _"+ref_camel_lower+"List;\n")
    f2.write("  "+ref_camel_upper+"List({int count, List<"+ref_camel_upper+"Model> "+ref_camel_lower+"List}) {\n")
    f2.write("    this._count = count;\n")
    f2.write("    this._"+ref_camel_lower+"List = "+ref_camel_lower+"List;\n")
    f2.write("  }\n")
    f2.write("  int get count => _count;\n")
    f2.write("  List<"+ref_camel_upper+"Model> get "+ref_camel_lower+"List => _"+ref_camel_lower+"List;\n")
    f2.write("  "+ref_camel_upper+"List.fromJson(Map<String, dynamic> json) {\n")
    f2.write("    _count = json['count'];\n")
    f2.write("    if (json['rows'] != null) {\n")
    f2.write("      _"+ref_camel_lower+"List = [];\n")
    f2.write("      json['rows'].forEach((v) {\n")
    f2.write("        _"+ref_camel_lower+"List.add(new "+ref_camel_upper+"Model.fromJson(v));\n")
    f2.write("     });\n")
    f2.write("    }\n")
    f2.write("  }\n")
    f2.write("  Map<String, dynamic> toJson() {\n")
    f2.write("    final Map<String, dynamic> data = new Map<String, dynamic>();\n")
    f2.write("    data['count'] = this._count;\n")
    f2.write("    if (this._"+ref_camel_lower+"List != null) {\n")
    f2.write("      data['"+ref_camel_lower+"List'] = this._"+ref_camel_lower+"List.map((v) => v.toJson()).toList();\n")
    f2.write("    }\n")
    f2.write("    return data;\n")
    f2.write("  }\n")
    f2.write("}\n")


    f.close()
    f2. close()
