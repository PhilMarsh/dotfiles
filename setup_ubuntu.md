- first, update
    ```sh
    sudo apt update
    ```
- base tools
    ```sh
    sudo apt install curl wget git gcc make vim
    ```
    ```sh
    git config --global core.editor vim
    ```
- ssh keys
    ```sh
    ssh-keygen -t ed25519
    ```
- `pyenv`
    ```sh
    curl https://pyenv.run | bash
    ```
    ```sh
    sudo apt install \
        build-essential \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        tk-dev \
        xz-utils \
        zlib1g-dev
    ```
    ```sh
    pyenv install 3.12
    ```
- `poetry`
    ```sh
    curl -sSL https://install.python-poetry.org | python3 -
    ```
- `ydiff`
    ```sh
    curl -L https://raw.github.com/ymattw/ydiff/master/ydiff.py > ~/.local/bin/ydiff
    ```
    ```sh
    chmod +x ~/.local/bin/ydiff
    ```
