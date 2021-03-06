## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## A matrix that can have an inverse, it suports set and get matrix and also set and get the inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}

## below is that i got when i tested the logic
> beini_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
> beini_matrix$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> beini_matrix$getInverse()
NULL
> cacheSolve(beini_matrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(beini_matrix)
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> beini_matrix$getInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> beini_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))
> beini_matrix$get()
     [,1] [,2]
[1,]    2    1
[2,]    2    4
> beini_matrix$getInverse()
NULL
> cacheSolve(beini_matrix)
           [,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333
> cacheSolve(beini_matrix)
getting cached data
           [,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333
> beini_matrix$getInverse()
           [,1]       [,2]
[1,]  0.6666667 -0.1666667
[2,] -0.3333333  0.3333333
