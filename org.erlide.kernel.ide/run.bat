erl -sname master -setcookie erlide -pa ebin/ -pa lib/ -pa ../org.erlide.kernel.common/ebin -boot start_sasl  -env ERL_MAX_ETS_TABLES 1000000 +P 10000000 -s object -eval "application:start(erlv8)"