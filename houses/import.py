import cs50
import csv
import os, sys

# ---- #
#escapes
if len(sys.argv) != 2:
    print("Usage: python import.py characters.csv")
    sys.exit()

db = cs50.SQL("sqlite:///students.db")
with open(sys.argv[1], "r") as file:
    reader = csv.DictReader(file)

    for line in reader:
        line["name"] = line["name"].split(' ')

        if len(line["name"]) == 2:
            Firstname = line["name"][0]
            Middlename = "None"
            Surname = line["name"][1]
            db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)",
                        Firstname, None, Surname, line["house"], line["birth"])
        else:
            Firstname = line["name"][0]
            Middlename = line["name"][1]
            Surname = line["name"][2]
            db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)",
                        Firstname, Middlename, Surname, line["house"], line["birth"])

'''
# doesnt use characters.csv as check, nor empty middle name, has to be None as an SQL input, not string
import cs50
import csv
import os, sys

# ---- #
#escapes
if len(sys.argv) != 2:
    print("Usage: python import.py characters.csv")
    sys.exit()

#if sys.argv[1] != "characters.csv":
#    print("Usage: python import.py characters.csv")
#    sys.exit()

db = cs50.SQL("sqlite:///students.db")
with open(sys.argv[1], "r") as file:
    reader = csv.DictReader(file)

    for line in reader:
        line["name"] = line["name"].split(' ')

        if len(line["name"]) == 2:
            Firstname = line["name"][0]
            Middlename = ""
            Surname = line["name"][1]
        else:
            Firstname = line["name"][0]
            Middlename = line["name"][1]
            Surname = line["name"][2]
        db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)",
                   Firstname, Middlename, Surname, line["house"], line["birth"])
'''

# ---- #
'''
# old method - read csv, write to temp csv with middlenames, write to sql from temp csv
# cs50 doesnt seem to like the temp csv maybe? No, didnt like the if "sys.argv[1] != "characters.csv":"
#  because it was using a different csv to check

# ---- #
#escapes
if len(sys.argv) != 2:
    print("Usage: python import.py characters.csv")
    sys.exit()

if os.path.exists("charTemp.csv"):
    os.remove('charTemp.csv')

if sys.argv[1] != "characters.csv":
    print("Usage: python import.py characters.csv")
    sys.exit()

total, i = 0, 0 # counting file size, as it is taking time
executeSQL = 0 # 1 if you want to write to students.db
show_percent_complete = 0

with open(sys.argv[1], "r") as file:
    reader = csv.DictReader(file)

    with open("charTemp.csv", "w") as temp:

        writer = csv.writer(temp)
        writer.writerow(["firstname", "middlename", "surname", "house", "birth"])
        for line in reader:
            line["name"] = line["name"].split(' ')
            if len(line["name"]) == 2:
                Firstname = line["name"][0]
                Middlename = ""
                Surname = line["name"][1]
            else:
                Firstname = line["name"][0]
                Middlename = line["name"][1]
                Surname = line["name"][2]
            writer.writerow([Firstname, Middlename, Surname, line["house"], line["birth"]])
            total += 1

with open("charTemp.csv", "r") as file:
    read = csv.DictReader(file)
    for row in read:
        if executeSQL == 1:
            #db.execute("CREATE TABLE students (firstname TEXT, middlename TEXT, surname TEXT, house TEXT, birth NUMERIC)")
            db.execute("INSERT INTO students (first, middle, last, house, birth) VALUES(?, ?, ?, ?, ?)",
                                   row["firstname"], row["middlename"], row["surname"], row["house"], row["birth"])
            i += 1

        if show_percent_complete == 1:
            print("{}%" .format(i / total * 100))
'''