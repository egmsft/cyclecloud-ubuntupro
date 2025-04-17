#!/bin/bash

create_detach_script() {
    local script_path=$1
    local script_dir=$(dirname "$script_path")

    if [ -e "$script_path" ]; then
        cat << 'EOF' >> "$script_path"

pro detach --assume-yes

EOF
    else
        # Create the script directory if it doesn't exist
        mkdir -p "$script_dir"

        # Create the script
        cat << 'EOF' > "$script_path"
#!/bin/bash

pro detach --assume-yes

EOF
    fi

    # Make the script executable
    chmod +x "$script_path"
}

PLATFORM=$(jetpack config platform)
if [ "$PLATFORM" != "ubuntu" ]; then
    exit 0
fi

TERMINATE_SCRIPT=/opt/cycle/jetpack/scripts/onTerminate.sh
PREEMPT_SCRIPT=/opt/cycle/jetpack/scripts/onPreempt.sh

# Call the function with the script paths
create_detach_script "$TERMINATE_SCRIPT"
create_detach_script "$PREEMPT_SCRIPT"


