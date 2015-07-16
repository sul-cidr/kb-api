# == Schema Information
#
# Table name: people
#
#  id          :integer          not null, primary key
#  family_name :string
#  given_name  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sex         :string
#  birth_year  :integer
#  death_year  :integer
#  legacy_id   :string
#  birth_est   :boolean
#  death_est   :boolean
#

class Person < ActiveRecord::Base

  has_many :person_events
  has_many :events, :through => :person_events

  has_many :person_occupations
  has_many :occupations, :through => :person_occupations

  validates :legacy_id, uniqueness: true

  #
  # Assemble a full name from the given and family names.
  #
  # returns [String]
  #
  def full_name
    "#{given_name} #{family_name}"
  end

  searchable do

    text :name, :stored => true do
      full_name
    end

    boost { events.count+1 }

  end

end
