#!/bin/bash

# Function to run Madge with different configurations
run_madge() {
  local config=$1
  local enable_j=$2
  local args=$3
  
  local json_flag=""
  if [ "$enable_j" = true ]; then
    json_flag="-j"
  fi
  
  case $config in
    "madgerc")
      madge . $json_flag $args
      ;;
    "tsconfig")
      madge -c $json_flag --extensions ts,tsx --ts-config tsconfig.json src/index.ts $args
      ;;
    *)
      madge -c $json_flag --extensions ts,tsx src/index.ts $args
      ;;
  esac
}

# Determine which configuration to use
if [ -f ".madgerc" ]; then
  config="madgerc"
elif [ -f "tsconfig.json" ]; then
  config="tsconfig"
else
  config="default"
fi

# Run Madge and capture output
output=$(run_madge $config true)

# Check for circular dependencies
if echo "$output" | grep -q "^\[\]$"; then
  echo "✅ No circular dependencies found. Check passed! 🎉"
  exit 0
fi

echo "❌ Circular dependencies found. Check failed!😞"
echo "🔄 Rerunning with details..."
echo ""

# Rerun without -j flag for all configurations
output=$(run_madge $config false)
echo "$output"
exit 1

