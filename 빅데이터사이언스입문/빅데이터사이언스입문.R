# 1주차 기본 설명
? mean
x <- c(0:10, 50)
x
xm <- mean(x)
c(xm, mean(x, trim = 0.10))
# trim 옵션: 10% 절사평균은 데이터를 크기 순으로 정렬한 다음에
#            가장 작은 데이터 10%와 가장 큰 데이터 10%를 제외한 나머지 데이터들의 평균입니다.

# control + l : 콘솔창 지우기

##########################
# Chap5
##########################

a <- 3
b <- 2
c <- a + b

A <- 4

abc <- 5
.subject <- abc
3.desk <- 3
aaa. <- 1; bbb. <- 2

rm(A)
A



grade<-c(1,2,3,4)
grade

mydata <- data.frame(age=numeric(0), gender=numeric(0), weight=numeric(0))

mydata<-edit(mydata)

str(mydata)

mydata


# R CODE 5.4

getwd()
setwd("/Users/YJ/Documents/KU/학부연구생/빅데이터사이언스입문")
getwd()

table31 <- read.table(file="/Users/YJ/Documents/KU/학부연구생/빅데이터사이언스입문/table31.txt", header=TRUE)
table31
# 윈도우의 경우 EUC-KR의 인코딩을 사용하는데, 맥이나 리눅스에서는 UTF-8을 사용하기 때문에 발생하는 에러입니다.
# 스크립트의 UTF-8 설정과는 별개인 듯 합니다.
x<-read.csv(file="/Users/YJ/Documents/KU/학부연구생/빅데이터사이언스입문/mydata1_1.csv", header = TRUE, fileEncoding = "euc-kr")
str(x)


# -------------------
# R code 5.4
getwd()
setwd("")
getwd()

? rm
# -------------------
# R code 5.5
table31 <- read.table(file="/Users/YJ/Documents/KU/학부연구생/빅데이터사이언스입문/table31.txt", header=TRUE)
View(table31)


x <- read.csv("mydata1_1.csv", header=TRUE)


# -------------------
# R code 5.6
x <- read.csv(file="/Users/YJ/Documents/KU/학부연구생/빅데터이언스입문/mydata1_1.csv", header=TRUE)
str(x)


data()
data(iris)
str(iris)


x <- c(1,2,3)
print(x)
x


x<-seq(from=0, to=1, by=0.1)
x

write(x, file="output.txt")

xx<-matrix(1:20, 4, 5)
xx

write.table(xx, file="table.txt")

write.table(xx, file="table1.csv")


c1 <- T; c2 <- TRUE

a <- 1
b <- 1L
c <- "1"

mode(a); typeof(a)
mode(b); typeof(b)
mode(c); typeof(c)
View(x)


A1 <- F
B1 <- FALSE
C1 <- T
D1 <- TRUE



a <- c(1,2, 10)
mean(a)
help(mean)


fruit <- c(5, 3, 2)
fruit

names(fruit) <- c("apple", "orange", "peach")
names(fruit)
fruit
fruit[c("apple", "peach")]

fruit1 <- setNames(c(5,3,2), c("apple","orange","peach"))
names(fruit1)
fruit1


# R code 5.21
a <- c(1, 2, 3)
a[5] <- 5
a


# R code 5.22
x <- c(1:6)
append(x, 55, after=5)
append(x, -55, after=0)


# R code 5.23
(x <- seq(from=0, to=1, by =0.1))
y <- seq(from=0, to=1, length=11)
z <- 1:10
3:-3
rep(2, 10)


help(seq)

seq(0, 1, length.out = 11)
seq(0, 1, length = 11)
seq(stats::rnorm(20))
seq(1, 9, by=2)
seq(1, 9, by=pi)
seq(1, 6, by =3)
seq(1.575, 5.125, by=0.05)
seq(17)


help(rep)

rep(1:4, 2)

rep(1:4, each = 2)
rep(1:4, c(2,2,2,2))
rep(1:4, c(2,1,2,1))


## R code 5.24
x <- 1:5; y <- c(2,2,2,2,2) # y<-rep(2.5)
x+y
x-y
x*y
x/y
x^y


# R code 5.25
x <- 1:3
z <- rep(3, 5)
x+z


# R code 5.26
x <- 1:10; y <- rep(5,10); z <- x<5
z
x <= 5
x == 5
X = 5

(x>5)&(y<2)
(x<5)|(y<2)


# R code 5.27
  # is.na()
  # NA
  # NaN
  # InF
  # null

x <- c(1,2,3,NA,5)
x
is.na(x)

x1 <- c(1,2,3,na,5)
x1
x2 <- c(1,2,3, Na,5)
x2
x3 <- c("a", "b", "NA", NA)
x3


# R code 5.28
x <- -10:10; x[3]
x
x[1:3]
x[c(1,3,5)]
x[-2]
-x[2]
x
x[-c(1, 3, 5)]

x <- c(1, 2, 3, NA, 5)
x

