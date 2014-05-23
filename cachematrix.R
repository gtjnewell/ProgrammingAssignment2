## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## cacheSolve returns the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    i <- x$getinverse()
    
    ## If i has been initialized, then the inverse of x has been
    ## previously computed
    if(!is.null(i)) {
      message("getting cached inverse matrix")
      return(i)
    }
    
    ## retrieve the matrix created by the call to makeCacheMatrix()
    data <- x$get()
    
    ## compute the inverse using the solve() function
    i <- solve(data, ...)
    
    ## add the computed inverse matrix to the cache
    x$setinverse(i)
    
    ## return the inverse
    i
}

