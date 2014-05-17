% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	v = []; pointsUq=unique(points,"rows"); dist= [];
	NC=rows(centroids);
	NL=rows(pointsUq);
	for i=1:NL
		for j=1:NC
			buffer=(centroids(j,:)-pointsUq(i,:)); 
			dist(j)=norm(buffer,2); 
		end
		[x ix]=min(dist); 
		v(i)=ix;
	end
	scatter3(points(:,1),points(:,2),points(:,3),[],v(:));
end

