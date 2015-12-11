function [fitresult, gof,h] = Custom_Fit(x, y, z,Fit_expre)
%CREATEFIT(ALPHA,BETA,C_X)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Input : y
%      Z Output: z
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 11-Dec-2015 10:41:57


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( x, y, z );

% Set up fittype and options.
ft = fittype( Fit_expre, 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% Determinar numero de params a ajsutar
match_a = strfind(Fit_expre,'a_');

opts.StartPoint = 2*rand(1,length(match_a))-1;

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData );

view( -5.1, 11.6 );


