module Searchable

    module InstanceMethods 
  

  
    end 
  
    module ClassMethods
  
        def search(query)
                self.where("name LIKE ?", "%#{query}%")
        end

        def sort_by_name
            self.order(name: :asc)
        end
      
    end
       
  end 