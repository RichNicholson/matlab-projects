%%
% Plot a 4d cube of randomly scattered points, then unfold using tsne 
s = RandStream('mt19937ar', 'Seed', 2410152);
RandStream.setGlobalStream(s);

X = rand(s,1000,4) * 8;
Y = floor(X(:,1));

mix = [4 1 5 7 3 2 6 8];
Y(Y==1) = mix(1)*10;
Y(Y==2) = mix(2)*10;
Y(Y==3) = mix(3)*10;
Y(Y==4) = mix(4)*10;
Y(Y==5) = mix(5)*10;
Y(Y==6) = mix(6)*10;
Y(Y==7) = mix(7)*10;
Y(Y==8) = mix(8)*10;


C = [166 206 227
    31 120 180
    178 223 138
    51 160 44
    251 154 153
    227 26 28
    253 191 111
    255 127 0] / 255;

figure
scatter3(X(:,1), X(:,2), X(:,3), 35, Y, 'filled')
colormap(C)

%mappedX = tsne([X Y], [], 2, [], [])
%mappedX = sammon([X Y])
[mappedX] = mcml(X,Y,2);
figure
scatter(mappedX(:,1), mappedX(:,2), 35, Y, 'filled')
colormap(C)

% 
% scatter(Y.coords{:}(1,:),Y.coords{:}(2,:), 35, labels, 'filled')
% colormap(C)