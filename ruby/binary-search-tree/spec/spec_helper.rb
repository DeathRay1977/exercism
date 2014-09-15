require_relative '../bst'

def record_all_data(bst)
  all_data = []
  bst.each { |data| all_data << data }
  all_data
end


