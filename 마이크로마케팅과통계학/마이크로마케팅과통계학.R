# section 3.1

a <- 1
a
A

b<-2
b

c<-3
c

d<- 3.5; d

seq(0, 1, length.out = 11)

help(seq)

df_csv_exam <- read.csv("/Users/YJ/Documents/KU/csv_exam.csv")
df_csv_exam

df_midterm <- data.frame(englisth=c(90,80,60,70),
                         math=c(50,60,100,20),
                         clss=c(1,1,2,2))
df_midterm

write.csv(df_midterm, file="/Users/YJ/Documents/KU/df_midterm.csv")





str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good")
str5

str1 + 2


library(ggplot2)

x<-c("a","a","b","c")
qplot(x)


english <- c(90, 80, 60, 70)
english

math <- c(50, 60, 100, 20)
math

df_midterm <- data.frame(english, math)
df_midterm


class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)
str(df_midterm)


df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm


?read.csv
help(read.csv)


df_csv_exam <- read.csv("/Users/YJ/Documents/KU/학부연구생/마이크로마케팅과통계학/csv_exam.csv")
df_csv_exam


df_midterm <- data.frame(english=c(90, 80, 60, 70),
                         math=c(50, 60, 100, 20),
                         class=c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file="/Users/YJ/Documents/KU/학부연구생/마이크로마케팅과통계학/df_midterm.csv")


a <- 1
b <- 1L
c <- "1"

mode(a); typeof(a)
mode(b); typeof(b)
mode(c); typeof(c)


A1 <- F
B1 <- FALSE
C1 <- T
D1 <- TRUE

mode(A1); typeof(A1)
mode(B1); typeof(B1)
mode(C1); typeof(C1)
mode(D1); typeof(D1)

A2 <- "F"
B2 <- "FALSE"
C2 <- "T"
D2 <- "true"

mode(A2); typeof(A2)
mode(B2); typeof(B2)
mode(C2); typeof(C2)
mode(D2); typeof(D2)


a <- 0/0
a

b <- Inf-Inf
b

c <- 2*Inf
c

d <- Inf/Inf
d


a <- 1
b <- 1L
c <- "1"


x <- c(1, 2.1, 3.2, 5)


x1 <- data.frame(var1 = c(1, 2, 3))


x3 <- array(1:20, dim = c(2, 5, 2))
x3  


x4 <- list(f1 = a,
           f2 = x1,
           f3 = x2,
           f4 = x3)


blood.type <- factor(c("A", "B", "AB", "O", "O"), levels = c("A", "B", "AB", "O"))
table(blood.type)


# -----기말----

getwd()
boston.housing.df <- read.csv("/Users/YJ/Documents/KU/학부연구생/마이크로마케팅과통계학/BostonHousing.csv", header=TRUE)

# boston <- read.csv("/Users/YJ/Documents/KU/학부연구생/마이크로마케팅과통계학/BostonHousing.csv", header=TRUE)
# error

head(boston.housing.df, 9)
summary(boston.housing.df)

# compute mean, standard dev., min , max, median, length, and missing values of CRIM
mean(boston.housing.df$CRIM)
sd(boston.housing.df$CRIM)
min(boston.housing.df$CRIM)
max(boston.housing.df$CRIM)
median(boston.housing.df$CRIM)
length(boston.housing.df$CRIM)

# find the number of missing balues of variable CRIM

sum(is.na(boston.housing.df$CRIM))

# compute mean, standard dev. min, max, median, length, and missing values for all
# variables
data.frame(mean=sapply(boston.housing.df, mean),
           sd=sapply(boston.housing.df, sd),
           min=sapply(boston.housing.df, min),
           max=sapply(boston.housing.df, max),
           median=sapply(boston.housing.df, median),
           length=sapply(boston.housing.df, length),
           miss.val=sapply(boston.housing.df, function(x)
             sum(length(which(is.na(x))))))


#### Table 4.4

round(cor(boston.housing.df), 2)


#### Figure 3.4
## simple heatmap of correlations (without values)

