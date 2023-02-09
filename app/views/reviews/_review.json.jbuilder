json.extract! review, :id, :Rating, :Review, :created_at, :updated_at
json.url review_url(review, format: :json)
