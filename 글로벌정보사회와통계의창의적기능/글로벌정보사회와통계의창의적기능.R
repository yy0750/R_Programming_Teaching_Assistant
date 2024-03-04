# 5.1 dplyr 패키지
install.packages("nycflights13")
library(nycflights13)
help("flights")

##-----p.208
nrow(mtcars)
str(mtcars)

##-----p.209
filter(mtcars, cyl == 4)
filter(mtcars, cyl >= 6 & mpg >20)

##-----p.210
head(select(mtcars, am, gear))

##-----p.211
head(arrange(mtcars, wt))

##-----p.212
head(arrange(mtcars, mpg, desc(wt)))

##-----p.213
head(mutate(mtcars, years = "1974"))

head(mutate(mtcars, mpg_rank = rank(mpg)))

##-----p.214
distinct(mtcars, cyl)

distinct(mtcars, gear)

##-----p.215
distinct(mtcars, cyl, gear)

##-----p.216
summarise(mtcars, cyl_mean = mean(cyl), cyl_min = min(cyl), cyl_max = max(cy))
summarise(mtcars, mean(cyl), min(cyl), max(cyl))

##-----p.217
gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n())

gr_cyl <- group_by(mtcars, cyl)
summarise(gr_cyl, n_distinct(gear))

##-----p.218
sample_n(mtcars, 10)

##-----p.219
sample_frac(mtcars, 0.2)

# 5.2 데이터 가공하기 
library(dplyr)
library(readxl)

setwd("/Users/YJ/Documents/KU/학부연구생/글로벌정보사회와통계의창의적기능")
exdata1 <- read_excel("sample1.xlsx")

#-----(p.226)
exdata1 %>% select(ID)

#-----(p.226)
exdata1 %>% select(ID, AREA, Y21_CNT)

#-----(p.227)
exdata1 %>% select(-AREA)
exdata1 %>% select(-AREA, - Y21_CNT)

#-----(p.229)
exdata1 %>% filter(AREA == '서울')
exdata1 %>% filter(AREA == '서울' & Y21_CNT >= 10)

#-----(p.230)
exdata1 %>% arrange(AGE)

#-----(p.231)
exdata1 %>% arrange(desc(Y21_AMT))

#-----(p.232)
exdata1 %>% arrange(AGE, desc(Y21_AMT))

#-----(p.233)
exdata1 %>% summarise(TOT_Y21_AMT = sum(Y21_AMT))


# 데이터 결합하기
#-----(p.237)
library(readxl)

jeju_y20_history <- read_excel("sample5_y20_history.xlsx")
jeju_y21_history <- read_excel("sample4_y21_history.xlsx")

View(jeju_y20_history)
View(jeju_y21_history)

#-----(p.239)
bind_col <- left_join(jeju_y21_history, jeju_y20_history, by = "ID")
View(bind_col)

#-----(p.240)
bind_col_inner <- inner_join(jeju_y21_history, jeju_y20_history, by = "ID")
View(bind_col_inner)

#-----(p.241)
bind_col_full <- full_join(jeju_y21_history, jeju_y20_history, by = "ID")
View(bind_col_full)

planes
planes %>% count(tailnum) %>% filter(n>1)

weather
weather %>% count(year, month, day, hour, origin) %>% filter(n > 1)

flights2 <- flights %>% select(year:carrier)
flights2


library(ggplot2)

str(airquality)
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point(size = 3, color = "red")

ggplot(airquality, aes(x = Day, y = Temp)) + geom_line()

ggplot(mtcars, aes(x = cyl)) + geom_bar(width = 0.5)
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(width = 0.5)
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear)))
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear))) + coord_polar()
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill = factor(gear))) + coord_polar(theta = "y")

ggplot(airquality, aes(x = Day, y = Temp, group = Day)) + geom_boxplot()
ggplot(airquality, aes(Temp)) + geom_histogram()
ggplot(airquality, aes(Temp)) + geom_histogram(binwidth = 1)


