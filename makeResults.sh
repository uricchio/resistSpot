echo "category observed-difference observed-RSA observed-SA permuted-difference p-value"

for i in {2..9}; do python compResults.py AllResponses.csv $i; done
