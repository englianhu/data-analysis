suppressPackageStartupMessages(require('BBmisc', quietly = TRUE))

pkgs <- c('devtools', 'plyr', 'dplyr', 'magrittr', 'SparseM', 'Matrix', 'ffbase', 
          'BioGeoBEARS', 'doParallel', 'Matrix.utils', 'tidyverse')
suppressAll(lib(pkgs))
rm(pkgs)

nodes <- detectCores()
cl <- makeCluster(nodes)
registerDoParallel(cl)

## 3 dies
D6 <- 1:6; names(D6) <- rep('D6', 6) ## 6 dimensions die
D4 <- 1:4; names(D4) <- rep('D4', 4) ## 4 dimensions die
D8 <- 1:8; names(D8) <- rep('D8', 8) ## 8 dimensions die

D1 <- c(D6, D4, D8)
D1

po <- 6 * 4 * 8 ## Possible outcome
allo <- expand.grid(D6, D4, D8) %>% ## All possible outcome
   tbl_df %>% 
   dplyr::rename(D1 = Var1, D2 = Var2, D3 = Var3) %>% 
   mutate(PO = D1 + D2 + D3)
rm(D6, D4, D8)
allo

res <- allo %>% ## All possible outcome in probabilities
   dplyr::count(PO) %>% 
   dplyr::rename(m = n) %>% 
   mutate(forecast = m/sum(m))
res

sample(1:6, 1) +  sample(1:4, 1) + sample(1:8, 1) ## Simulate 3 dies

# https://stackoverflow.com/questions/15642722/why-doesnt-the-plyr-package-use-my-parallel-backend
#> system.time({
#+     mc <- suppressAll(ldply(1:10000, function(x) { ## Monte Carlo method simulate 10000 times
#+         data.frame(D1 = sample(1:6, 1), D2 = sample(1:4, 1), D3 = sample(1:8, 1)) %>% 
#+             mutate(PO = D1 + D2 + D3)
#+     }, .parallel = TRUE) %>% tbl_df)
#+ })
#user  system elapsed 
#5.64    0.95    7.59 
#
#> system.time({
#+     mc <- ldply(1:10000, function(x) { ## Monte Carlo method simulate 10000 times
#+         data.frame(D1 = sample(1:6, 1), D2 = sample(1:4, 1), D3 = sample(1:8, 1)) %>% 
#+             mutate(PO = D1 + D2 + D3)
#+     }) %>% tbl_df
#+ })
#user  system elapsed 
#14.14    0.00   14.22

mc <- suppressAll(ldply(1:10000, function(x) { ## Monte Carlo method simulate 10000 times
    data.frame(D1 = sample(1:6, 1), D2 = sample(1:4, 1), D3 = sample(1:8, 1)) %>% 
    mutate(PO = D1 + D2 + D3)
   }, .parallel = TRUE) %>% tbl_df)
mc

mr <- mc %>% dplyr::count(PO) %>% ## Summarise the outcome of Monte Carlo Simulation
   mutate(res = n/sum(n))

cp <- join(res, mr) %>% tbl_df %>% ## Mean Squared Error
   mutate(MSE = mean((forecast - res)^2))
cp

## Markov Chain
alloS <- allo %>% mutate(stats = factor(paste0(D1, D2, D3))) ## added states
alloS

mcS <- mc %>% mutate(from = factor(paste0(D1, D2, D3)),      ## added trans
                     to = factor(lead(from, 1)), 
                     trans = paste(from, '>>>', to))
mcS

hmm1 <- mcS %>% dplyr::count(from) %>%                       ## count states from
  tbl_df %>%                   
  mutate(p.stats = n/sum(n)) %>% 
  dplyr::rename(n.stats = n)
mcS <- join(mcS, hmm1) %>% tbl_df
hmm1

hmm2 <- mcS %>% dplyr::count(trans) %>%                      ## count states trans
  tbl_df %>%  
  mutate(p.trans = n/sum(n)) %>% 
  dplyr::rename(n.trans = n)
mcS <- join(mcS, hmm2) %>% tbl_df
hmm2

#https://www.rdocumentation.org/packages/BioGeoBEARS/versions/0.2.1/topics/expand.grid.jc
#> system.time(mtx <- expand.ffgrid(ff(mcS$from), ff(mcS$to)))
#user  system elapsed 
#4.45    3.30    9.74 
#
#> system.time(mtx <- expand.grid(mcS$from, mcS$to))
#user  system elapsed 
#1.92    0.25    2.18 
#
#> system.time(mtx <- expand.grid.alt(mcS$from, mcS$to))
#user  system elapsed 
#8.05    0.95    9.03 
#
#> system.time(mtx <- expand.grid.jc(mcS$from, mcS$to))
#user  system elapsed 
#0.44    0.17    0.61 
mtx <- expand.grid.jc(mcS$from, mcS$to)
colnames(mtx) <- c('from', 'to')

# computer will overhault.
#as_data_frame(mtx) %>% join(mcS[c('from', 'to', 'trans', 'p.trans')], by = c('from', 'to'))
mtx <- Matrix(mtx)
mcS.mx <- mcS[c('from', 'to', 'p.trans')] %>% 
  mutate(from = as.numeric(from), to = as.numeric(to)) %>% 
  as.matrix %>% Matrix
# https://www.rdocumentation.org/packages/Matrix.utils/versions/0.9.7/topics/merge.Matrix
#'@ mtx1 <- merge.Matrix(mtx, mcS.mx, by.x = mtx[,1], by.y = mcS.mx[,1])




## matrix form
#mx <- matrix(0, nc = length(hmm1$from), 
#             nr = length(hmm1$from), 
#             dimnames = list(hmm1$from, hmm1$from))
#diag(mx)<- hmm1$p.from
#dimnames(mx)<- list('from', 'to')

# measure 3 transmit...


# Reference
# http://www.cnblogs.com/skyme/p/4651331.html
# https://wenku.baidu.com/view/75b3854acc22bcd127ff0c1b
# https://www.pinnacle.com/en/betting-articles/Betting-Strategy/How-to-use-kelly-criterion-for-betting/2BT2LK6K2QWQ7QJ8
# https://community.rstudio.com/t/hidden-markov-mdel/13741/2

## Let say I use fit windows as 10000 times, now I start betting.
## Due to the banker has 0.00000433 edge, here I need to overcome the banker's vigorish.
st <- function(br, x) {
   
  }

bt <- ldply(1:10000, function(x) { ## Monte Carlo method simulate 10000 times
    rs <- sample(1:6, 1) +  sample(1:4, 1) + sample(1:8, 1)
    
   }) %>% tbl_df %>% 
   dplyr::rename(PO = V1)


stopCluster(cl)



