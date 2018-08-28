##
## Kim Carter 2018.   Testing R hashmap package for hashtable speed.  Step 2 tests insert then search performance
## 


library(hashmap)

filename <- "testdata.tsv"
con <- file(filename,open="r")

line <- readLines(con, n = 1)
cols <- strsplit(line,"\t")
hm<-hashmap(cols[[1]][1],cols[[1]][2])
while(TRUE)
{
        line <- readLines(con, n = 1)
        if ( length(line) == 0 )
        {
                break
        }

        cols <- strsplit(line,"\t")
        hm$insert(c(cols[[1]][1]),c(cols[[1]][2]))
}
close(con)

filename <- "testsearch.tsv"
con <- file(filename,open="r")

# read whole file to memory first

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
 
	if (hm$has_key(cols[[1]][2]))
	{
		tmp <- hm[[cols[[1]][2]]]
	} else {
		# do nothing
	}

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



