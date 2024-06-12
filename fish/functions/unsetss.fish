function unsetss --description "unsetting proxy for Fish"
    unset https_proxy && unset http_proxy && unset all_proxy
end
