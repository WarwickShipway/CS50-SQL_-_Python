import cs50
import csv
import os, sys

# ---- #
# escapes
if len(sys.argv) != 2:
    print("Usage: python roster.py house_name")
    sys.exit()

house = sys.argv[1]
db = cs50.SQL("sqlite:///students.db")

#db.execute("INSERT INTO genres (show_id, genre) VALUES(?, ?)", id, genre)
db_houses = db.execute("SELECT first, middle, last, birth FROM students WHERE house= (?) ORDER BY last, first;", house)

for data in db_houses:
    if data['middle'] == None:
        print("{} {}, born {}" .format(data['first'], data['last'], data['birth']))
    else:
        print("{} {} {}, born {}" .format(data['first'], data['middle'], data['last'], data['birth']))

'''
firstname,middlename,surname,house,birth
Adelaide,NULL,Murton,Slytherin,1982

CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first VARCHAR(255),
    middle VARCHAR(255),
    last VARCHAR(255),
    house VARCHAR(10),
    birth INTEGER
'''