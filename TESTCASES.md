ProgrammingAssignment2 for Coursera R Programming Course - May 2014
========================================================

## Test cases
The two functions created for this assignment should:

1. Create the cacheMatrix object
2. Compute and return the inverse of the matrix object, returning a cached copy if the inverse has already been computed.

For the 2 x 2 matrix

    4   3
    3   2
    
The inverse is

    -2   3
     3  -4
     
Source: [www.mathwords.com][id]

[id]: http://www.mathwords.com/i/inverse_of_a_matrix.htm  "Mathwords.com Inverse Matrix"

## Test Case 1 - makeCacheMatrix
* Define a matrix mat
    
    `> mat <- matrix(c(4,3,3,2),2,2)`
    
    
...yields

         [,1] [,2]
    [1,]    4    3
    [2,]    3    2

* Create the cacheMatrix object by calling makeCacheMatrix()

     `> matCO <- makeCacheMatrix(mat)`

* Inspect the object using the get() function

      `> matCO$get()`

... yields

         [,1] [,2]
    [1,]    4    3
    [2,]    3    2

## Test Case 2 - cacheSolve

### 2.A First computation of matrix matCO

* Compute the inverse of matCO using the cacheSolve() function

    `> matCOinv <- cacheSolve(matCO)`

* Inspect the object using matCOinv$getinverse()

    `> matCOinv`

... yields

         [,1] [,2]
    [1,]   -2    3
    [2,]    3   -4

* This can also be inspected using the getinverse() function

    `> matCO$getinverse()`

### 2.B Second computation of matrix matCO

* Compute the inverse of matCO using the cacheSolve() function. This should return the cached copy. This is evidenced by the output of the message "getting cached inverse matrix"

    `> matCOinv <- cacheSolve(matCO)`

... yields

    `getting cached inverse matrix`
    
* Inspect the object using matCOinv$getinverse()

    `> matCOinv`

... yields

         [,1] [,2]
    [1,]   -2    3
    [2,]    3   -4

* This can also be inspected using the getinverse() function

    `> matCO$getinverse()`
