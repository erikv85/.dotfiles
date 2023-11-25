if [ -d ~/scala-spring-archetype ]; then
    git -C ~/scala-spring-archetype pull
else
    git clone git@github.com:erikv85/scala-spring-archetype.git ~/scala-spring-archetype
fi
mvn -f ~/scala-spring-archetype install
if ! grep -q archetypeGroupId ~/.dotfiles/.tobashrc ; then
    echo 'alias scala-spring-archetype="mvn archetype:generate -DarchetypeGroupId=io.github -DarchetypeArtifactId=scala-spring-archetype -DarchetypeVersion=1.0-SNAPSHOT"' > ~/.dotfiles/.tobashrc
    echo "scala-spring archetype (alias) installed."
fi
