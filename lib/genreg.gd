#V  GenregDirectory
##
##  <#GAPDoc Label="GenregDirectory">
##  <ManSection>
##  <Var Name="GenregDirectory"/>
##
##  <Description>
##
##  Directory where the genreg executable lives.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable( "GenregDirectory",
                       "Directory where the genreg executable lives.");

#V  GenregExecutable
##
##  <#GAPDoc Label="GenregExecutable">
##  <ManSection>
##  <Var Name="GenregExecutable"/>
##
##  <Description>
##
##  The value of the genreg executable file.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalVariable( "GenregExecutable",
                       "The value of the genreg executable file.");



#F  GenregFixList@( ul )
##
##  <#GAPDoc Label="GenregFixList@">
##  <ManSection>
##  <Func Name="GenregFixList@" Arg="ul"/>
##
##  <Description>
##
##  Process output from the genreg program.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "GenregFixList@" );

DeclareOperation( "GenregAdjList", [ IsInt, IsInt, IsInt ] );
DeclareOperation( "GenregAdjList", [ IsInt, IsInt ] );

#F  GenregGRAPEgraph( l )
##
##  <#GAPDoc Label="GenregGRAPEgraph">
##  <ManSection>
##  <Func Name="GenregGRAPEgraph" Arg="l"/>
##
##  <Description>
##
##  Given a list of adjacencies of a graph <A>l</A>, it returns the
##  corresponding graph in GRAPE format.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "GenregGRAPEgraph" );
