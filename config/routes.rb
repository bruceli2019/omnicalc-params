Rails.application.routes.draw do
    # /:the_num allows anything to come after flexible/square/ -- strings, nums
    get("flexible/square/:the_num", {:controller => "calc", :action => "flex_square"})
    
    get("flexible/square_root/:the_num", {:controller => "calc", :action => "flex_sqrt"})
    
    #note that we have 3 inputs here!
    get("flexible/payment/:apr/:years/:principal", {:controller => "calc", :action => "flex_pay"})
    
    get("flexible/random/:min/:max", {:controller => "calc", :action => "flex_random"})
    
    #we need to create both a results and a new form page
    # start with the results page
    
    get("square/results", {:controller => "calc", :action => "square_results_form"})
    
    get("square/new", {:controller => "calc", :action => "blank_square_form"})
    
    get("square_root/results", {:controller => "calc", :action => "square_root_results"})
    
    get("square_root/new", {:controller => "calc", :action => "blank_square_root"})
    
    get("payment/results", {:controller => "calc", :action => "payment_results"})

    get("payment/new", {:controller => "calc", :action => "blank_payment"})
    
    get("random/new", {:controller => "calc", :action => "blank_random"})

    get("random/results", {:controller => "calc", :action => "random_results"})

end
