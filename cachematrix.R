## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The function create an object containing a list of functions 
## providing an access to the original and cached inverted matrices
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(
    set = set, 
    get = get,
    setsolve = setsolve,
    getsolve = getsolve
    )
}


## The function accepts an object constructed by makeCacheMatrix function. 
## When called it returns cached inverted matrix value. 
## If the cached value is missing, the function calculates and caches it.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
