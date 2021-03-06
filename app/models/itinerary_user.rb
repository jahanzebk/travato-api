# == Schema Information
#
# Table name: itinerary_users
#
#  id           :integer          not null, primary key
#  itinerary_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ItineraryUser < ActiveRecord::Base
  belongs_to :itinerary, inverse_of: :itinerary_users
  belongs_to :user

  validates :user_id, uniqueness: { scope: :itinerary_id, message: "Can't double book!" }

  def guest
    user
  end
end
