#!/bin/bash

set -e

# Helpers
wipe="\033[1m\033[0m"

_information() {
    _color='\033[0;35m' #cyan
    echo "${_color} $1 ${wipe}"
}

_success() {
    _color='\033[0;32m' #green
    echo "${_color} $1 ${wipe}"
}

function init() {
   _information "Changing to App Directory..."
    cd $APP_PATH
    _success "Changed to App Directory"

    _information "Creating Virtual Environment..."
    python3 -m venv .venv
    _success "Created Virtual Environment"

    _information "Activating Virtual Environment..."
    source .venv/bin/activate
    _success "Activated Virtual Environment"

    _information "Installing Python Requirements..."
    pip install -r requirements.txt
    _success "Installed Python Requirements..."
}

function run() {
   _information "Changing to App Directory..."
    cd $APP_PATH
    ls -atrl
    _success "Changed to App Directory"

    _information "Activating Virtual Environment..."
    source .venv/bin/activate
    _success "Activated Virtual Environment"

    _information "Creating Virtual Environment..."
     uvicorn main:app --reload
    _success "Created Virtual Environment"
}

"$@"