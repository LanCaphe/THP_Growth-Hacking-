require 'rails_helper'

RSpec.describe "RoutesTests", type: :routing do
    it "/" do
    expect(:get => new).
      to route_to(:controller => "user", :action => "new")
  end
end
