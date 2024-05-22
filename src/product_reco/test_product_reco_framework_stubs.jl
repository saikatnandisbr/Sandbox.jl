# this test script was used in early phases of development to test stubs
# this script will not run any more that the methdos have evolved during development

using .ProductReco

# create instance of CollFilteringSVD
acf = ProductReco.PRCollFiltering.CollFilteringSVD(1)

isa(acf, ProductReco.Recommender)
isa(acf, ProductReco.PRCollFiltering.CollFiltering)
isa(acf, ProductReco.PRCollFiltering.CollFilteringSVD)

# run fit
ProductReco.fit(acf)

# run predict
prediction = ProductReco.predict(acf)
prediction[1]
typeof(prediction)

# run similar_customers
similar = ProductReco.PRCollFiltering.similar_customers(acf)
similar[1]
typeof(similar)

