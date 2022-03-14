require 'list'

describe List do
  it 'returns a list of bookmarks' do
  expect(subject.view_list).to be_an_instance_of(Array)
  end
end