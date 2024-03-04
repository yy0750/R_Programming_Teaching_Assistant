# oversample houses with over 10rooms
s <- sample(row.names(housing.df), 5, prob = ifelse(housing.df$ROOMS>10, 0.9, 0.01))
s
housing.df[s,]


# we must then turn the resulting data matrix back into a data frame for turther work.
housing.df[1:6, 14]
xtotal <- model.matrix( ~ 0 + BEDROOMS+REMODEL, data = housing.df) # BOOK
xtotal <- as.data.frame(xtotal)

t(t(names(xtotal)))
t(names(xtotal))
head(xtotal)
names(xtotal)


#-------------------------
#Normalizing
sum(is.na(housing.df$TOTAL.VALUE))
x<-(housing.df$TOTAL.VALUE-mean(housing.df$TOTAL.VALUE))/sd(housing.df$TOTAL.VALUE)
mean(x)
sd(x)


#use set.seed() to get the same partitions when re-running the R code.
set.seed(1)

##partitioning into training
# randomly sample 60% of the row IDs for training; the remaining 40% serve as
# validation
train.rows <- sample(rownames(housing.df), dim(housing.df)[1]*0.6)
# collect all the columns with training row ID into training set:
train.data <- housing.df[train.rows,]
# assign row IDs that are not already in the training set, into validation
valid.rows <- setdiff(rownames(housing.df), train.rows)
valid.data <- housing.df[valid.rows, ]
