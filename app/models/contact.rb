class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User"
end
