from brownie import accounts, network,config

LOCAL_BLOCKCHAIN = ['mainnet-fork']

def get_account(index = None, id = None):
    if index:
        return accounts[0]
    if id:
        return accounts.load(id)
    if network.show_active() in LOCAL_BLOCKCHAIN:
        return accounts[0]
    if network.show_active() not in LOCAL_BLOCKCHAIN:
        return accounts.add(config["wallets"]["from_key"])
    return None

def main():
    get_account()