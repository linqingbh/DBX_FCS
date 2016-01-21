function [fitresult, gof] = Fit_eta(RPS, V, eta)
%CREATEFIT(RPS,V,ETA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : RPS
%      Y Input : V
%      Z Output: eta
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 01-Feb-2015 16:18:24


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( RPS, V, eta );

% Set up fittype and options.
ft = fittype( 'poly12' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'untitled fit 1', 'eta vs. RPS, V', 'Location', 'NorthEast' );
% Label axes
xlabel( 'RPS' );
ylabel( 'V' );
zlabel( 'eta' );
grid on
view( -79.5, 24 );

