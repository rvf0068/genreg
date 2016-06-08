SetPackageInfo( rec(
  PackageName := "genreg",
  Version := "0.1",
##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "7 June 2016">
##  <#/GAPDoc>

  PackageDoc := rec(
      BookName  := "genreg",
      SixFile   := "doc/manual.six",
      Autoload  := true ),
  Dependencies := rec(
      GAP       := "4.5",
      NeededOtherPackages := [ ["GAPDoc", "1.3"] ] ),
  AvailabilityTest := ReturnTrue ) );
