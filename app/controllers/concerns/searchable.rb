module Search

    module InstanceMethods 
  

  
    end 
  
    module ClassMethods
  
        def search(query)
            if !!query
                self.where("name LIKE ?", "%#{query}%")
            else
                self.all
            end
        end

        def sort_by_name
            self.order(name: :asc)
        end
      
    end
       
  end 