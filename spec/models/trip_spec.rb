require 'rails_helper'

RSpec.describe Trip, type: :model do
  context 'validations' do
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:start_station) }
    it { should validate_presence_of(:end_station) }
    it { should validate_presence_of(:bike_id) }
    it { should validate_presence_of(:subscription_type) }
  end

  it 'has model level dashboard methods' do
    20.times do
      Trip.create!(duration: 60, start_date: '8/29/2013 14:13',
                   start_station: 10, end_date: '8/30/2013 11:14',
                   end_station: 66, bike_id: 520,
                   subscription_type: 'Subscriber', zip_code: 94127)
    end
    10.times do
      Trip.create!(duration: 20, start_date: '7/15/2013 10:13',
                   start_station: 10, end_date: '7/15/2011 11:14',
                   end_station: 66, bike_id: 55,
                   subscription_type: 'Customer', zip_code: 93123)
    end

    expect(Trip.average_trip_duration).to eq(46)
    expect(Trip.longest_duration).to eq(60)
    expect(Trip.shortest_duration).to eq(20)
    expect(Trip.most_ridden_bike).to eq([520, 20])
    expect(Trip.least_ridden_bike).to eq([55, 10])
    expect(Trip.most_popular_date).to eq(["8/29/2013 14:13", 20])
    expect(Trip.least_popular_date).to eq(["7/15/2013 10:13", 10])
  end
end
