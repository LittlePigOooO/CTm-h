map_path = shaperead('F:\ECMWF_China\pressure\2018\bou2_4p.shp'); % set path of .shp files 
map_X = [map_path(:).X]; % read x of the contour of province 
map_Y = [map_path(:).Y]; % read y of the contour of province 
m_proj('lambert','lon',[70, 140],'lat',[20,55]) % set projection, and range 
m_plot(map_X,map_Y) % draw political line m_grid % draw grid