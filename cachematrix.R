## A pair of functions that cache the inverse of a matrix


## makeCacheMatrix: This function creates a special "matrix" object that can  
## cache its inverse.

makeCacheMatrix <- function( x = matrix() ) {
        
        m <- NULL
        
        ## Method to set the matrix
        set <- function( matrix ) {
                x <<- matrix
                m <<- NULL
        }
        
        ## Method to get the matrix
        get <- function() x
         
        ## Method to set the inverse of the matrix
        setinverse <- function(inverse)  m <<- inverse
        
        ## Method to get the inverse of the matrix
        getinverse <- function()  m
        
        ## Return a list of the methods
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve the
## inverse from the cache.
cacheSolve <- function(x, ...) {
        
        m <- x$getinverse()
        
        ## Just return the inverse if its already set
        if( !is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        
        ## Get the matrix from our object
        data <- x$get()
        
        ## Calculate the inverse
        m <- solve(data) 
        
        ## Set the inverse to the object
        x$setinverse(m)
        
        ## Return the matrix
        m
        
}

