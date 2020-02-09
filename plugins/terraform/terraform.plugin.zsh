function tf_prompt_info() {
    # dont show 'default' workspace in home dir
    [[ "$PWD" == ~ ]] && return
    # check if in terraform dir
    if [[ -d .terraform && -r .terraform/environment  ]]; then
      workspace=$(cat .terraform/environment) || return
      if [[ "$workspace" == "default" ]]; then
        echo -n $ZSH_THEME_TF_PROMPT_PREFIX_DEFAULT
      else
        echo -n $ZSH_THEME_TF_PROMPT_PREFIX_NONDEFAULT
      fi
      echo -n "${workspace}"
      echo -n $ZSH_THEME_TF_PROMPT_SUFFIX
    fi
}

alias tf='terraform'
