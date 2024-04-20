#!/bin/bash

# Function to generate the multiplication table in ascending order
generate_table_asc() {
    num=$1
    start=$2
    end=$3

    echo "Multiplication table for $num (ascending order):"

    for i in $(seq $start $end); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to generate the multiplication table in descending order
generate_table_desc() {
    num=$1
    start=$2
    end=$3

    echo "Multiplication table for $num (descending order):"

    for i in $(seq $end -1 $start); do
        echo "$num x $i = $((num * i))"
    done
}

# Main script
echo "Enter a number:"
read num

echo "Do you want to see the table in ascending or descending order? (Enter 'ascending' or 'descending'):"
read order

echo "Do you want to see a full multiplication table (1 to 10) or a partial table? (Enter 'full' or 'partial'):"
read choice

if [ "$choice" = "full" ]; then
    if [ "$order" = "ascending" ]; then
        generate_table_asc $num 1 10
    elif [ "$order" = "descending" ]; then
        generate_table_desc $num 1 10
    else
        echo "Invalid choice. Please enter 'ascending' or 'descending'."
    fi
elif [ "$choice" = "partial" ]; then
    echo "Enter the start of the range:"
    read start
    echo "Enter the end of the range:"
    read end
    if [ $start -gt $end ]; then
        echo "Invalid range. Showing full table instead."
        if [ "$order" = "ascending" ]; then
            generate_table_asc $num 1 10
        elif [ "$order" = "descending" ]; then
            generate_table_desc $num 1 10
        else
            echo "Invalid choice. Please enter 'ascending' or 'descending'."
        fi
    else
        if [ "$order" = "ascending" ]; then
            generate_table_asc $num $start $end
        elif [ "$order" = "descending" ]; then
            generate_table_desc $num $start $end
        else
            echo "Invalid choice. Please enter 'ascending' or 'descending'."
        fi
    fi
else
    echo "Invalid choice. Please enter 'full' or 'partial'."
fi