# p25
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))


# p28
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))

# p29
# left
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))


# p30
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y= hwy)) + facet_wrap(~ class, nrow = 2)


# p31
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y =hwy))


# p32
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


# p34
library(ggplot2)
str(economics)


# p35
ggplot(economics, aes(x = date, y = psavert)) + geom_line() + geom_abline(intercept = 12.18671, slope = -0.0005444)


# p36
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  stat_smooth(method = "lm", col = "red")


# p37
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))


# p38
library(dplyr)

x_inter <- filter(economics, psavert == min(economics$psavert))$date
ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() + 
  geom_vline(xintercept = x_inter)

ggplot(economics, aes(x = date, y = psavert)) +
  geom_line() +s
  geom_vline(xintercept = as.Date("2005-07-01"))


# p4-
economics$psavert == min(economics$psavert)
filter(economics, psavert == min(economics$psavert))
filter(economics, psavert == min(economics$psavert))$date


# p41
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point() +
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))


# p42
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue")


# p43
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  annotate("rect", xmin = 3, xmax = 4, ymin = 12, ymax = 21, alpha = 0.5, fill = "skyblue") +
  annotate("segment", x = 2.5, xend = 3.7, y = 10, yend = 17, color = "red", arrow = arrow())


# p44
ggplot(mtcars, aes(x = gear)) + geom_bar() +
  labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차수")



## 혼자 공부하는 R 데이터 분석 CHAPTER07


# SECTION 7-1 지역별 국내 휴양림 분포 비교하기
# 엑셀 파일 가져오기
library(readxl)
forest_example_data <- read_excel("/Users/YJ/Documents/KU/학부연구생/글로벌정보사회와통계의창의적기능/forest_example_data.xls")
colnames(forest_example_data) <- c("name", "city", "gubun", "area", "number", "stay", "city_new", "code", "codename")           

str(forest_example_data)
head(forest_example_data)


# freq() 함수로 시도별 휴양림 빈도분석하기
library(descr)
freq(forest_example_data$city, plot = T, main = "city")


# table() 함수로 시도별 휴양림 분석하기
city_table <- table(forest_example_data$city)
city_table
barplot(city_table)


# count() 함수로 시도별 휴양림 빈도분석하고 내림차순 정렬하기
library(dplyr)
count(forest_example_data, city) %>% arrange(desc(n))

# 소재지_시도명 컬럼으로 시도별 분포 확인하기
count(forest_example_data, city_new) %>% arrange(desc(n))


# 제공기관명 컬럼으로 시도별 분포 확인하기
count(forest_example_data, codename) %>% arrange(desc(n))


# SECTION 7-2 해외 입국자 추이 확인하기
# 엑셀 파일 가져오기
library(readxl)
entrance_xls <- read_excel("/Users/YJ/Documents/KU/학부연구생/글로벌정보사회와통계의창의적기능/entrance_exam.xls")
str(entrance_xls)
head(entrance_xls)

# 컬럼명 변경과 띄어쓰기 제거하기
colnames(entrance_xls) <- c("country", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
entrance_xls$country <- gsub(" ", "", entrance_xls$country)
entrance_xls

# 1월 기준 상위 5개국 추출하기
entrance_xls |> nrow()
top5_country <- entrance_xls[order(-entrance_xls$JAN), ] |> head(n = 5)
top5_country

# 데이터 구조 재구조화하기
library(reshape2)
top5_melt <- melt(top5_country, id.vars = 'country',
                  variable.name = 'mon')
head(top5_melt)

## 폰트 설정 패키지 설치
install.packages("extrafont")
library(extrafont)
## 존재하는 모든 폰트 불러오기
font_import()
## 폰트 설정
theme_set(theme_gray(base_family='NanumGothic'))
## 혹은
theme_set(theme_gray(base_family='AppleMyungjo'))

# 선 그래프 그리기
library(ggplot2)
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(color = country))

