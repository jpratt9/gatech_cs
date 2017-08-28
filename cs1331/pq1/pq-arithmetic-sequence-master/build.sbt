lazy val filesToSubmit = settingKey[Seq[String]]("Tuple of files to submit.")

lazy val root = (project in file(".")).
  settings(
    com.etsy.sbt.Checkstyle.checkstyleSettings,
    com.etsy.sbt.Checkstyle.CheckstyleTasks.checkstyleConfig
      := file("cs1331-checkstyle.xml")).
  settings(
    name := "pq-arithmetic-sequence",
    // In a particular semester's fork of this repo, organization should be
    // changed to match the github.gatech.edu user name of the user under
    // whose name the repo will be forked.
    organization := "tshields3",
    // Must be a tuple of String, i.e., comma-delimited list of Strings
    // enclosed in parentheses
    filesToSubmit := Seq("src/main/java/"),
    version := "1.0",
    Keys.commands += org.cs1331.gitsubmitter.GitSubmitterPlugin.submitCommand,
    libraryDependencies ++= Seq(
      "com.novocode" % "junit-interface" % "0.11" % "test",
      "junit" % "junit" % "4.12"
    )
  )
