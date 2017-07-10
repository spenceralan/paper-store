require 'rails_helper'

describe Product do

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }

  it { should have_many :reviews }

  it { should validate_numericality_of(:price) }
  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
    allowing("image/png", "image/gif").
    rejecting("text/plain", "text/xml") }

end
