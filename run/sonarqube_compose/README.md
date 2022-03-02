
https://github.com/SonarSource/sonarqube  

docker-compose -f docker-compose.yml up -d

http://localhost:9000/  

docker-compose -f docker-compose.yml down


%MVN_HOME%/conf/settings.xml

<pluginGroups>
	<pluginGroup>org.sonarsource.scanner.maven</pluginGroup>
</pluginGroups>
<profiles>
	<profile>
		<id>sonar</id>
		<activation>
			<activeByDefault>true</activeByDefault>
		</activation>
		<properties>
			<sonar.host.url>http://localhost:9000</sonar.host.url>
			<sonar.login>admin</sonar.login>
			<sonar.password>admin</sonar.password>
			<sonar.jdbc.url>jdbc:postgresql://localhost:5432/sonar</sonar.jdbc.url>
			<sonar.jdbc.username>sonar</sonar.jdbc.username>
			<sonar.jdbc.password>sonar</sonar.jdbc.password>
		</properties>
	</profile>
</profiles>

mvn clean install sonar:sonar -DskipTests

TODO:
[ERROR] Failed to execute goal org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar (default-cli) on project cn-reseller-service: No quality profiles have been found, you probably don't have any language plugin installed. -> [Help 1]

