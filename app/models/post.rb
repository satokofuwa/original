class Post < ApplicationRecord
    with_options presence: true do
          validates :content
end
    with_options length: { minimum: 1, maximum: 140} do
           validates :content
end
end
