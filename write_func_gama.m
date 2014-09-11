% Write symbolically generated jacobian of constraint vector in a file.
% contnet: content to be written.

function write_func_gama(content)

[m, n] = size(content); % Length of the content.
fcn_name = 'func_gama'; % Function name.

fid = fopen(['autogen/',fcn_name,'.m'],'w+'); % Open m.file

fprintf(fid,['function [gama]=' ...
    ' %s(q,dq)\n'],fcn_name);   % Write header.

% Some header comments.
fprintf(fid,'%s','%%%%');
fprintf(fid,'%%%%%s\n',['  ',fcn_name,'.m']);
fprintf(fid,'%%%%%s',['%%  ',datestr(now)]);
fprintf(fid,'\n%s','%%%%');
fprintf(fid,'\n%s','%%%% Authors(s): Pedotronics LLC');
fprintf(fid,'\n%s','%%%%');
fprintf(fid,'\n%s','%%%%');
fprintf(fid,'\n%s','%%%%');
fprintf(fid,'\n%s','%%%%');


fprintf(fid,'\n%s', '% Read model parameters');
fprintf(fid,'\n%s', '[r1,r2,e1,e2,e3,m1,m2,m3,J1,J2] = func_model_parameters;');


fprintf(fid,'%Inputs. \n');
fprintf(fid,'\n%s', 'X1 = q(1);');
fprintf(fid,'\n%s', 'Y1 = q(2);');
fprintf(fid,'\n%s', 'theta1 = q(3);');
fprintf(fid,'\n%s', 'X2 = q(4);');
fprintf(fid,'\n%s', 'Y2 = q(5);');
fprintf(fid,'\n%s', 'theta2 = q(6);');
fprintf(fid,'\n%s', 'X3 = q(7);');
fprintf(fid,'\n%s', 'Y3 = q(8);');
fprintf(fid,'\n%s', 'theta3 = q(9);');
fprintf(fid,'\n%s', 'X4 = q(10);');
fprintf(fid,'\n%s', 'Y4 = q(11);');
fprintf(fid,'\n%s', 'theta4 = q(12);');

fprintf(fid,'\n%s', 'dX1 = dq(1);');
fprintf(fid,'\n%s', 'dY1 = dq(2);');
fprintf(fid,'\n%s', 'dtheta1 = dq(3);');
fprintf(fid,'\n%s', 'dX2 = dq(4);');
fprintf(fid,'\n%s', 'dY2 = dq(5);');
fprintf(fid,'\n%s', 'dtheta2 = dq(6);');
fprintf(fid,'\n%s', 'dX3 = dq(7);');
fprintf(fid,'\n%s', 'dY3 = dq(8);');
fprintf(fid,'\n%s', 'dtheta3 = dq(9);');
fprintf(fid,'\n%s', 'dX4 = dq(10);');
fprintf(fid,'\n%s', 'dY4 = dq(11);');
fprintf(fid,'\n%s', 'dtheta4 = dq(12);');


fprintf(fid,'\n%s', ['gama = zeros(',num2str(m),',','1',');']);
fprintf(fid,'% Pupulate output. \n');
for i=1:m
    fprintf(fid,'\n%s',['gama(',num2str(i),')= ',char(content(i)),';']);
    disp(['gama(',num2str(i),')= ',char(content(i))]);
end
% end of for

% Close m.file
fclose(fid);


end

% end of code.
