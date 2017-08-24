
G = digraph({'A(B, C, D)', 'A(B, C, D)'}, {'B(C, D)', 'D(B, C)'});
G.Edges;
G = addedge(G, {'B(C, D)', 'B(C, D)'}, {'C(D)', 'A(C, D)'});
G = addedge(G, {'C(D)', 'C(D)'}, {'B(D)', 'D()'});
G = addedge(G, {'B(D)', 'B(D)'}, {'A(D)', 'C(D)'});
G = addedge(G, {'A(D)', 'A(D)'}, {'B(D)', 'D()'});
G = addedge(G, {'A(C, D)', 'A(C, D)'}, {'B(C, D)', 'D(C)'});
G = addedge(G, {'D(C)', 'D(C)'}, {'A(C)', 'C()'});

G = addedge(G, {'D(B, C)', 'D(B, C)'}, {'A(B, C)', 'C(B)'});
G = addedge(G, {'A(B, C)', 'A(B, C)'}, {'B(C)', 'D(B, C)'});
G = addedge(G, {'B(C)', 'B(C)'}, {'A(C)', 'C()'});
G = addedge(G, {'A(C)', 'A(C)'}, {'B(C)', 'D(C)'});
G = addedge(G, {'C(B)', 'C(B)'}, {'B()', 'D(B)'});
G = addedge(G, {'D(B)', 'D(B)'}, {'A(B)', 'C(B)'});
G = addedge(G, {'A(B)', 'A(B)'}, {'B()', 'D(B)'});

p1 = plot(G);
p1.MarkerSize = 7;
p1.Marker = 'o';
p1.NodeColor = 'r';