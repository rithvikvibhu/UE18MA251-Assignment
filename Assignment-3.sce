/*
Assignment 3 - Projections by Least Squares

Sample Input:
A:
[1, -1
1, 1
1, 2]

B:
[1,
1,
3]
*/

function[C,D]=bestfit(A,B)
x=(A'*A)\(A'*B);
C=x(1,1);
D=x(2,1);
endfunction

A = x_matrix("Enter matrix:",zeros(3,2));
B = x_matrix("Enter matrix:",zeros(3,1));
disp(A, 'A is');
disp(B, 'B is');

disp('')
[C,D]=bestfit(A,B);
disp('C is ' + string(C));
disp('D is ' + string(D));

disp('The best fit line is');
disp('   b = C + Dt')
disp('=> b = ' + string(C) + ' + ' + string(D) + 't')
