function view_cost_vs_nc(file_points)
	points=[];
	points=load("-ascii",file_points);
	cost=[];
	for i=1:10
		centroids=clustering_pc(points,i);
		cost(i)=compute_cost_pc(points,centroids);
	end
	plot(1:10,cost(:));
end

