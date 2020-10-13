require 'rails_helper'

RSpec.describe Movie, type: :model do
  require 'rails_helper'


describe Movie do
    describe :get_movies_director do
        let!(:mv1) { FactoryBot.create(:movie, id: 1, title: 'Movie A', director: 'abc') }
        let!(:mv2) { FactoryBot.create(:movie, id: 2, title: 'Movie B', director: 'abc') }
        let!(:mv3) { FactoryBot.create(:movie, id: 3, title: "Movie C", director: 'xyz') }

        it 'should find movies by same directors' do
            expect(Movie.get_movies_director(mv1.director)).to include(mv1.title,mv2.title)
        end

        it 'should not find movies by different directors' do
            expect(Movie.get_movies_director(mv1.director)).to_not include([mv3.title])
        end
    end
end
end