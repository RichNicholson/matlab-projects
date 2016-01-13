% Plot a 4d cube of randomly scattered points, then unfold using tsne 
s = RandStream('mt19937ar', 'Seed', 2410152);
RandStream.setGlobalStream(s);

X = rand(s,200,4) * 8;
Y = floor(X(:,1));
YP = Y;
YP(Y ~= 3) = -1;
YP(Y == 3) = 1;

C = [166 206 227
    31 120 180
    178 223 138
    51 160 44
    251 154 153
    227 26 28
    253 191 111
    255 127 0] / 255;

figure
scatter(X(:,1), X(:,2), 35, Y, 'filled')
colormap(C)

T = X; % test data the same as the training data
n = length(T);
hyp.mean = 0;
hyp.cov = log([1 1 1 1 1]);
meanfunc = @meanConst; 
covfunc = @covSEard;   
likfunc = @likErf;
hyp = minimize(hyp, @gp, -40, @infEP, meanfunc, covfunc, likfunc, X, YP);
[a, b, c, d, lp] = gp(hyp, @infEP, meanfunc, covfunc, likfunc, X, YP, T, ones(n,1));

figure
set(gca, 'FontSize', 24)
scatter3(T(:,1), T(:,2), T(:,3), 35, a, 'filled');