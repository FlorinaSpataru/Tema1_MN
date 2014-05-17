% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; pointsUq=unique(points,"rows");
	dist= []; costCentroids= [];
	NC=rows(centroids);
	NL=rows(pointsUq);
	costCentroids=zeros(NC,2);
	costCentroids(:,1)=1:NC;
	for i=1:NL
		for j=1:NC
			buffer=(centroids(j,:)-pointsUq(i,:)); 
			dist(j)=norm(buffer,2); 
		end
		[x ix]=min(dist); %in ix se afla numarul centroidului
		costCentroids(ix,2)=costCentroids(ix,2) + x;
	end
	cost=sum(costCentroids(:,2));
end

