class MessageLog < ActiveRecord::Base
  attr_accessible :id, :name, :text, :time
end
