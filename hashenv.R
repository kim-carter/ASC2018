##
## Kim Carter 2018.   Testing R environments for hashtable speed
## 

he <- new.env(hash = TRUE)

filename <- "testdata.tsv"
con <- file(filename,open="r")

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
        he[[cols[[1]][1]]] <- cols[[1]][2]

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
