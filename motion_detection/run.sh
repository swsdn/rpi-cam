mvn clean dependency:copy-dependencies package

java -cp "target/motion-0.0.1-SNAPSHOT.jar;/target/dependency/*" com.swsdn.rpi.motion.Camera