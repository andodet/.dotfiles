#!/bin/sh

package_file=./packages

echo "Installing packages from $package_file..."
while IFS= read -r package; do
    if [[ -n "$package" && "$package" != \#* ]]; then
        yay -S --sudoloop --noconfirm "$package"
    fi
done < "$package_file"
