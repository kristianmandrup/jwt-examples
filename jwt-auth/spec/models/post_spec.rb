require 'rails_helper'

describe Post do

  describe 'Associations' do
    it{should belong_to(:user)}
  end

end