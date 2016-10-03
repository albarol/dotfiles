function pip-upgrade -d "Update all packages"
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
end
