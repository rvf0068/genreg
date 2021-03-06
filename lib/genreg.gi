if not(IsBound(StartsWith)) then
    StartsWith:=function ( string, prefix )
    return Length( prefix ) <= Length( string ) and string{[ 1 .. Length( prefix ) ]} = prefix;
end;
fi;

#V  GenregDirectory
##
InstallValue( GenregDirectory, 
    DirectoriesSystemPrograms()
);


#V  GenregExecutable
##
InstallValue( GenregExecutable, 
    Filename( GenregDirectory, "genreg" )
);

#F  GenregFixList@( ul )
##
InstallGlobalFunction( GenregFixList@, function( ul )
    local i, igraph, graphs, pref, adj, j;
    i := 0;
    graphs := [];
    while i < Length(ul) do
        i := i+1;
        if StartsWith(ul[i], "Graph ") then
            igraph := Int(ul[i]{[7..Length(ul[i])-1]});
            graphs[igraph] := [];
            i := i+2;
            j := 1;
            repeat
                pref := Concatenation(String(j), " : ");
                adj := ul[i]{[Length(pref)+1..Length(ul[i])-1]};
                adj := SplitString(adj, " ");
                adj := List(adj, Int);
                Add(graphs[igraph], adj);
                i := i+1;
                j := j+1;
                pref := Concatenation(String(j), " : ");
            until i > Length(ul) or not(StartsWith(ul[i], pref));
        fi;
    od;
    return graphs;
end);

#M  GenregAdjList( n, k, g )
##
##  <#GAPDoc Label="GenregAdjList">
##  <ManSection>
##  <Meth Name="GenregAdjList" Arg="n, k, g"/>
##
##  <Description>
##
##  Returns adjacency lists for all the graphs of <A>n</A> vertices
##  which are <A>k</A> regular, with girth <A>g</A>.
##
##  </Description>
##
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( GenregAdjList, "for a given girth", [ IsInt, IsInt, IsInt ], 
function(n, k, g)
    local str, a;
    str := ""; 
    a := OutputTextString(str, true);
    Process(DirectoryCurrent(), GenregExecutable, InputTextNone(), a, 
            [String(n), String(k), String(g), "-a", "stdout"] );
    return GenregFixList@(SplitString(str,"\n"));               
end);


InstallMethod( GenregAdjList, "for a given girth", [ IsInt, IsInt ], 
function(n, k)
    local str, a;
    str := ""; 
    a := OutputTextString(str, true);
    Process(DirectoryCurrent(), GenregExecutable, InputTextNone(), a, 
            [String(n), String(k), "-a", "stdout"] );
    return GenregFixList@(SplitString(str,"\n"));               
end);

#F  GenregGRAPEgraph( l )
##
InstallGlobalFunction( GenregGRAPEgraph, function( l )
    local ady;
    ady := function(x, y)
        return y in l[x];
    end;
    return Graph(Group(()), [1..Length(l)], OnPoints, ady, true);
end);
