%This is a simple demonstration of the approximate method for GP based
%classification over multiple classes which is presented in
%
s = RandStream('mt19937ar', 'Seed', 2410152);
RandStream.setGlobalStream(s);

X = rand(s,100,4) * 8;
t = floor(X(:,1)) + 1;

X_t = X;
t_t = t;

C = [166 206 227
    31 120 180
    178 223 138
    51 160 44
    251 154 153
    227 26 28
    253 191 111
    255 127 0] / 255;

figure
scatter3(X(:,1), X(:,2), X(:,3), 35, t, 'filled')
colormap(C)


%Randomly initialise the covariance function hyperparameter values
theta = rand(1,4);

%Some arguments to be passed to the main script
theta_estimate = 1;             % Turn - on hyper-parameter inference
Nos_Its = 50;                   % Maximum number of variational EM steps
Kernel_Type = 'gauss';          % Covariance function type for example
Poly_Kernel_Power = 1;          % Parameter value if using Polynomial kernel
Thresh = 1e-6;                  % Iteration threshold on the marginal likelihood

%Main script
[TE, PL, LB] = VarMultProbRegGP(X, t, X_t, t_t,...
                                theta, theta_estimate,... 
                                Nos_Its, Kernel_Type,...
                                Poly_Kernel_Power, Thresh);

