%%
% Plot a 3d cube of randomly scattered points, then unfold using tsne 
s = RandStream('mt19937ar', 'Seed', 2410152);
RandStream.setGlobalStream(s);

X = rand(s,500,3) * 2 - 1;
X = X*20;
Y = (X(:,1) > 0) + 2 * (X(:,2) > 0) + 4 * (X(:,3) > 0);

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

mappedX = tsne(X, [], 2, [], [])
figure
scatter(mappedX(:,1), mappedX(:,2), 35, Y, 'filled')
colormap(C)
