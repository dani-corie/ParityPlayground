# ParityPlayground

This is a Docker image for a single-node PoA Parity blockchain, for dev testing purposes. Note that you need Docker installed on your system to use this (duh)... Also, I use Linux and MacOS, so I couldn't really test on Windows, or even take it into account. That said, there's nothing in here that should be problem with Docker for Windows, and the scripts are mainly for convenience...

## Getting started

You can build the image using `sudo ./build.sh`.

Once the image is built, `sudo ./run.sh` will pre-populate key files for some test accounts and then start the Parity instance.

The key files for the test accounts are under `config/keysBkup`, which will be copied to `chainData/keys` (where Parity will be looking for them). Note that since Docker runs as root, files created by the running image in mounted folders will be created with root:root as owner.

The container will be started in interactive mode (ie. it will be attached to your terminal console, so you can see the messages output by the Parity instance.) Stopping Parity via ctrl+C in the console will automatically shut down the Docker image as well.

The run.sh script has a number of port and folder mappings configured. Once the container is running, you can access the graphical UI with a browser using the address http://localhost:8180/ (this is the conventional address for a Parity GUI, so if you’re running another Parity instance, say for the Mainnet or Kovan on your machine, then you should edit run.sh to change the outside port mappings.

## Using the environment

You’ll see when you log in that I have set up six accounts. All of them would be very insecure in a real-world scenario, as both the password and recovery phrase are identical to the account name on all six:

* alice: test user account

* bob: test user account

* carol: test user account

* dave: test user account

* funder: pre-funded with 1000 ether in the genesis block (the amount is adjustable in chain.json)

* signer: the account used for signing blocks

In the Settings tab, I suggest you enable the Contracts view, which allows you to deploy the contracts you're testing, while I also recommend disabling Addressbook and Applications, to unclutter the screen.

## Troubleshooting

Parity will whine quite a bit about not being connected to any peers, and barely any blocks will be generated when there is no activity, but it will work, and transactions will be mined within 5 seconds after they are posted.

If you get a message asking you to generate a token to access the Parity secure API, you can either do it, or, to make things a LOT easier, you can just delete everything under the chainData/signer folder. After this, reloading your browser window should get you into Parity without issues. :)
