resolvers += Resolver.url("sbt-plugin-releases",
  new URL("http://scalasbt.artifactoryonline.com/scalasbt/sbt-plugin-releases/"))(
    Resolver.ivyStylePatterns)

addSbtPlugin("org.scala-sbt" % "sbt-closure" % "0.1.0")

addSbtPlugin("me.lessis" % "less-sbt" % "0.1.9")

libraryDependencies <+= sbtVersion(v => "com.github.siasia" %% "xsbt-web-plugin" % (v+"-0.2.11"))
