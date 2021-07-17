GO_MOD_FILE="clashX/ClashX/goClash/go.mod"

echo "replace github.com/Dreamacro/clash => ./clash" >> $GO_MOD_FILE
echo "replace github.com/Dreamacro/go-shadowsocks2 => ./go-shadowsocks2" >> $GO_MOD_FILE

