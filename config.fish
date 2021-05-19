
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/merrill/google-cloud-sdk/path.fish.inc' ]; . '/Users/merrill/google-cloud-sdk/path.fish.inc'; end

alias c="clear && clear"
alias vim="nvim"
alias pip="python3 -m pip"
alias ipy="python3 -m IPython"
alias py="python3"
alias python="python3"
alias pycharm="open -a /Applications/PyCharm\ CE.app"
alias init="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias oops="fuck"
thefuck --alias | source

# Delicious AI aliases
alias deus="ssh merrill@98.202.95.148 -p 49155"
alias deusd="ssh deus_ex_machina@98.202.95.148 -p 49155"
alias anton0="ssh -i ~/DAI/AWS/g4dn4xlarge-1.pem ubuntu@ec2-13-56-14-40.us-west-1.compute.amazonaws.com"
alias anton1="ssh -i ~/DAI/AWS/g4dn2xlarge-1.pem ubuntu@ec2-13-57-38-144.us-west-1.compute.amazonaws.com"
alias anton2="ssh -i ~/DAI/AWS/g4dn2xlarge-1.pem ubuntu@ec2-54-193-45-123.us-west-1.compute.amazonaws.com"
alias anton3="ssh -i ~/DAI/AWS/g4dn2xlarge-1.pem ubuntu@ec2-54-193-73-147.us-west-1.compute.amazonaws.com"


source ~/DAI/code/cybernetics/.env

export FASTLANE_ITC_TEAM_ID="121940810"
export FASTLANE_USER="andrew.merrill@deliciousai.com"
export FASTLANE_PASSWORD="EHG33YGGU3voed"
export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD="mhsz-vdrc-cfxv-ecnj"


# Wrapper around git
#alias git="daigit"
