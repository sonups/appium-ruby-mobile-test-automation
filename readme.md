# Mobile test automation using appium, ruby, cucumber

Provided two options to run the mobile test automation framework

 Option 1: Start from a machine where appium server installed and emulator is available
 
 Option 2: Start using docker container. [provided Dockerfile in the same project directory]

 #### Option 1:
 
 Install ruby in your machine. Ensure ruby is available by using ruby -v
 In windows we can use a ruby version manager called pik

#####Steps:

  1. Clone the repository in a local folder
  2. Open a shell console to the cloned directory
  3. Use the bundle install to install required gems
  
  `bundle install`
  
  4. Optionally it is required to update ruby gems. Update gems by issuing the below command. This could take a while!!. Try by cleaning unwanted gems by 2nd commands
  
  `gem update`
  `bundle clean --force`
    
  5. Use the below commands to uninstall and then properly install eventmachine ruby gem. There is a known issue. This step is required only for windows machines 
  `gem uninstall eventmachine`
  `gem install eventmachine --platform ruby`
  
  6. Start the appium server locally in port 4723
  7. Launch a mobile emulator [AVD from Android / Genymotion] - Tested execution with Android API - 24 / Samsung Nexus 5X emulated device
  8. Start execution by using any of the cucumber profiles - [all-tags, account_creation, account_login, all-tags-html-report, account_creation-html-report]
  
  `cucumber --profile all-tags`
  
The reports are generated in the folder : /results/report

####Option 2: [Run using docker ] 
Here we are building a docker image locally. We need to provide the ip of the  ethernet adapter interface for docker . In image below , the ip address is captured using ipconfig command (In windows) [ifconfig (in linux)]

Note: This will enable the docker container to route the appium http request to the appium server running locally.

Ensure docker is installed and available in your command line 

#####Steps:

  1. Clone the repository in a local folder
  2. Provide the ip address of the host interface in the file - android_capabilities.yml provided in the root directory . The value should be added to the below key: 
  
  > :appium_lib>>:server_url
  
  3. Build the docker image from a shell by using the below command. It will take some time to build
  
` docker build -t vivino-mobile-test-automation . `

     [post docker file build, a docker image with name 'vivino-mobile-test-automation' will get created]
	 [Please ensure to remove Gemfile.lock from the root folder if docker build results in 'ERROR [16/16] RUN bundle install']
     
  4. Ensure the image is created by using the command
  
      `docker image ls`
      
  5. Start the appium server locally in port 4723
  6. Launch a mobile emulator [AVD from Android / Genymotion] - Tested execution with Android API - 24 / Samsung Nexus 5X emulated device
  7. Start the execution by issuing the below command
  
      `docker run -i -d vivino-mobile-test-automation sleep infinity`
      
  8. Fetch the id of the last invoked container from the below command
  
     ` docker ps -l -q`
     
  9. In order to reports from the running container issue the below command
  
    `docker cp <CONTAINERID>:/usr/src/app/results/report <LOCAL_DIRECTORY>`
    
   example:
   > docker cp 4b2e80b3f5ab:/usr/src/app/results/report  /Sonu/j_apps/vivino/project/Mobile_test/reports
    
  10. Cleanup of the used docker container can be done using the below commands
  
      `docker stop <CONTAINERID>`

	  Sample report:
    
	  ![](https://pandao.github.io/editor.md/examples/images/4.jpg)
	  	
