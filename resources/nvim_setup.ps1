# install Scoop
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
# irm get.scoop.sh | iex

$pkg_scoop = $(
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
    "nodejs"
    )

foreach ( $pkg in $pkg_scoop ) {
  scoop install $pkg
}

$pkg_npm = $(
"trash-cli",
"empty-trash-cli"
)

foreach ( $pkg in $pkg_npm ) {
  npm install -g $pkg
}
