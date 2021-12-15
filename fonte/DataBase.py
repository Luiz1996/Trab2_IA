import mysql.connector

class DataBase:
    host = "localhost"
    user = "root"
    password = "root"
    port = "3306"
    dataBase = "trab2-ia"

    def getConnection(self):
        connection = mysql.connector.connect(
            host=self.host,
            user=self.user,
            passwd=self.password,
            port=self.port,
            database=self.dataBase
        )

        return connection





