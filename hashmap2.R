##
## Kim Carter 2018.   Testing R hashmap package for hashtable speed
## 

library(hashmap)

filename <- "testdata.tsv"
con <- file(filename,open="r")

date()
counter <- 0
t1 <- Sys.time();

# there's no nice init for this, so we have to create it with the first row of the file
line <- readLines(con, n = 1)
cols <- strsplit(line,"\t")
hm<-hashmap(cols[[1]][1],cols[[1]][2])
counter<-counter

while(TRUE)
{
        line <- readLines(con, n = 1)
        if ( length(line) == 0 )
        {
                break
        }

        cols <- strsplit(line,"\t")
        hm$insert(c(cols[[1]][1]),c(cols[[1]][2]))

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

hm$keys()
