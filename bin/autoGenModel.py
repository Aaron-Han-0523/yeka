import sys
import os

print("example)")
print("python autoGen.py file1")
print("cf ) file1 like Community")
print("have to be file1 = Community")
print("not allow Multiple Uppercase ")

src = sys.argv[1]

output_path = "model/" + src.lower() + "_model.dart"
os.makedirs("model", exist_ok=True)

f = open(src, 'r')
f2 = open(output_path, 'w')

# data = f.read()
f2.write("class " + src + "Model {\n")

lines = f.readlines()
for line in lines:
    data_type = line.split(" ")[0]
    data_name = line.split(" ")[1].replace("\n", "")
    f2.write("{0} _{1};\n".format(data_type, data_name))


f2.write(src + "Model({\n")

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

f2.write(src + "Model.fromJson(Map<String, dynamic> json) {\n")

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

f2.write("}\n")

f.close()
f2. close()
