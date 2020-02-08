
disp('Performing GE.')

a = [2 1 -1 ; -3 -1 2 ; -2 1 2]

disp('The coefficient matrix is:')
disp(a)

b = [8 ; -11 ; -3]

function GE(a, b)
    c = [a b]

    disp('The augmented matrix is:')
    disp(c)
    
    l21 = c(2,1) / c(1,1)
    disp('R2 = R2 - ' + string(l21) + '*R1')
    c(2,:) = c(2,:) - l21*c(1,:)
    disp(c)
    
    l31 = c(3,1) / c(1,1)
    disp('R3 = R3 - ' + string(l31) + '*R1')
    c(3,:) = c(3,:) - l31*c(1,:)
    disp(c)
    
    l32 = c(3,2) / c(2,2)
    disp('R3 = R3 - ' + string(l32) + '*R2')
    c(3,:) = c(3,:) - l32*c(2,:)
    disp(c)
    
    l23 = c(2,3) / c(3,3)
    disp('R2 = R2 - ' + string(l23) + '*R3')
    c(2,:) = c(2,:) - l23*c(3,:)
    disp(c)
    
    l13 = c(1,3) / c(3,3)
    disp('R1 = R1 - ' + string(l13) + '*R3')
    c(1,:) = c(1,:) - l13*c(3,:)
    disp(c)
    
    l12 = c(1,2) / c(2,2)
    disp('R1 = R1 - ' + string(l12) + '*R2')
    c(1,:) = c(1,:) - l12*c(2,:)
    disp(c)
    
    
    x1 = c(1,4) / c(1,1)
    x2 = c(2,4) / c(2,2)
    x3 = c(3,4) / c(3,3)
    
    disp('x1, x2, x3 are:')
    disp([x1 x2 x3])

endfunction


//GE(a,b)


function[L,U]=LUdecompose(A)
    U=A
    m=det(U(1,1))
    n=det(U(2,1))
    a=n/m
    U(2,:)=U(2,:)-U(1,:)/(m/n)
    n=det(U(3,1));
    b=n/m;
    U(3,:)=U(3,:)-U(1,:)/(m/n)
    m=det(U(2,2))
    n=det(U(3,2))
    c=n/m
    U(3,:)=U(3,:)-U(2,:)/(m/n);
    L=[1,0,0;a,1,0;b,c,1]
    disp(U,'The upper triangular matrix')
    disp(L,'The lower triangular matrix')
end

function[B]=inverse(A)
    aug=[A,eye(n,n)];
    for j=1:n-1
        for i=j+1:n
            aug(i,j:2*n)=aug(i,j:2*n)-aug(i,j)/aug(j,j)*aug(j,j:2*n)
        end
    end
    for j=n:-1:2
        aug(1:j-1,:)=aug(1:j-1,:)-aug(1:j-1,j)/aug(j,j)*aug(j,:)
    end
    for j=1:n
        aug(j,:)=aug(j,:)/aug(j,j)
    end
    B=aug(:,n+1:2*n)
    disp(B,'The inverse of coeffecient is')  
end

n=3;
interuppt=0;
while interuppt~=1 do
    clc()
    printf('Enter the options\n')
    printf('1.Gaussian Elimination\n2.LU Decomposition\n3.Inverse\n4.Exit\n')
    op=input('Enter option number')
    select op
        case 1
            for i=1:n
                for j=1:n
                    x=input("Enter Coeffecient Matrix (3X3)");
                    coef(i,j)=x;
                end
            end
    
            for i=1:n
                z=input("Enter Constant Matrix")
                b(i,1)=z
            end
            [x]=GE([coef b])

        case 2
            for i=1:n
                for j=1:n
                    x=input("Enter Coeffecient Matrix (3X3)");
                    coef(i,j)=x;
                end
            end
            [L,U]=LUdecompose(coef)
            
        case 3
            for i=1:n
                for j=1:n
                    x=input("Enter Coeffecient Matrix (3X3)");
                    coef(i,j)=x;
                end
            end
            [B]=inverse(coef)
        end
        
        interuppt=input('Enter 1 to exit and 2 to continue')
end
