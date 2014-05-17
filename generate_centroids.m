%functia care genereaza centroizii

function newCentroids = generate_centroids(centroids,pointsUq)
	NL=rows(pointsUq); NC=rows(centroids);
	buffer=zeros(1,3); 
	dist=zeros(1,NC);  %initializez vectorul distantelor la zero
	distMean=zeros(NC,5); %initializez o matrice ce va contine centroizii, suma si contorul
	distMean(:,1)=1:NC; %pe prima coloana se vor afla centroizii in ordine [1 2 3...NC]'
	for i=1:NL
		for j=1:NC
			buffer=(centroids(j,:)-pointsUq(i,:)); %creez un buffer pt calculul distantei
			dist(j)=norm(buffer,2); %calculez distanta si o adaug la vector
		end
		[x ix]=min(dist); %in ix se afla numarul centroidului
		distMean(ix,2)=distMean(ix,2) + pointsUq(i,1);
		distMean(ix,3)=distMean(ix,3) + pointsUq(i,2);		
		distMean(ix,4)=distMean(ix,4) + pointsUq(i,3);			
		distMean(ix,5)=distMean(ix,5) + 1;
		%%in distMean(ix,2:4) se gaseste suma tuturor x, y si z ale 
		%%punctelor ce apartin centroidului ix
		%in distMean(ix,5) se gaseste numarul puntelor ce apartin centroidului ix	
	end	
	for i=1:NC
		if (distMean(i,5) == 0)
			%newCentroids(i,:)=centroids(i,:);
			return;
		%daca centroidul este izolat, se patreaza coordonatele initiale
		else
			newCentroids(i,1)=distMean(i,2)/distMean(i,5);
			newCentroids(i,2)=distMean(i,3)/distMean(i,5);
			newCentroids(i,3)=distMean(i,4)/distMean(i,5);
		%newCentroids contine noii centroizi gasiti prin media aritmetica a punctelor
		end
	end
end
