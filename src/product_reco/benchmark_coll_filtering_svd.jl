# check set up for parallel processing using threads
using Hwloc
using Base.Threads
using LinearAlgebra

Hwloc.num_physical_cores()  # number of physical cores
nthreads()                  # number of threads set in Julia start up config
BLAS.get_num_threads()      # Linear Algebra BLAS threads

# packages needed for testing
# dev "MY_JULIADEV_FOLDER_PATH/juliadev/ProductReco"
using CSV
using DataFrames
using Plots

# track and incude changes
using Revise
using ProductReco

# load benchmark data
folder_name = "./data"
file_name = "df_summary.csv"
df_summary = CSV.File(joinpath(folder_name, file_name)) |> DataFrame;

# examine benchmark data
names(df_summary)

size(df_summary)

unique(df_summary.customer_id) |> length
unique(df_summary.product_id) |> length
unique(df_summary.invoice_ind)

# put data into CustomerProductRating objects
cust_prod_rating = Vector{ProductReco.CustomerProductRating}()

for r in eachrow(df_summary)
    # println("$(r.customer_id)  $(r.product_id) $(r.invoice_ind)")
    push!(cust_prod_rating, (String(r.customer_id), String(r.product_id), r.invoice_ind))
end

length(cust_prod_rating)

# create recommender object
recommender = ProductReco.PRCollFiltering.CollFilteringSVD();

# run fit!
@time ProductReco.fit!(recommender, cust_prod_rating);      # includes compile time for fist run
@time ProductReco.fit!(recommender, cust_prod_rating);

# check success
ProductReco.isfitted(recommender)

# singular values
n_singular_vals = length(recommender.s)
plot(recommender.s, label="Top $n_singular_vals Singular Values")

# run transform!
@time ProductReco.transform!(recommender);                  # includes compile time for fist run
@time ProductReco.transform!(recommender);

# check success
ProductReco.isfitted(recommender)
ProductReco.istransformed(recommender)

# generate predict customers
predict_cust = Vector{ProductReco.Customer}()

for cust_id in keys(recommender.cust_idx_map)
    push!(predict_cust, cust_id)
end

length(predict_cust)

# run predict
@time predictions = ProductReco.predict(recommender, predict_cust[1:100]);         # includes compile time for fist run
@time predictions = ProductReco.predict(recommender, predict_cust)[1:100];

# predictions
length(predictions)
predictions[1:30]
