# Mountain Web Services - Summit Static Sites (S3)
Instead of hosting on the [cloud](https://en.wikipedia.org/wiki/Cloud_computing) ☁️, **Mountain Web Services - Summit Static Sites (MWS S3)** lets you host your static html/css/js websites (e.g. personal websites, portfolios, recipes, blogs, etc.), on the [mountain](https://en.wikipedia.org/wiki/Burnaby_Mountain) 🏔️! 

## Prerequisites

Before you start using this application, ensure you have the following prerequisites set up and ready on your system:

- **Operating System**: macOS or Ubuntu
- **ngrok Token**: An ngrok account and an authentication token are required. You can sign up at [ngrok's website](https://ngrok.com/) and find your token in the setup section of your dashboard.
- **SFU VPN**: Access to SFU's (Simon Fraser University's) VPN is necessary for certain network operations. Ensure you're able to connect to the SFU VPN. Instructions and downloads can be found on the [SFU IT Services page](https://www.sfu.ca/information-systems/services/sfu-vpn.html).
- **SSH Public/Private Key with SFU SSH**: You must have SSH keys set up for use with SFU's systems, username/password authentication is not supported. This involves generating a SSH key pair and adding the public key to your SFU account. Detailed instructions are available on [SFU's IT documentation](https://www.sfu.ca/computing/about/support/csil/unix.html#remote-access-linux-system).
- **Git**: Git must be installed on your system to clone the repository. You can download Git from [git-scm.com](https://git-scm.com/).

## Features

MWS S3 streamlines the deployment process by offering one-click deployment of HTML/CSS/JS assets directly from a Git repository. Users can simply provide the clone URL of their repository containing website files, and the deployment process is automated, making the website live instantly. It's important to note that currently, MWS S3 supports only HTML/CSS/JS files. Support for projects requiring build processes, such as applications built with React, is planned for a future release.

## Installation and Usage
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
5. Run the script and enter passkeys, git clone urls, etc. as prompted
  ```bash
  ./ssh_execute.sh
  ```

## Disclaimer
Please adhere to all SFU CSIL (Computing Science Instructional Labs) policies: https://www.sfu.ca/computing/about/support/csil/policies.html  

**Use at Your Own Risk**: The information and tools provided in this documentation are on an "as is" basis without warranties of any kind, either express or implied. The use of the tools, scripts, or information is entirely at the user's own risk. The creator or contributors of this documentation cannot be held responsible for any damages or losses that occur from using the content provided here. Users are encouraged to test and evaluate the tools and scripts in a safe, non-production environment before any operational use. By using the information provided, the user acknowledges and agrees to assume all risks associated with their use.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
