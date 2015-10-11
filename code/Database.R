Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre7')

system("java -version")
options(java.parameters="-Xmx2g")
.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))

library(rJava)
library(RJDBC)


jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="E:/app/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")
jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@//localhost:1521/obiee", "omanbi", "cmc123")

dimParts <- dbGetQuery(jdbcConnection, "SELECT * FROM DIM_PARTS")
print(dimParts)


dbDisconnect(jdbcConnection)

