_current_version=$(zig version)
_latest_version=$(zig-latest | grep '\.\d\++')

if [[ "$_current_version" == "$_latest_version" ]]; then
  echo -e "\033[1mzig is up to date\033[0m"
else
  echo -e "\033[1mzig is out dated\033[0m"
fi

echo "latest version: $_latest_version"
echo "current version: $_current_version"

