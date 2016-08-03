getwd()
setwd("E:\\RFiles")
getwd()

/*Question 1*/
  
  df<- read.csv(file.choose(), header = TRUE, sep = ",")

df<-df %>% mutate(company= tolower(company))


df= within(df, {
  company= ifelse(company %in% c("fillips", "phllips", "phillps", "philips", "phlips", "phillips"), "phillips",
                  ifelse(company %in% c("akz0", "ak zo", "akzo"), "akzo", 
                         ifelse (company %in% c("van houten"), "van houten", "unilever")))
})

/*Question 2*/


df<- separate(df, Product.code...number, c("product_code", "product_number"), sep= "-" )


/*Question 3*/

df = within(df, {
  product_category= ifelse(product_code == "p", "Smartphone", ifelse(product_code== "q", "TV", 
                                                                     ifelse(product_code== "x", "Laptop", "Tablet")) )
  
})


/*Question 4*/
  
df<-unite(df, "full_address", address, city, country, sep = ",")


/*Question 5*/
  
df= within(df, {
  company_phillips= ifelse(company== "phillips", 1, 0)
  company_akzo= ifelse(company== "akzo", 1, 0)
  company_van_houten= ifelse(company== "van houten", 1, 0)
  company_unilever= ifelse(company== "unilever", 1, 0)
} )

write.csv(df, file= "refine_clean.csv")
