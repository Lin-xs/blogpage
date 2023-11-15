. $HOME/.nvm/nvm.sh; \
NODE_VERSION=$(node -v); \
NODE_VERSION_MAJOR=$(echo $NODE_VERSION | sed 's#v##' | cut -d'.' -f1); \
NODE_VERSION_MAX="10"; \
if [ "$NODE_VERSION_MAJOR" -gt "$NODE_VERSION_MAX" ]; then \
    echo "Your node version $NODE_VERSION is too high. Try to use version 10."; \
    nvm use $NODE_VERSION_MAX; \
fi;\
gitbook init
gitbook serve