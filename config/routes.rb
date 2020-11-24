Rails.application.routes.draw do

  get("/", { :controller => "courses", :action => "index" })


  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  # get("/likes", { :controller => "likes", :action => "index" })
  
  # get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  # post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Friend resource:

  # CREATE
  post("/insert_friend", { :controller => "friends", :action => "create" })
          
  # READ
  # get("/friends", { :controller => "friends", :action => "index" })
  
  # get("/friends/:path_id", { :controller => "friends", :action => "show" })
  
  # UPDATE
  
  # post("/modify_friend/:path_id", { :controller => "friends", :action => "update" })
  
  # DELETE
  get("/delete_friend/:path_id", { :controller => "friends", :action => "destroy" })

  #------------------------------

  # Routes for the Course resource:

  # CREATE
  post("/insert_course", { :controller => "courses", :action => "create" })
          
  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  # get("/courses/:path_id", { :controller => "courses", :action => "show" })
  
  # UPDATE
  
  # post("/modify_course/:path_id", { :controller => "courses", :action => "update" })
  
  # DELETE
  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  # get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  # post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the User list:

  # LIST OF ALL USERS
  get("/users", { :controller => "users", :action => "index" })        
  
  # USER DETAILS
  # get("/users/:path_id", { :controller => "users", :action => "show" })        

  # INVITE USER
  post("/invite_user", { :controller => "users", :action => "invite_user" })

  #------------------------------

  # Routes for the Results list:

  # RESULTS LIST
  get("/results", { :controller => "results", :action => "index" })        
  

  #------------------------------

end
