#!/bin/bash

# Script to compile and run all Verilog testbenches in the ALU directory
# Usage: ./run_tests.sh

echo "=== Compiling and Running Verilog Testbenches ==="
echo ""

# Change to the ALU directory
cd "$(dirname "$0")"

# Function to compile and run a testbench
compile_and_run() {
    local tb_file="$1"
    local module_file="$2"
    local vvp_file="${tb_file%.v}.vvp"
    
    echo "Processing: $tb_file"
    echo "Module: $module_file"
    
    # Compile with iverilog
    if iverilog -o "$vvp_file" "$tb_file" "$module_file"; then
        echo "✓ Compilation successful: $vvp_file"
        
        # Run with vvp
        echo "Running simulation..."
        if vvp "$vvp_file"; then
            echo "✓ Simulation completed successfully"
        else
            echo "✗ Simulation failed"
        fi
    else
        echo "✗ Compilation failed for $tb_file"
    fi
    
    echo ""
}

# Process each testbench file
for tb_file in tb_*.v; do
    if [ -f "$tb_file" ]; then
        # Extract module name from testbench filename
        # Remove 'tb_' prefix and '.v' suffix
        module_name="${tb_file#tb_}"
        module_name="${module_name%.v}"
        module_file="${module_name}.v"
        
        # Check if the module file exists
        if [ -f "$module_file" ]; then
            compile_and_run "$tb_file" "$module_file"
        else
            echo "✗ Module file not found: $module_file (for $tb_file)"
            echo ""
        fi
    fi
done

echo "=== All tests completed ===" 