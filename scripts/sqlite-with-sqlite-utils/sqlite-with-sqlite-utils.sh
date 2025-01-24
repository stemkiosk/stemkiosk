

type -a pip; type -a pipx
#python -m pip install pipx
pipx install sqlite-utils
db="/path/to/database.db"
db="user/places.sqlite"
sqlite-utils schema "$db"
sqlite-utils schema "$db" moz_places
sqlite-utils query "$db"
query="SELECT strftime('%Y-%m-%dT%H:%M:%S', visit_date/1000000, 'unixepoch', 'localtime') AS datetime,url,title FROM moz_places, moz_historyvisits WHERE moz_places.id = moz_historyvisits.place_id ORDER BY visit_date;"
sqlite3 "$query"