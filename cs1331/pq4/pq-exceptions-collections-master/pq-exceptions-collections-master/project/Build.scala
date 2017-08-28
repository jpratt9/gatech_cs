import sbt._
import sbt.Keys._
import com.etsy.sbt._

object Cs1331Build extends Build{

  lazy val grade = taskKey[Unit]("Grade project solution.")

  lazy val gradeImpl = Def.task {
    val compileFailed = (compile in Compile).result.value.isInstanceOf[Inc]
    
    if (compileFailed) {
      println("Your code failed to compile.")
      println(scala.Console.RED + "Final score:       0" + scala.Console.RESET)
    } else {
      val testCompileFailed = (compile in Test).result.value.isInstanceOf[Inc]
      if (testCompileFailed) {
        println("Your code compiled; but you haven't written all the methods or constructors properly yet so the tests aren't compiling. Make sure to stub our your methods first.")
        println(scala.Console.RED + "Final score:       0" + scala.Console.RESET)
      } else {
        (test in Test).result.value
        (Checkstyle.CheckstyleTasks.checkstyle in Compile).result.value
        val stylePoints = checkstylePoints
        val testPoints = junitPoints
        val score = math.max(0, 100 - stylePoints - testPoints)

        println(f"Style points: -${stylePoints}%3d")
        println(f"Test points:  -${testPoints}%3d")
        println(scala.Console.GREEN + f"Final score:   ${score}%3d" + scala.Console.RESET)
      }
    }
  }

  def checkstylePoints = {
    val checkstyleReport = xml.XML.loadFile("target/checkstyle-report.xml")
    val files = (checkstyleReport \ "file")
    var errorCount = 0
    val report = new StringBuilder
    report.append("\nStyle errors:\n")
    for (file <- files) {
      val name = (file \ "@name").text
      // TODO: this regex will fail on unix files with \ in them
      val fileName = name.split("[\\/]").last
      if (fileName endsWith ".java") {
        val errors = (file \ "error")
        errorCount += errors.length
        if (errors.length > 0)
          report.append(scala.Console.YELLOW + s"$fileName:\n" + scala.Console.RESET)
        for (error <- errors) {
          val msg = (error \ "@message").text
          val line = (error \ "@line").text
          report.append(s"- Line $line: $msg\n")
        }
      }
    }
    report.append(if (errorCount == 0) scala.Console.GREEN + "No style errors!\n" + scala.Console.RESET else scala.Console.RED + s"${errorCount} Total style errors\n" + scala.Console.RESET)
    println(report.toString)
    errorCount
  }

  def junitPoints = {
    // TODO: make this automated
    // For now, place the names of the JUnit tests below in the Seq
    Seq("ExceptionsTests", "CollectionsTests").map(parseReport(_)).sum
  }

  def parseReport(testName: String) = {
    val testReportFile = s"target/test-reports/${testName}.xml"
    val testReport = xml.XML.loadFile(testReportFile)
    val errors = (testReport \ "testcase" \ "failure").
      map(error => {
        if ((error \ "@message").text == "") {
          "-10 Unanticipated test failure: " + (error \ "@type").text
        } else {
          (error \ "@message").text
        }
      })
    println(s"Test errors in $testName:")
    errors.foreach(println)
    val points = errors.map(_.tail.takeWhile(!_.isWhitespace)).map(_.toInt).sum
    points
  }
}
