class Message < ApplicationRecord
  after_create :send_message

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :content, presence: true

  private

  def send_message
    MessageSenderJob.perform_now(self)
  end
end
