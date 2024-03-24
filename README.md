# 🏞️ Mountain Web Services - Summit Static Sites (S3)
Instead of hosting on the [cloud](https://en.wikipedia.org/wiki/Cloud_computing) ☁️, **Mountain Web Services - Summit Static Sites (MWS S3)** lets you host your static html/css/js websites (e.g. personal websites, portfolios, recipes, blogs, etc.), on the [mountain](https://en.wikipedia.org/wiki/Burnaby_Mountain) 🏔️! 

**Note:** This project, MWS S3, is not affiliated with or endorsed by Amazon Web Services (AWS) or Amazon S3. MWS S3 is a standalone project developed independently. Any resemblance to AWS services or terminology is purely coincidental.

## Demo Video
https://www.youtube.com/watch?v=H_-IlM78nM0

## Prerequisites

Before you start using this application, ensure you have the following prerequisites set up and ready on your system:

- **Operating System**: macOS or Ubuntu
- **ngrok Token**: An ngrok account and an authentication token are required. You can sign up for a free account at [ngrok's website](https://ngrok.com/) and find your token in the setup section of your dashboard, see [Getting ngrok Authtoken](#getting-ngrok-authtoken).
- **SFU VPN**: Access to SFU's (Simon Fraser University's) VPN is necessary you must be connected to use the application. Instructions and downloads can be found on the [SFU IT Services page](https://www.sfu.ca/information-systems/services/sfu-vpn.html).
- **SSH Public/Private Key with SFU SSH**: You must have SSH keys set up for use with SFU's systems, username/password authentication is not currently supported. This involves generating a SSH key pair and adding the public key to your SFU account. Detailed instructions are available on [SFU's IT documentation](https://www.sfu.ca/computing/about/support/csil/unix.html#remote-access-linux-system) and listed below (see [Generating SSH Key pair](#generating-ssh-key-pair)).
- **Git**: Git must be installed on your system to clone the repository. You can download Git from [git-scm.com](https://git-scm.com/).

## Features

MWS S3 streamlines the deployment process by offering one-click deployment of HTML/CSS/JS assets directly from a Git repository. Users can simply provide the clone URL of their repository containing website files, and the deployment process is automated, making the website live instantly. It's important to note that currently, MWS S3 supports only HTML/CSS/JS files. Support for projects requiring build processes, such as applications built with React, is planned for a future release.

## Installation and Usage
**IMPORTANT: you must be connected to SFU VPN during these steps**
To install the application, follow these steps:

1. Open a terminal on your machine.
2. Clone the repository using Git:
  ```bash
   git clone https://github.com/dannyl1u/mountain-web-services.git
  ```
4. Navigate into the cloned repository directory:
  ```bash
   cd mountain-web-services
  ```
5. Make the setup scripts executable by running:
  ```bash
   chmod +x setup_ngrok.sh ssh_execute.sh
  ```
5. Run the script and enter passkeys, ngrok Authtokens, git clone urls*, etc. as prompted
  ```bash
  ./ssh_execute.sh
  ```

*Note: MWS S3 currently only supports git repositories containing static HTML/CS/JS content (see https://github.com/dannyl1u/demo-website as example), projects that require builds (e.g. React) will be supported at a later time. If you wish to deploy a project built with a framework such as React, please push the production build (i.e. output of `npm run build`) output to your repository. 

## Generating SSH Key pair
1. **Generate SSH Key Pair:** Open a terminal and run `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`. Follow prompts to select file location and passphrase.

2. **Copy Public Key to Server:** Use `ssh-copy-id -i ~/.ssh/id_rsa.pub -p 24 <YOUR_SFU_COMPUTING_ID>@csil-cpu2.csil.sfu.ca` to copy your public key to the server. If `ssh-copy-id` fails, manually add your public key to `~/.ssh/authorized_keys` on the server.

3. **Connect with SSH Key:** Connect to the server with `ssh -p 24 <YOUR_SFU_COMPUTING_ID>@csil-cpu2.csil.sfu.ca`. Enter your passphrase if prompted.

## Getting ngrok Authtoken
1. Login or sign-up for a free account at https://dashboard.ngrok.com/signup
2. Navigate to **Your Authtoken** to copy the authtoken

## Disclaimer
Please adhere to all SFU CSIL (Computing Science Instructional Labs) policies: https://www.sfu.ca/computing/about/support/csil/policies.html  

**Use at Your Own Risk**: The information and tools provided in this documentation are on an "as is" basis without warranties of any kind, either express or implied. The use of the tools, scripts, or information is entirely at the user's own risk. The creator or contributors of this documentation cannot be held responsible for any damages or losses that occur from using the content provided here. Users are encouraged to test and evaluate the tools and scripts in a safe, non-production environment before any operational use. By using the information provided, the user acknowledges and agrees to assume all risks associated with their use.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
