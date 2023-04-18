git clone git@github.com:erikv85/scala-spring-archetype.git ~/scala-spring-archetype
mvn -f ~/scala-spring-archetype install
echo 'alias=scala-spring-archetype="mvn archetype:generate -DarchetypeGroupId=io.github -DarchetypeArtifactId=scala-spring-archetype -DarchetypeVersion=1.0-SNAPSHOT"' > ~/.dotfiles/.tobashrc
echo "scala-spring archetype (alias) installed."
