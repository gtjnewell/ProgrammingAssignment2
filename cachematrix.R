## The two functions created for this assignment should:
##
## 1. Create the cacheMatrix object
## 2. Compute and return the inverse of the matrix object, returning a cached copy 
##    if the inverse has already been computed.
##
## For the 2 x 2 matrix
## 
## 4   3
## 3   2
## 
## The inverse is
## 
## -2   3
##  3  -4
## 
## Source: http://www.mathwords.com/i/inverse_of_a_matrix.htm

## ASSUMPTION: the matrix suppiled is always invertible.

## makeCacheMatrix() - creates a special "matrix" object that can cache its inverse.
## Takes a matrix as input and creates a list containing four
##    functions: set(), get(), setinverse() and getinverse()
## This object enables the caching of the solve() function on a given matrix x
## Attribution: this function is modeled after the makeVector() function provided in the 
##   assignment.

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve() returns the inverse of the input matrix x using the object created
## by the call to makeCacheMatrix()
## If the inverse of x was previously computed then a cached copy of the inverse is
## returned.
## Attribution: this function is modeled after the cachemean() function provided in the 
##   assignment.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    i <- x$getinverse()
    
    ## If i has been initialized, then the inverse of x has been
    ## previously computed
    if(!is.null(i)) {
      message("getting cached inverse matrix")
      return(i)
    }
    
    ## the inverse needs to be computed
    ## retrieve the matrix created by the call to makeCacheMatrix()
    mat <- x$get()
    
    ## compute the inverse using the solve() function
    i <- solve(mat, ...)
    
    ## add the computed inverse matrix to the cache
    x$setinverse(i)
    
    ## return the inverse
    i
}

