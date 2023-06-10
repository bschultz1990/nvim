# install Scoop
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
# irm get.scoop.sh | iex

scoop bucket add nerd-fonts

$pkglist = $(
    "git",
    "gh",
    "python",
    "which",
    "fzf",
    "unzip",
    "wget",
    "gzip",
    "pwsh",
    "curl",
    "firamono",
    "nodejs"
    )

foreach ( $pkg in $pkglist ) {
  scoop install $pkg
}

npm install -g trash-cli empty-trash-cli
