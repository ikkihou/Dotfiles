function setss --description "setting proxy for Fish"
    export https_proxy="http://127.0.0.1:7890";export http_proxy="http://127.0.0.1:7890";export all_proxy="socks5://127.0.0.1:7890";
end

