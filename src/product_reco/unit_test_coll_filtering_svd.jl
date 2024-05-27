# dev "MY_JULIADEV_FOLDER_PATH/juliadev/ProductReco"
using ProductReco

# generate data to fit model
rating_data = Vector{ProductReco.CustomerProductRating}()

push!(rating_data, ("C5", "P1", 5))

push!(rating_data, ("C6", "P4", 5))
push!(rating_data, ("C6", "P5", 1))

push!(rating_data, ("C4", "P6", 13))
push!(rating_data, ("C4", "P2", 25))
push!(rating_data, ("C4", "P5", 12))

push!(rating_data, ("C3", "P1", 19))

push!(rating_data, ("C2", "P3", 20))
push!(rating_data, ("C2", "P4", 3))

push!(rating_data, ("C1", "P2", 10.1))
push!(rating_data, ("C1", "P5", 8.0))

rating_data

# create recommender object, a collaborative filtering SVD object
recommender = ProductReco.PRCollFiltering.CollFilteringSVD(n_max_similar_cust=2, n_max_reco_per_cust=2)

# run fit!
ProductReco.fit!(recommender, rating_data)

# check success
ProductReco.isfitted(recommender)

# check fit! outputs
recommender.cust_idx_map        # customer id to index map
recommender.prod_idx_map        # product id to index map
recommender.prod_cust_rating    # sparse matrix of customer product ratings transposed

recommender.U                   # left singular vectors
recommender.s                   # singular values
recommender.V                   # right singular vectors

# run transform! without passing new rating data
ProductReco.transform!(recommender)

# check success
ProductReco.istransformed(recommender)

# check transform! outputs
recommender.cust_idx            # customer indices
recommender.similar_cust_idx    # corresponding similar customer indices
recommender.similarity          # similarity measure of customer and similar customer

collect(zip(recommender.cust_idx, recommender.similar_cust_idx, recommender.similarity))  # above three vectors placed side by side

# find similar customers
ProductReco.PRCollFiltering.similar_customers(recommender, ProductReco.Customer("C1"))

# run fit_transform!
ProductReco.fit_transform!(recommender, rating_data)

# check success
ProductReco.isfitted(recommender)
ProductReco.istransformed(recommender)

# check customer similar customer output - shall be same as output earlier from separate runs of fit! and transform!
collect(zip(recommender.cust_idx, recommender.similar_cust_idx, recommender.similarity))  # above three vectors placed side by side

# generate predict customers
predict_cust = Vector{ProductReco.Customer}()
for id in keys(recommender.cust_idx_map)
    push!(predict_cust, ProductReco.Customer(id))
end

length(predict_cust)

# examine similar customers for predict customers
predict_cust[1]
ProductReco.PRCollFiltering.similar_customers(recommender, predict_cust[1])
predict_cust[2]
ProductReco.PRCollFiltering.similar_customers(recommender, predict_cust[2])

# run predict
predictions = ProductReco.predict(recommender, predict_cust);

# predictions
length(predictions)
predictions
