# == Schema Information
#
# Table name: photographs
#
#  id         :integer          not null, primary key
#  slug       :string           not null
#  lonlat     :geometry({:srid= point, 0
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Photograph, type: :model do

  describe "columns" do
    it { should have_db_column(:slug).with_options(null: false) }
  end

  describe "indexes" do
    it { should have_db_index(:slug).unique(true) }
    it { should have_db_index(:lonlat) }
  end

  describe "validations" do
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
  end

  describe ".in_extent()" do

    it "returns photographs inside of the passed polygon" do

      p1 = create(:photograph, lonlat: Helpers::Geo.point(1, 1))
      p2 = create(:photograph, lonlat: Helpers::Geo.point(1, 2))
      create(:photograph, lonlat: Helpers::Geo.point(1, 4))
      create(:photograph, lonlat: Helpers::Geo.point(1, 5))

      extent = Helpers::Geo.polygon(
        [0, 0],
        [0, 3],
        [2, 3],
        [2, 0],
      )

      photos = Photograph.in_extent(extent.to_s)
      expect(photos).to be_records(p1, p2)

    end

  end

  describe ".in_radius()" do

    it "returns photographs with a given radius of a point" do

      p1 = create(:photograph, lonlat: Helpers::Geo.point(1, 0))
      p2 = create(:photograph, lonlat: Helpers::Geo.point(2, 0))
      create(:photograph, lonlat: Helpers::Geo.point(4, 0))
      create(:photograph, lonlat: Helpers::Geo.point(5, 0))

      photos = Photograph.in_radius(0, 0, 3)
      expect(photos).to be_records(p1, p2)

    end

  end

end
