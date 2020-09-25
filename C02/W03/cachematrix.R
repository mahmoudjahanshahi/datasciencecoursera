## A function that is able to cache potentially time-consuming 
## matrix inversion computations

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    
    xtr <- NULL
    set <- function(y) {
      x <<- y
      xtr <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) xtr <<- solve 
    getsolve <- function() xtr
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## This function computes the inverse of the special "matrix" returned by
## `makeCacheMatrix` function. If the inverse has already been calculated, 
## then `cacheSolve` retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

    xtr <- x$getsolve()
    if(!is.null(xtr)) {
      message("getting cached data")
      return(xtr)
    }
    data <- x$get()
    xtr <- solve(data, ...)
    x$setsolve(xtr)
    xtr
}
