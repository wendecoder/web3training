# Exercises

### Setup steps

1. Fork this repository

2. Clone the forked repository

```bash
git clone https://github.com/<your github username>/web3training.git
```

don't forget to replace <your github username> with your actual github username.

3. Go to the repo folder

```bash
cd web3training
```

4. Install dependencies

```bash
npm install
```

5. Create .env file

```bash
touch .env && \
echo 'MNEMONIC="here is where your extracted twelve words mnemonic phrase should be put"' >> .env && \
echo 'PRIVATE_KEY="****************************************************"' >> .env && \
echo 'POKT_API_KEY="********************************"' >> .env && \
echo 'INFURA_API_KEY="********************************"' >> .env && \
echo 'INFURA_API_SECRET="********************************"' >> .env && \
echo 'ALCHEMY_API_KEY="EVf9FlS72e383snl7AY685-SVSqOzr97"' >> .env && \
echo 'ETHERSCAN_API_KEY="********************************"' >> .env &&
```

6. You can start making changes to the ```Homework.sol``` file.

7. Create new branch

```bash
git checkout -b <branch name>
```

8. Add, commit and push the changes after you are done with editing

```bash
git add .
git commit -m "<your commit message>"
git push origin <branch name>
```

9. Create PR(pull request) by going to github UI.