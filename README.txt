Spataru Florina Gabriela
313 CA
Tema1 MN


~~~Task 2

Am creat o matrice pointUq in care am punctele unice din points, sortate. Pentru 
centroizii initiali am ales la inceput primele NC puncte din pointsUq, dar nu era 
corect asa ca unele teste imi treceau, altele nu. Solutia pe care am gasit-o a 
fost sa calculez un index care reprezenta distanta dintre centroizii initiali si sa
aleg puncte din points cu un for care merge din index in index incepand cu 1 si 
terminand cu numarul de linii a matricei points.

O alta problema intampinata a fost timpul de rulare care era de peste 1 minut asa ca
am creat functia generate_centroids.m. Aceasta imi calculeaza distantele de la un punct 
la fiecare centroid, gaseste minimul si face media punctelor ce apartin fiecarui
centroid (daca se poate).

In clustering_pc.m, intr-un while, se apeleaza generate_centroids.m pana cand centroizii 
nu se mai modifica. Se verifica de asemenea daca acestia sunt diferiti intre ei.

~~~Task 3

Ca sa nu mai schimb functia generate_centroids.m, am preferat sa repet o mica portiune 
de cod, lucru care nu afecteaza prea mult timpul de rulare. Teoretic, am calculat din 
nou distantele de la fiecare punct la fiecare din centroizi, am gasit minimul si am 
creat un vector ce contine pe pozitia i (adica punctul i), centroidul de care apartine.
Avand un astfel de vector, scatter3 imi colora diferit punctele de apartineau unui
centroid fata de cele ale unui alt centroid.

~~~Task 4

La fel, in compute_cost_pc.m, am repetat o mica parte de cod din clustering_pc.m.
Calculez distantele de la fiecare punct la centroizi, un minim care imi intoarce
distanta minima si indexul unde a gasita acesta valoare adica numarul centroidului.
Asa ca intr-o matrice de NC linii si 2 coloane, adun pentru centroidul x adica pe 
pozitia costCentroids(x,2), distanta minima gasita. In final adun toate cele NC 
sume pentru a gasi costul final.

~~~Task 5

Cum paramentrul functiei view_cost_vs_nc.m este file_points, am facut ca pentru 
Task 1 load ca sa gasesc matricea points. In mare, functia asta face cam acelasi 
lucru ca si functia de test, adica apeleaza clustering_pc.m si compute_cost_pc.m
dar in loc de NC avem un i de la 1 la 10 pentru a vedea cum se comporta costul
pentru un numar diferit de clustere. Pun toate cele 10 costuri intr-un vector
si se foloseste plot, care are o sintaxa relativ simpla pentru a trasa graficul.



