#!/usr/bin/env Rscript

filenames <- list.files(path = "data", pattern="*.RData")

resave <- function(file){
    e <- new.env(parent = emptyenv())
    filename <- paste("./data/", file, sep="")
    load(filename, envir = e)
    objs <- ls(envir = e, all.names = TRUE)
    for(obj in objs) {
        .x <- get(obj, envir =e)
        message(sprintf('Saving %s as %s.csv', obj,obj) )
        write.csv(.x, file = paste0("./csvs/", paste0(obj, '.csv')))
    }
}

lapply(filenames, resave)
