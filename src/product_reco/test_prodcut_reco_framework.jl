using .ProductReco

# create instance of CollFilteringSVD
acf = ProductReco.CollFilteringSVD(1)

isa(acf, ProductReco.Recommender)
isa(acf, ProductReco.CollFiltering)
isa(acf, ProductReco.CollFilteringSVD)

# run fit
ProductReco.fit(acf)

# run predict
prediction = ProductReco.predict(acf)
prediction[1]
typeof(prediction)

# run similar_customers
similar = ProductReco.similar_customers(acf)
similar[1]
typeof(similar)