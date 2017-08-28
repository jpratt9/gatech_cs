import sbt._
import sbt.Keys._

object Cs1331Build extends Build{

  lazy val grade = taskKey[Unit]("Grade project solutoin.")

  lazy val gradeImpl = Def.task {
    val stylePoints = checkstylePoints
    val testPoints = junitPoints
    val score = 100 - stylePoints - testPoints
    println()
    println(f"Style points: -${stylePoints}%3d")
    println(f"Test points:  -${testPoints}%3d")
    println(f"Final score:   ${score}%3d")
  }

  def checkstylePoints = {
    val checkstyleReport = xml.XML.loadFile("target/checkstyle-report.xml")
    val files = (checkstyleReport \ "file")
    val errors = files.map(file => (file \ "error")).flatten
    val report = new StringBuilder
    report.append("Style errors:\n")
    for (file <- files) {
      val name = (file \ "@name").text
      report.append(s"\nStyle errors in $name:\n")
      val errors = (file \ "error")
      for (error <- errors) {
        val msg = (error \ "@message").text
        val line = (error \ "@line").text
        report.append(s"- Line $line: $msg\n")
      }
    }
    report.append(s"${errors.size} Total style errors\n")
    println(report.toString)
    errors.size
  }

  def junitPoints = {
    // Hard-coded for now, we'll fix in next version
    Seq("PersonTest", "PeoplebaseTest").map(parseReport(_)).sum
  }

  def parseReport(testName: String) = {
    val testReportFile = s"target/test-reports/${testName}.xml"
    val testReport = xml.XML.loadFile(testReportFile)
    val errors = (testReport \ "testcase" \ "failure").
      map(error => (error \ "@message").text)
    println(s"Test errors in $testName:")
    errors.foreach(println)
    val points = errors.map(_.tail.takeWhile(!_.isWhitespace)).map(_.toInt).sum
    points
  }
}
