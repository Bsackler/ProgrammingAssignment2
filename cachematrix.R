## cachematrix.R
## Pair of functions that compute the inverse of a provided matrix. 
## Inverts from a cached solution if one is present.



## Creates a (preferably square) matrix that includes methods to cache its own inverse.

makeCacheMatrix <- function(x = matrix()) {
        inverseVal <- NULL
        
        set <- function(mVal){
                x <<- mVal                      #sets the empty matrix with a new value
                inverseVal <<- NULL                #resets the cache
        }
        
        get <- function() x                     #returns value of matrix
        
        setInverse <- function(inverse) inverseVal <<- inverse          #Essentially fills the cache with the inverse
        getInverse <- function() inverseVal                             #retreives what's in the cache
        
}


## Solves the matrix object created above. Will use getter/setter methods to check/set cached result.

cacheSolve <- function(x, ...) {
        m <- x$getInverse()             #getting cached value from matrix object
        
        if(!is.null(m)) {
                message("Cached inverse present")               #returning from cache if nessecary
                return(m)
        }
        
        data <- x$get()                 #'gets' matrix object and solves.
        m <- solve(data)
        x$setInverse(data)              #fills cache
        
        return(data)                    #returns inverse.

}