# 그래프 제목 지정하고 y축 범위 조정하기
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(color = country)) +
  ggtitle("2020년 국적별 입국 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 500000, 50000))

# 막대 그래프 그리기
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "dodge")

# 누적 막대 그래프 그리기
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "stack")


# p34
  ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point() +
  ggtitle("다이아몬드 가격") +
  scale_y_continuous(breaks = seq(0, 19000, 1000))



## SECTION 7-3 지도에서 코로나 19 선별진료서 위치 확인하기
# 엑셀 파일 가져오기
library(readxl)
xlsdata <- read_excel("/Users/YJ/Documents/KU/학부연구생/글로벌정보사회와통계의창의적기능/선별진료소_20211125194459.xls")           
View(xlsdata)

# 데이터 컬럼 추출 및 열 이름 변경하기
data_raw <- xlsdata[, c(2:5)]
head(data_raw)

names(data_raw)
names(data_raw) <- c("state", "city", "name", "addr")
names(data_raw)

# state 컬럼 빈도 확인하기
par(family = "AppleGothic") # 한글 깨짐 방지

table(data_raw$state)
barplot(table(data_raw$state))

# 대전시 선별진료소 데이터 추출하기
daejeon_data <- data_raw[data_raw$state == "대전",]
head(daejeon_data)
nrow(daejeon_data)

# 데이터 세트에서 선별진료소 위도와 경도 데이터 가져오기
library(ggmap)
ggmap_key <- "sapient-axle-405902."
register_google(ggmap_key)
daejoeon_data <- mutate_geocode(data = daejeon_data, location = addr, source = 'google')
head(daejoeon_data)
head(daejoeon_data$lon)

# 대전시 지도 시각화하기
daejeon_map <- get_googlemap('대전', maptype ='roadmap', zoom = 11)
ggmap(daejeon_map) +
  geom_point(data = daejeon_data,
             aes(x = lon, y = lat, color = factor(name)), size = 3)

# 마커로 위치 표시하고 위치 이름 넣기
daejeon_data_marker <- data.frame(daejeon_data$lon, daejeon_data$lat)
daejeon_map <- get_googlemap('대전', maptype = 'roadmap', zoom = 11, markers = daejeon_data_marker)
ggmap(daejeon_map) + geom_text(data = daejeon_data, aes(x = lon, y = lat), size = 3, label = daejeon_data$name)


## SECTION 7-4 서울시 지역별 미세먼지 농도 차이 비교하기
# 엑셀 파일 가져오기
library(readxl)
dustdata <- read_excel("/Users/YJ/Documents/KU/학부연구생/글로벌정보사회와통계의창의적기능/dustdata.xlsx")
View(dustdata)
str(dustdata)

# 성북구와 중구 데이터만 추출하기
library(dplyr)
dustdata_anal <- dustdata[, c("날짜", "성북구", "중구")]
View(dustdata_anal)

# 결측치 확인하기
is.na(dustdata_anal)
sum(is.na(dustdata_anal))

# 지역별 미세먼지 농도의 기술통계량 구하기
library(psych)
describe(dustdata_anal$성북구)
describe(dustdata_anal$중구)

# 성북구와 중구 미세먼지 농도 상자 그림 그리기
boxplot(list(dustdata_anal$성북구, dustdata_anal$중구),
        main = "finedust_compare", xlab = "AREA", names = c("성북구", "중구"),
        ylab = "FINEDUST_PM", col = c("blue", "green"))

# f 검정으로 지역별 미세먼지 농도의 분산 차이를 검정하기
var.test(dustdata_anal$중구, dustdata_anal$성북구)

# t 검정으로 지역별 미세먼지 농도의 분산 차이를 검정하기
t.test(dustdata_anal$중구, dustdata_anal$성북구, var.equal = T)
