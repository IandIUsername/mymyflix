module ApplicationHelper
  
  
  #MyFormFor(record, options={}, &proc)
  
  #def MyFormFor(record, options.merge!({builder: MyFormBuilder}), &proc)
    
  #end
  
  #module ActionView
    #module Helpers
      #class FoemBuilder
      #end
    #end
      
  #end
  
  #include ActionView::Helpers
  
  #class AddNumber
    #include Sum
  #end
  
  #class AddString
    #include Sum
  #end
  
  #module Sum
    #def add(a,b)
      #a + b
    #end
  #end
  
  #form_for @user
  #@user.errors
  #f.label :first_name, 'my name', style: "", class: ''
  #f.check_box :first_name
  
  
  #errors
  
  #attribute
  
  #class MyFormBuilder < ActionView::Helpers::FormBuilder
  #method = :first_name
    #def label(xyx, text = nil, options = {} &block)
      #errors = object.errors[cat.to_sym]
      #if errors
        #text += " <span class=\"error\">#{errors.first}</span>"
      #end
      #super(xyz, text.html_safe, options, &block)
    #end
  
end
