# we specified the controller to be calc in routes.rb, inherit stuff from application controller
class CalcController < ApplicationController
  
    def flex_square
        #the parameters look like this: {"the_num" => "userinput"}
        #Rails put that hash in a variable called params

        
        #can fetch user input from hash with .fetch("the_num"), dig("the_num") as well
        @num = params["the_num"]
        
        #recall that @num is actually a string! -- convert to number
        @num_int = @num.to_f
        
        @the_answer = @num_int * @num_int
        
        #convert answer to string to display it
        @the_answer_str = @the_answer.to_s
        
        #render always comes at the end -- ruby evaluates line by line
        render("calc_templates/flexible_square.html.erb")
        
    end
    
    def flex_sqrt
        #note that these variables are local to flex_sqrt and the flexible_squareroot.html.erb pages -- these are totally different from the ones in different def/ends
        
        @num = params["the_num"]
        
        @num_int = @num.to_f
        
        @sqrt_ans_int = Math.sqrt(@num_int)
        
        #convert back to string
        @sqrt_ans_str = @sqrt_ans_int.to_s
        
        #file path to the relevant html.erb document
        render("calc_templates/flexible_squareroot.html.erb")
    end
    
    def flex_pay
        
        #extract the user inputs
        @apr = params["apr"]
        @years = params["years"]
        @principal = params["principal"]
        
        #convert all to floats, years can stay integer
        @apr_flt = @apr.to_f
        @years_int = @years.to_i
        @principal_flt = @principal.to_f
        
        #get apr to be a decimal
        @apr_dec = @apr_flt / 10000
        
        #also need apr to be presentable
        @apr_dec_present = @apr_flt / 100
        
        #also need to get to decimal
        @monthly_rate = @apr_dec / 12
        
        @monthly_payment = (@monthly_rate * @principal_flt) / (1 - (1 + @monthly_rate) ** (-@years_int * 12))
        
        # make number output pretty (using number_to_X) is on the html.erb file
        
        render("calc_templates/flexible_payments.html.erb")
        
    end
    
    def flex_random
        
        #extract the min and max from the params hash
        @min = params["min"]
        @max = params["max"]
        
        #convert to integers
        @min_int = @min.to_i
        @max_int = @max.to_i
        
        # .. is inclusive interval, ... excludes @max_int; will pick an integer because the inputs are integers
        @rand_num = rand(@min_int .. @max_int)
        
        #convert to a
        @rand_num_str = @rand_num.to_s
        
        render("calc_templates/flexible_random.html.erb")
    end
    
    def square_results_form
        
        #make sure we get this into a number, not a string
       @the_input_num = params["user_number"].to_f
       
       @the_answer = @the_input_num ** 2
       render("calc_templates/square_result.html.erb") 
    end
    
    def blank_square_form
        # no ruby code being executed here, we simply pass along the arguments
        render("calc_templates/square_new.html.erb")
    end
    
    
    def square_root_results
       @the_input_num = params["user_number"].to_f
       
       @the_answer = Math.sqrt(@the_input_num)
       
       render("calc_templates/square_root_result.html.erb") 
    end
    
    def blank_square_root
        render("calc_templates/square_root_new.html.erb")
    end
    
    def payment_results
        # we insert the logic for the loan payments
        
        #extract the user inputs
        @apr = params["apr"]
        @years = params["years"]
        @principal = params["principal"]
        
        #convert all to floats, years can stay integer
        @apr_flt = @apr.to_f
        @years_int = @years.to_i
        @principal_flt = @principal.to_f
        
        #get apr to be a decimal -- divide by 100 b/c APR now is no longer in hundreds, but now in units
        @apr_dec = @apr_flt / 100

        #also need to get to month
        @monthly_rate = @apr_dec / 12
        
        @monthly_payment = (@monthly_rate * @principal_flt) / (1 - (1 + @monthly_rate) ** (-@years_int * 12))
        
        render("calc_templates/payment_results.html.erb")
    end
    
    def blank_payment
        render("calc_templates/payment_new.html.erb")
    end

    def random_results
        #extract from hash and convert to floats
        @min_input = params["min_input_user"].to_f
        @max_input = params["max_input_user"].to_f
        
        @rand_answer = rand(@min_input .. @max_input)
        @rand_answer_str = @rand_answer.to_s
        
        render("calc_templates/random_results.html.erb")
    end
    
        
    def blank_random
        render("calc_templates/random_form.html.erb")
    end
    
end