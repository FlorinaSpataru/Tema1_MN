% computes the NC centroids corresponding to the given points using K-Means

function centroids = clustering_pc(points, NC)
	centroids = []; newCentroids = []; pointsUq= [];
	OK=1; %OK va deveni 0 cand centroizii nu se mai modifica -> va opri bucla while
	pointsUq=unique(points,"rows");
	NL=rows(pointsUq);
	index=floor(NL/NC); j=1;
	for i=1:index:NL
		centroids(j,:)=pointsUq(i,:);
		if (j>=NC)
			break;
		end
		++j;
	end
	%centroids=3*pointsUq(1:NC,:);
	epsilon=1e-5;
	buffer=zeros(1,3); 
	while (OK==1)
		newCentroids = generate_centroids(centroids,pointsUq);
		
		buffer=newCentroids-centroids;
		if norm(buffer,2)==0 
			OK=0;
		end 
		if OK==1
			if rows(unique(newCentroids,"rows"))<NC
				return;
			end
			if max(abs(newCentroids.-centroids))<epsilon
				centroids=newCentroids;
				return;
			end
			centroids=newCentroids;
		end
		%%daca centroizii noi nu sunt egali cu cei initiali, se va verifica 
		%%daca sunt diferiti intre ei si, daca da, se vor inlocui centroizii 
		%%initiali cu cei gasiti altfel vor ramane centroizii initiali
	end
end