is.na(x)
!is.na(x)
x[!is.na(x)]
x[is.na(x)]
x[is.na(x)] <- 4
x


# R code 5.29
x <- c(1:10)
x

x > 5

y <- x[x>5]
y

x <- c(1,3,5,7,9,10)
x > 5
y <- x[x>5]
y

x <- c(3, 5,7)
y <- y[x>5]
y

# R code 5.30

# matrix()

x <- matrix(1:12, 3, 4)
x

y <- matrix(2, 4, 5)
y


# R code 5.31

x <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow=T)
x

y<- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=F)
y


# R code 5.32

# cbind()
# rbind()

x <- 1:5
y <- 6:10

B <- matrix(0, 4, 5)
B

cbind(B, 1:5)

A <- matrix(1:12, 3, 4)
B <- matrix(1:12, 3, 4)
C <- cbind(A, B)
C


# R code 5.33

A <- matrix(1:12, 3, 4)
B<- matrix(1:12, 3, 4)

A
B
A+B
A-B
A*B 
A/B


# R code 5.34

matrix(1:20, 4, 5) + matrix(1:10, 2, 5)


A <- matrix(1:6, 2, 3)
B <- matrix(1:6, 2, 3)
C <- matrix(1:6, 3, 2)
A
B
C
A+B
A-B
A*B
A/B

A%*%B
A%*%C


# R code 5.35

#colnames(), rownames()
# nrow() :
# ncol() :

x <- matrix(1:12, 3, 4)
x
nrow(x)

ncol(x)

colnames(x) <- c("alpha", "beta", "gama", "delta")

rownames(x) <- c("A", "B", "C")

x

x[1,]
x[, 3]

x[ ,alpha]

x[, "alpha"]

x["B", ]


# R code 5.36
x <- array(1:12, dim=c(3,4))
x

y <- array(x, dim=c(3, 2, 2))
y


# R code 5.37
x<- array(1:36, dim=c(3,4,3))
x

x[,,2]


# R code 5.38
blood.type <- factor(c("A", "A", "AB", "O", "O"), levels=c("A", "B", "AB", "O"))
table(blood.type)


# R code 5.39
blood.type1 <- c("A", "B", "AB", "O", "O") 
table(blood.type1)
str(blood.type)
str(blood.type1)


# supplement
gender = c("Male", "Female", "Female", "Male", "Male")
gender
str(gender)

f.gender=factor(gender)
f.gender
str(f.gender)

income=c("low", "low", "medium", "high", "medium")
income
str(income)

f.income=factor(income)
f.income
str(f.income)


f.income=factor(c("low", "low", "medium", "high", "medium"), order=T, level=c("low", "medium", "high"))
f.income


# R code 5.40
a <- data.frame(x=c(10, 20, 30), y = c("A3031", "A302", "A303"))
a

x <- c(10, 20, 30)
y <- c("A301", "A302", "A303")
z <- data.frame(score=x, ID=y)
z


# R code 5.41
x <- c(10, 20, 30)
y <- c("A301", "A302", "A303")
z <- data.frame(ID=y, score = x)
z


# R code 5.42
da.1 <- data.frame(x=1:5, y=c('a', 'b', 'c', 'd', 'e'))
str(da.1)

da.2 <- data.frame(x=1:5, y=c('a', 'b', 'c', 'd', 'e'), stringsAsFactors = T)
str(da.2)
da.2


# R code 5.45
x <- data.frame(a=1:10, b=c(1,2, NA, 3, 5, 6, 7, NA, 9, 10))
cumsum(x)
cumsum(na.omit(x))

sum(x)
sum(x$a)
sum(x$b)

cumsum(x)
cumsum(x$a)
cumsum(x$b)

cumprod(x)
cumprod(x$a)
cumprod(x$b)

cummin(x)
cummin(x$a)
cummin(x$b)

cummax(x)
cummax(x$a)
cummax(x$b)


# R code 5.46
a <- data.frame(x=c(5, 10, 15), y = c("a", "b", "c"))
b <- data.frame(z=c(10, 20, 30))
cbind(a, b)
a1 <- data.frame(x = c(20, 25, 30), y = c("d", "e", "f"))
rbind(a, a1)


# R code 5.47
a <- data.frame(Team=c("A", "B", "C", "D"), score=c(93, 95, 97, 100))
b <- data.frame(Team=c("A","B","E"), score2=c(85,75,90))
merge(a, b, by = "Team")
merge(a, b, by = "Team", all = T)


# R code 5.48
# with()
# head():
# tail():

install.packages("MASS")
library(MASS)

x <- Cars93
str(x)

x1 <- (Cars93$Price-mean(Cars93$Price))/sd(Cars93$Price)

x2 <- with(Cars93, (Price-mean(Price)) /sd(Price))

head(x1); head(x2, 3)
tail(x1, 3); tail(x2, 5)


# R code 5.4
Hong <- list(kor.names="홍길동", eng.name = "gil-dong", age = 45, married = T,
             mo.child = 2, child.ages = c(15, 12))
