desc "This task is file is for setting up roles and users for the app"
task :setup_admin => :environment do

 # please uncomment code below if setting up for the first time
  Role.delete_all
  User.delete_all
  Permission.delete_all

  Role.create(name: "ADMIN")
  Role.create(name: "CLIENT")

 #admin login after rake_setup is,username: admin@app.com password:hello1234
 User.create(email: "admin@app.com",password: "hello1234")
 User.create(email: "user@app.com",password: "hello1234")

 Permission.create(user_id: User.find_by_email("admin@app.com").id,role_id: Role.find_by_name("ADMIN").id)
 Permission.create(user_id: User.find_by_email("user@app.com").id,role_id: Role.find_by_name("CLIENT").id)

end
