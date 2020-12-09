import mysql.connector
from datetime import date, datetime, timedelta
from mysql.connector import MySQLConnection, Error

# ═══════════════════════════════════════════════════════════════════════════════╡
# DATABASE CONNECTION
# ═══════════════════════════════════════════════════════════════════════════════╡
def connect():
    conn = mysql.connector.connect(host='vm', user='greg', password='greg', database='covid19')
    c = conn.cursor()
    return c, conn

def try_connection():
    conn = None
    try:
        c, conn = connect()
        if conn.is_connected():
            print('Connected to MySQL database')
            return c, conn
    except mysql.connector.Error as e:
        print(e)
    finally:
        if conn is not None and conn.is_connected():
            conn.close()

# ═══════════════════════════════════════════════════════════════════════════════╡
# CREATE TODAY'S TIMESTAMP AS A INTEGER & TIMESTAMP DIFF
# ═══════════════════════════════════════════════════════════════════════════════╡
def get_current_date_as_int():
    today = datetime.now().date()
    t = str(today).split('-')
    today = t[0] + t[1] + t[2]
    return int(today)

def timestamp_diff():
    if try_connection():
        c, conn = connect()
        query = "SELECT * FROM States WHERE LastUpdated"
        c.execute(query)
        records = c.fetchall()
        lastUpdated = records[0][6]
        currentDate = get_current_date_as_int()
        diff = currentDate - lastUpdated
        conn.commit()
        return diff

# ═══════════════════════════════════════════════════════════════════════════════╡
# CREATE STATES OLD TABLE
# ═══════════════════════════════════════════════════════════════════════════════╡
def create_old_table():
    if try_connection():
        c, conn = connect()
        q1 = 'DROP TABLE StatesOld'
        q2 = 'CREATE TABLE StatesOld LIKE States'
        q3 = 'INSERT INTO StatesOld SELECT * FROM States;'
        c.execute(q1)
        c.execute(q2)
        c.execute(q3)
        conn.commit()

# ═══════════════════════════════════════════════════════════════════════════════╡
# CREATE, INSERT, & UPDATE STATES TABLE
# ═══════════════════════════════════════════════════════════════════════════════╡
def create_states_table():
    if try_connection():
        c, conn = connect()
        query = 'CREATE TABLE IF NOT EXISTS States(StateID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, StateName VARCHAR(20) NOT NULL, ConfirmedCases INTEGER NOT NULL, ConfirmedDeaths INTEGER NOT NULL, LastUpdated INTEGER NOT NULL) AUTO_INCREMENT = 1'
        c.execute(query)
        conn.commit()

def insert_into_states(StateName, ConfirmedCases, ConfirmedDeaths, LastUpdated):
    if try_connection():
        c, conn = connect()
        query = 'INSERT INTO States(StateName, ConfirmedCases, ConfirmedDeaths, LastUpdated) VALUES(%s, %s, %s, %s)'
        c.execute(query, (StateName, ConfirmedCases, ConfirmedDeaths, LastUpdated))
        conn.commit()

def update_state_table(stateData):
    current = get_current_date_as_int()
    create_old_table()
    if try_connection():
        c, conn = connect()
        for key in stateData:
            name = key
            cdList = stateData[name]
            query = "SELECT * FROM States WHERE StateName = '%s'" % name
            c.execute(query)
            records = c.fetchall()
            for oldRow in records:
                confirmedCases = int(cdList[0])
                confirmedDeaths = int(cdList[1])
                updateQuery = "UPDATE States SET ConfirmedCases = '%d', ConfirmedDeaths = '%d', LastUpdated = '%d' WHERE StateName = '%s'" % (
                    confirmedCases, confirmedDeaths, current, name)
                c.execute(updateQuery)
        conn.commit()

# ═══════════════════════════════════════════════════════════════════════════════╡
# INSERT & UPDATE INTO COUNTRIES TABLE
# ═══════════════════════════════════════════════════════════════════════════════╡
def insert_into_country(CountryName, Cases, Deaths, Recovered, Unresolved, LastUpdated):
    if try_connection():
        c, conn = connect()
        query = 'INSERT INTO Country(CountryName, Cases, Deaths, Recovered, Unresolved, LastUpdated) VALUES(%s, %s, %s, %s, %s, %s)'
        c.execute(query, (CountryName, Cases, Deaths, Recovered, Unresolved, LastUpdated))
        conn.commit()

def update_country_table(countryData):
    current = get_current_date_as_int()
    if try_connection():
        c, conn = connect()
        name = "USA"
        query = "SELECT * FROM Country WHERE CountryName = '%s'" % name
        c.execute(query)
        records = c.fetchall()
        for record in records:
            cases = countryData[0]
            deaths = countryData[1]
            recovered = countryData[2]
            unresolved = countryData[3]
            updateQuery = "UPDATE Country SET Cases = '%d', Deaths = '%d', Recovered = '%d', Unresolved = '%d', LastUpdated = '%d' WHERE CountryName = '%s'" % (
                cases, deaths, recovered, unresolved, current, name)
            c.execute(updateQuery)
        conn.commit()

# ═══════════════════════════════════════════════════════════════════════════════╡
# INSERT & UPDATE INTO COUNTIES TABLE
# ═══════════════════════════════════════════════════════════════════════════════╡
def insert_into_county(CountyName, ConfirmedCases, ConfirmedDeaths, LastUpdated):
    if try_connection():
        c, conn = connect()
        query = 'INSERT INTO County(CountyName, ConfirmedCases, ConfirmedDeaths, LastUpdated) VALUES(%s, %s, %s, %s)'
        c.execute(query, (CountyName, ConfirmedCases, ConfirmedDeaths, LastUpdated))
        conn.commit()

def update_county_table(countyData):
    current = get_current_date_as_int()
    if try_connection():
        c, conn = connect()
        for key in countyData:
            name = key
            cdList = countyData[name]
            query = "SELECT * FROM County WHERE CountyName = '%s'" % name
            c.execute(query)
            records = c.fetchall()
            for row in records:

                confirmedCases = cdList[0]
                confirmedDeaths = cdList[1]
                int(confirmedCases)
                int(confirmedDeaths)
                updateQuery = "UPDATE County SET ConfirmedCases = '%d', ConfirmedDeaths = '%d', LastUpdated = '%d' WHERE CountyName = '%s'" % (
                    confirmedCases, confirmedDeaths, current, name)
                c.execute(updateQuery)
            conn.commit()

