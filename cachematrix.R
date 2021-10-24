## This function create a matrix that can cache its inverse.

## This function could get and set the value and also the inverse
## of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <<- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list( set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
  
}


## This function below will then find and return the inverse 
## of the vector created with the previous function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
