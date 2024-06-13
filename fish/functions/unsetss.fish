function unsetss --wraps=unset --description "unset proxy for terminal"
    set -e https_proxy && set -e http_proxy && set -e all_proxy
end 
