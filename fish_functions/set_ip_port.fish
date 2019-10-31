function set_ip_port
	if test (count $argv) -ne 2
        echo "Usage: "(status function)" IP PORT" >&2
        return 1
    end

    set -U IP $argv[1] 2>/dev/null
    set -g IP $argv[1] 2>/dev/null

    set -U PORT $argv[2] 2>/dev/null
    set -g PORT $argv[2] 2>/dev/null
end
