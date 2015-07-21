# == Schema Information
#
# Table name: landmark_to_people
#
#  id          :integer          not null, primary key
#  landmark_id :integer
#  person_id   :integer
#

class LandmarkToPerson < ActiveRecord::Base
  belongs_to :landmark
  belongs_to :person
end