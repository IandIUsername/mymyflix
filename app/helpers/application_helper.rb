module ApplicationHelper
  
  
  #MyFormFor(record, options={}, &proc)
  
  #def MyFormFor(record, options.merge!({builder: MyFormBuilder}), &proc)
    
  #end
  
  
  
  #class MyFormBuilder < ActionView::Helpers::FormBuilder
    
    #def label(method, text = nil, options = {} &block)
      #errors = object.errors[method.to_sym]
      #if errors
        #text += " <span class=\"error\">#{errors.first}</span>"
      #end
      #super(method, text.html_safe, options, &block)
    #end
end
