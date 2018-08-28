##
## Kim Carter 2018.   Testing R hash package for hashtable speed
## 

library(hash)
h <- hash()

filename <- "testdata.tsv"
con <- file(filename,open="r")

# read whole file to memory first
date()
counter <- 0
t1 <- Sys.time();
while(TRUE)
{
        line <- readLines(con, n = 1)
        if ( length(line) == 0 )
        {
                break
        }

        cols <- strsplit(line,"\t")
        h[[cols[[1]][1]]] <- cols[[1]][2]

	counter<-counter+1

	paste(counter)
	if (counter %% 100000 == 0 )
	{
		t2 <- Sys.time()
		#print(t2-t1)
		d <- difftime(time1=t2,time2=t1,units="secs")
		cat(as.numeric(d),"\n")
		t1 <- t2
		#paste(date(), "reached ",counter,"records")
	}
		
}
close(con)