heatmap(cor(boston.housing.df), Rowv = NA, Colv = NA)
heatmap(cor(boston.housing.df))


## simple heatmap of correlations (with values)
library(gplots)
heatmap.2(cor(boston.housing.df), Rowv = FALSE, Colv = FALSE, dendrogram = "none",
          cellnote=round(cor(boston.housing.df), 2),
          notecol = "black", key = FALSE, trace = "none", margins = c(10,10))


#### Table 4.5

table(boston.housing.df$CHAS)


#### Table 4.6

# create bins of size 1

boston.housing.df$RM.bin <- .bincode(boston.housing.df$RM, c(1:9))

# comput the average of MEDV by (binned) RM and CHAS
# in aggregate() use the argument by = to define the list of aggregating variables,
# and FUN= as an aggregating function
aggregate(boston.housing.df$MEDV, by = list(RM=boston.housing.df$RM.bin,
                                            CHAS=boston.housing.df$CHAS), FUN=mean)


help(.bincode)


x <- c(0, 0.01, 0.5, 0.99, 1)

b <- c(0, 0, 1, 1)

.bincode(x, b, TRUE)
.bincode(x, b, FALSE)

boston.housing.df$RM.bin <- .bincode(boston.housing.df$RM, c(1:9))
boston.housing.df[1:100, c(6, 15)]


# 4.8 주성분 분석-추가
x<-c(4.0, 4.2, 3.9, 4.3, 4.1)
mean(x)
var(x)

y<-c(2.0, 2.1, 2.0, 2.1, 2.2)
mean(y)
var(y)

z<-c(0.60, 0.59, 0.58, 0.62, 0.63)
mean(z)
var(z)

df <- data.frame(x, y, z)

cov(df)


#### Table 4.10
cereals.df <- read

View(cereals.df)

head(cereals.df)

pcs <- prcomp(data.frame(cereals.df$calories, cerals.df$rating))

summary(pcs)

pcs$rot

scores <- pcs$x

head(scores, 5)

#### Table 8.4
library(e1071)
# 라이브러리 "e107"은 오픈 소스 웹 콘텐츠 관리 시스템(CMS)입니다. 
# e107은 PHP로 작성되었으며, 사용자가 웹 사이트를 구축하고 관리할 수 있는 다양한 기능을 제공합니다.
delays.df <- read.csv("/Users/YJ/Documents/KU/학부연구생/마이크로마케팅과통계학/FlightDelays.csv")
head(delays.df)
tail(delays.df)


class(delays.df$DAY_WEEK)
class(delays.df$DEP_TIME)
class(delays.df$CRS_DEP_TIME)

# change numerical variables to categorical first
delays.df$DAY_WEEK <- factor(delays.df$DAY_WEEK)
delays.df$DEP_TIME <- factor(delays.df$DEP_TIME)
class(delays.df$DAY_WEEK)
class(delays.df$DEP_TIME)


# create hourly bins departure time
delays.df$CRS_DEP_TIME <- factor(round(delays.df$CRS_DEP_TIME/100))
class(delays.df$CRS_DEP_TIME)
head(delays.df)


# Create training and validation sets.
selected.var <- c(10, 1, 8, 4, 2, 13)

train.index <- sample(c(1:dim(delays.df)[1]), dim(delays.df)[1]*0.6)

train.df <- delays.df[train.index, selected.var]
                      
valid.df <- delays.df[-train.index, selected.var]

head(train.df)


# run naive bayes
delays.nb <- naiveBayes(Flight.status ~., data = train.df)
delays.nb


#### Table 8.5

# use prop.table() with margin = 1 to convert a count table to a proportion table,
# where each row sums up to 1 (use margin = 2 for column sums).
prop.table(table(train.df$Flight.Status, train.df$DEST), margin = 1)


## Create training and validation sets.
selected.var <- c(10, 1, 8, 4, 2, 13)

train.index <- sample(c(1:dim(delays.df)[1]), dim(delays.df)[1]*0.6)
