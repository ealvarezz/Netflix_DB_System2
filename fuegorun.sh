

# alias fuegorun=./<PATH_TO_FOLDER_WITH_SCRIPT>

cd "${0%/*}"
mvn clean install -U;
cp src/main/java/netflix_engine/mappers/*.xml target/classes/netflix_engine/mappers/;
mvn package;
mvn tomcat:run;


