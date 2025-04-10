function unsetss --description "unsetting proxy for Fish"
    set -e https_proxy && set -e http_proxy && set -e all_proxy
end
