name := "npc"
version := "1.0.0"

val sourceDir = "src/";
scalacOptions ++= Seq("-Xsource:2.11", "-unchecked", "-deprecation")
scalaSource in Compile := (baseDirectory(_/sourceDir)).value

resolvers ++= Seq(
	Resolver.sonatypeRepo("snapshots"),
	Resolver.sonatypeRepo("releases")
)

val defaultVersions = Map(
  "chisel3" -> "3.1.1",
  "chisel-iotesters" -> "1.1.+"
  )

libraryDependencies ++= (Seq("chisel3","chisel-iotesters").map {
  dep: String => "edu.berkeley.cs" %% dep % sys.props.getOrElse(dep + "Version", defaultVersions(dep)) })

import sys.process._
import java.io.{File}
import java.nio.file._

val objDir = "output/"
val vFileName = objDir + "Top.v";

def getListOfFiles(dir: String):List[File] = {
    val d = new File(dir)
    if (d.exists && d.isDirectory) {
        d.listFiles.filter(_.isFile).toList
    } else {
        List[File]()
    }
}

def getFileTimeInMillis(file:File):Long = {
	val path = Paths.get(file.getPath());
	return Files.getLastModifiedTime(path).toMillis;
}

def getLatestFileTime(files:List[File]):Long = {
	val sortedFiles = files.sortWith(getFileTimeInMillis(_) > getFileTimeInMillis(_));
	if(sortedFiles.length > 0)
		return getFileTimeInMillis(sortedFiles(0));
	return 0;
}

def needGenerateVFile(args:Seq[String]):Boolean = {
	if(args.length == 1 && args(0) == "clean")
		return false;
	val files = getListOfFiles(sourceDir);
	val latestTime = getLatestFileTime(files);
	val vFile = new File(vFileName);
	if(!vFile.exists) return true;
	if(getFileTimeInMillis(vFile) <= latestTime)
		return true;
	return false;
}

def makeProject = Command.args("make", "<args>") {
	(state, args) => {
		val exec = Exec("run SimTop -td " + objDir + " --output-file " + vFileName, None);
		val makeCommand = ("make " + args.mkString(" "));
		if(needGenerateVFile(args)) {
			val newState = MainLoop.processCommand(exec, state);
			("mkdir -p " + objDir)!;
			("touch " + vFileName)!;
			makeCommand!; newState;
		} else {
			makeCommand!; state;
		}
	}
}

commands += makeProject
