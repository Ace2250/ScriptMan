/bin/bash
# ScriptMan

# Rest of your script...

# Get a list of .sh files in the current directory
script_files=$(ls *.sh 2>/dev/null)

# Check if there are any .sh files
if [ -z "$script_files" ]; then
  echo "No .sh files found in the current directory."
  exit 1
fi

# Display the menu
echo "Available scripts:"
i=1
for script_file in $script_files; do
  echo "$i. $script_file"
  script_array[$i]=$script_file
  ((i++))
done

# Prompt for script selection
read -p "Enter the number of the script to run: " script_number

# Validate the script number
if ! [[ "$script_number" =~ ^[0-9]+$ ]] || [ "$script_number" -lt 1 ] || [ "$script_number" -gt "$((i-1))" ]; then
  echo "Invalid script number."
  exit 1
fi

# Run the selected script
selected_script="${script_array[$script_number]}"
chmod +x "$selected_script"
./"$selected_script"