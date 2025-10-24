# https://github.com/macunha1/zsh-terraform/blob/master/terraform.zsh
# Terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
complete -o nospace -C /opt/homebrew/bin/terraform terraform

tf_prompt_info() {
	# dont show 'default' workspace in home dir
	[[ "$PWD" == ~ ]] && return
	# check if in terraform dir
	if [ -d .terraform ]; then
		workspace=$(terraform workspace show 2>/dev/null) || return
		echo "[${workspace}]"
	fi
}

# If you notice, aliases are bounded to each other
# Why? Gives the freedom to override the lower levels and to affect all of them
# e.g.: alias tfi=terraform init -no-color -reconfigure

alias tf=terraform

alias tfi='tf init'

alias tfp='tf plan'
alias tfip='tfi && tfp'

alias tfa='tf apply'
alias tfia='tfi && tfa'

alias tfd='tf destroy'
alias tfid='tfi && tfd'

# DANGER zone
alias tfa!='tfa -auto-approve'
alias tfia!='tfi && tfa!'
# DANGER++!!
alias tfd!='tfd -auto-approve'
alias tfid!='tfi && tfd!'

alias tfc='tf console'
alias tfg='tf graph'
alias tfc='tf console'
alias tfget='tf get'
alias tfimp='tf import'
alias tfo='tf output'
alias tfprov='tf providers'
alias tfpp='tf push'
alias tfr='tf refresh'
alias tfs='tf show'
alias tfst='tf state'
alias tft='tf taint'
alias tfunt='tf untaint'
alias tfv='tf validate'
alias tfver='tf version'
alias tfw='tf workspace'
alias tff='tf fmt'