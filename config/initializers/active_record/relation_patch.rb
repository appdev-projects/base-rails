module ActiveRecord
  class Relation
    def to_s
      row_count = count
      
      "#{self.class} (array with #{row_count} #{model} #{"instance".pluralize(row_count)} inside)"
    end
  end
end
