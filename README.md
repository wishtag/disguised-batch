# Disguised Batch
The idea is you find a way to trick someone into running the `document.vbs` file. The plan was to change the icon to look like a `.pdf` but unfortunately you can't hardcode that into it.  

Disregarding that, here's how it works:  
## How It Works
- You trick someone into running the `document.vbs` file  
- The `document.vbs` file makes a call to retrieve the `document.bat` file from this GitHub repository  
- Once retrieved, the `document.vbs` file downloads and saves the `document.bat` to `C:\Users\Public`  
- Finally, the `document.vbs` starts the `document.bat` file minimized  
- The `document.bat` file makes a call to retrieve the `document.pdf` file from this GitHub repository  
- Once retrieved, the `document.bat` file downloads and saves the `document.pdf` to the same directory as itself, `C:\Users\Public`  
- Then, the `document.bat` file opens the `document.pdf` file  
- **Note:** This is the point where you would put any additional things you want the `document.bat` file to do  
- Finally, the `document.bat` file deletes `document.pdf` along with itself  

To the user, it just looks like the `document.vbs` file opened as a `.pdf` file.  
## Configuration
If you want to use this for yourself to try and trick someone, don't. Not because of morals or whatever but because this is just blatantly obvious, I'm only writing this `README.md` so I can publish a release to go back to incase I mess something up further on.  

But if you are somehow certain you can trick someone into running a `.vbs` file, here's how to configure this.  

### Step 1
You will need to fork this repository or find another way to host your files. The `.vbs` file is the only one a user would need to download because the `.vbs` file downloads the `.bat` file from the internet, and then the `.bat` file downloads the `.pdf` from, you guessed it, also the internet.  
### Step 2
Open the `.vbs` file in a text editor or whatever and change the link in on the `oXMLHTTP.Open "GET"` to the link to your `.bat` file.  
By default, it will be saved as `document.bat`. Realistically, it doesn't matter what the name is so if you want less work, don't change it. If you want to change the name, find the lines that refer to `C:\Users\Public\document.bat` and change `document` to whatever you want.
### Step 3
Open the `.bat` file in a text editor and change the link in the `Invoke-WebRequest` line to the link of your decoy file. I used a `.pdf` file but you can do whatever type of file you want here, just make sure you also change the `-OutFile` part to match your file type. If you changed the `-OutFile` name or file extension from the default, make sure you change the next line from `document.pdf` to the name and file type you chose.
### Step 4
Inbetween the `document.pdf` line (or whatever you changed it to) and the `timeout` line is where you would put whatever you want the `.bat` file to actually do.
### Step 5
If you changed the names the for the `.bat` or decoy file, change the `del` lines to have the correct names.