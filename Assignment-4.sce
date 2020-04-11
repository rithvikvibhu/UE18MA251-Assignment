/*
Assignment 4 - Gram Schmidt Orthagonalization and Numerically Largest Eigen value of A

Sample Inputs:
For Gram Schmidt Orthagonalization:
[1 0 1
 1 0 0
2 1 0]

For Eigen values and vectors:
[3 -2 5
 -2 3 6
5 6 4]

For Numerically Largest Eigen value of A:
[3 0 1
2 2 2
4 2 5]
and
[1 1 1]
*/
function gramschmidt(mat)

    // size of matrix
    [m,n] = size(mat);
    
    for i=1:n
    
        // select ith column
        V(:,i) = mat(:,i);
        for j=1:i-1
            R(j,i) = V(:,j)'*mat(:,i);
            V(:,i) = V(:,i) - R(j,i)*V(:,j);
        end
        R(i,i) = norm(V(:,i));
        V(:,i) = V(:,i) / R(i,i);
        
    end
    disp(V, 'Q = ');
endfunction


function eigen1(mat)
    
    lam = poly(0,'lam')
    lam = lam
    charMat = mat - lam*eye(3,3)
    disp(charMat, 'Characteristic Matrix is')
    
    charPoly = poly(mat,'lam')
    disp(charPoly, 'Characteristic Polyomial is')
    
    lam = spec(mat)
    disp(lam, 'The Eigen Values are')
    
    [n,m] = size(mat)
    x = []
    for k = 1:3
        B = mat - lam(k)*eye(3,3); // characteristic matrix
        C = B(1:n-1,1:n-1); // coeff matrix for reduced system
        b = -B(1:n-1,n); // RHS vector for reduced system
        y = C \ b; // sol for reduced system
        y = [y;1]; // complete eigen vector
        y = y/norm(y); // unit eigen vector
        x = [x y];
    end
    
    disp(x,'The Eigen Vectors are');
endfunction


function rayleigh(mat, U)
    u0 = U';
    disp(u0, 'The initial vector');
    
    v = mat * u0;
    a = max(u0);
    disp(a, 'First approx');
    
    while(abs(max(v)- a) > 0.002)
        disp(v, 'current eigen vector is');
        a = max(v);
        disp(a, 'current eigen value is');
        u0 = v / max(v);
        v = mat * u0;
    end
    format('v', 4);
    disp(max(v), 'The largest Eigen value is');
    format('v', 5);
    disp(u0, 'Corresponding Eigen Vector');
endfunction

A = x_matrix("Enter matrix for Gram Schmidt Orthagonalization:",zeros(3,3));
gramschmidt(A)
A = x_matrix("Enter matrix for Eigen values and vectors:",zeros(3,3));
eigen1(A);
A = x_matrix("Enter input matrix for Numerically Largest Eigen value:",zeros(3,3));
U= x_matrix("Enter initial matrix matrix for Numerically Largest Eigen value:",zeros(1,3));
rayleigh(A,U);