Hong$age
Hong["age"]
Hong$child.age[2]
str(Hong)


# R code 5.50
Hong[[2]]


# R Code 5.51
Hong[c(1,2)]
########

install.packages("gapminder")
help(package = "gapminder")
library(gapminder)
?gapminder
gapminder

head(gapminder)

tail(gapminder)

library(dplyr)
glimpse(gapminder)

gapminder$lifeExp
gapminder$gdpPercap

gapminder[, c('lifeExp', 'gdpPercap')]
gapminder %>% select(gdpPercap, lifeExp)

# 요약통계량과 상관관계
summary(gapminder$lifeExp)
summary(gapminder$gdpPercap)
cor(gapminder$lifeExp, gapminder$gdpPercap)


opar = par(mfrow=c(3,2))
hist(gapminder$lifeExp)
hist(gapminder$gdpPercap, nclass = 50)
# hist(sqrt(gapminder$gdpPercap), nclass=50)
hist(log10(gapminder$gdpPercap), nclass=50)
plot(log10(gapminder$gdpPercap), gapminder$lifeExp, cex=.5)
par(opar)


library(ggplot2)

mpg %>% ggplot(aes(class, hwy)) + geom_boxplot()

# 4.1.1 gapminder 데이터 예
install.packages("gapminder")
help(package = "gapminder")
library(gapminder)
?gapminder
gapminder


# 4.1 시각화의 중요성
head(gapminder)

tail(gapminder)


# 4.1.1 gapminder 데이터 예
library(dplyr)
glimpse(gapminder)


gapminder$lifeExp
gapminder$gdpPercap

gapminder[, c('lifeExp', 'gdpPercap')]

gapminder %>% select(lifeExp, gdpPercap)


# 요약통계량과 상관관계
summary(gapminder$lifeExp)
summary(gapminder$gdpPercap)
cor(gapminder$lifeExp, gapminder$gdpPercap)


opar = par(mfrow=c(2,2))
hist(gapminder$lifeExp)
hist(gapminder$gdpPercap, nclass = 50)
# hist(sqrt(gapminder$gdpPercap), nclass = 50)
hist(log10(gapminder$gdpPercap), nclass = 50)
plot(log10(gapminder$gdpPercap), gapminder$lifeExp, cex=.5)
par(opar)


cor(gapminder$lifeExp, log10(gapminder$gdpPercap))

library(ggplot2)
package_version(R.version) 


## 4.2 베이스 R그래픽과 ggplot2

# p34
library(ggplot2)
library(dplyr)
library(gapminder)

gapminder %>% ggplot(aes(x=lifeExp)) + geom_histogram()

gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram()

gapminder %>% ggplot(aes(x=gdpPercap)) +geom_histogram() + scale_x_log10()

gapminder %>% ggplot(aes(x=gdpPercap, y=lifeExp)) +geom_point() + scale_x_log10() + geom_smooth()


## 4.3 변수의 종류에 따른 시각화 기법
library(gapminder)
library(ggplot2)
library(dplyr)

gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram()
gapminder %>% ggplot(aes(x=gdpPercap)) +geom_histogram() + scale_x_log10()
gapminder %>% ggplot(aes(x=gdpPercap)) +geom_freqpoly() + scale_x_log10()
gapminder %>% ggplot(aes(x=gdpPercap)) +geom_density() + scale_x_log10()


summary(gapminder)


diamonds %>% ggplot(aes(cut)) + geom_bar()


table(diamonds$cut)

prop.table(table(diamonds$cut))

round(prop.table(table(diamonds$cut))*100, 1)


gapminder
gapminder %>% filter(country == "Afghanistan")


#p60
mpg %>% ggplot(aes(class, hwy)) + geom_boxplot()


#p62
mpg %>% ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5)


#p63
mpg %>% mutate(class=reorder(class, hwy, median)) %>%
  ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5)


#p64
mpg %>% mutate(class = factor(class, levels = c("2seater", "subcompact", "compact", "midsize",
                                                "minivan", "suv", "pickup"))) %>%
  ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5)


# p65
mpg %>% mutate(class=factor(class, levels= c("2seater", "subcompact", "compact", "midsize",
                                             "minivan", "suv", "pickup"))) %>%
  ggplot(aes(class, hwy)) + geom_jitter(col='gray') +
  geom_boxplot(alpha=.5) + coord_flip()


# p68
glimpse(data.frame(Titanic))
glimpse(Titanic)


# p70
Titanic


# p71
mosaicplot(Titanic, main = "Survival on the Titanic")


# p74
t2 = data.frame(Titanic)

t2 %>% group_by(Sex) %>%
  summarize(n = sum(Freq), survivors=sum(ifelse(Survived == "Yes", Freq, 0))) %>%
  mutate(rate_survival=survivors/n)



pairs(diamonds %>% sample_n(1000))
diamonds %>% sample_n(1000)

pairs(diamonds)
head(mpg)
