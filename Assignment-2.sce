/*
Assignment 2 - Column spanning and finding 4 fundamental subspaces.

Sample Input:

[4, 5, 9
6, 5, 1
3, 4, 8]
*/

function columnspan(mat,n)
    disp("Column Span:");
    
    // For forming upper triangular matrix
    for i=1:n-1
        for j=i+1:n
            mat(j,:) = mat(j,:) - (mat(j,i)/mat(i,i)) * mat(i,:);
        end
        disp(mat);
    end
    
    // Divide by pivot element to make all pivots 0.
    for i=1:n
        if(mat(i,i)<>0)
            mat(i,:)=mat(i,:)/mat(i,i);
        end
    end
    disp(mat)
    
    // List columns with pivot element.
    for i=1:n
        for j=i:n
            if(mat(i,j)<>0)
                disp('Column ' + string(j) + ' has a pivot element: ' + string(mat(i,j)));
                break
            end
        end
    end
endfunction

function fundamental_sub_spaces(mat)
    disp("Fundamental Spaces:");
    [m,n] = size(mat);
    disp('Size of matrix is ' + string(m) + 'x' + string(n) + '.')
    
    // Calculate row reduced form of matrix
    [v,pivot] = rref(mat);
    disp(v);
    rank = length(pivot);
    disp('Rank is ' + string(rank))
    
    // Column space
    cs=mat(:,pivot);
    disp(cs,'Column Space is ');
    
    // Null space
    ns=kernel(mat);
    disp(ns,'Null Space is ');
    
    // Row space
    rs=v(1:rank,:)';
    disp(rs,'Row Space is ')
    
    // Left null space
    lns=kernel(mat');
    disp(lns,'Left Null Space is ');
endfunction


// Main code

// get input
mat = x_matrix("Enter matrix:", zeros(3,3));
disp(mat,"Entered matrix is");

// Q1. Span column space
columnspan(mat,3);

disp('')

// Q2. Find 4 fundamental subspaces
fundamental_sub_spaces(mat);
