# Modify these as needed

HTTP_SUCCESS = 200
HTTP_UNPROCESSABLE = 422

# Uncomment this line if you're going to run the tests locally
# host.docker.internal allows you to access the host machine localhost from docker
# BASE_URL = 'http://localhost:3000'
BASE_URL = 'http://host.docker.internal:3000'

RESET_DB_COMMAND = 'pg_restore --clean -d shipup_test_development glexport_development.psql.dump'
# RESET_DB_COMMAND = 'mysql -u root < glexport_development.mysql.dump'

YALMART_ID = 2
DOSTCO_ID = 3
