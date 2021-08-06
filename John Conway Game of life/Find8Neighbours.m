function neighbours = Find8Neighbours(deadR,deadC,n,m)

neighUp = [mod(deadR-2,n)+1, deadC];
neighDown = [mod(deadR,n)+1, deadC];
neighLeft = [deadR, mod(deadC - 2,m)+1];
neighRight = [deadR,  mod(deadC,m)+1];
neighUR = [mod(deadR-2,n)+1, mod(deadC,m)+1];
neighUL = [mod(deadR-2,n)+1, mod(deadC - 2,m)+1];
neighDR = [mod(deadR,n)+1,  mod(deadC,m)+1];
neighDL = [mod(deadR,n)+1,  mod(deadC - 2,m)+1];
neighbours = [neighUp; neighDown; ...
    neighLeft; neighRight; ...
    neighUR; neighUL; ...
    neighDR; neighDL];

end
