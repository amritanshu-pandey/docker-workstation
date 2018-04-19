#!/bin/bash
## Remove or edit this sample code as per your requirement
if [ -d "${HOME}/.ssh" ]; then
  echo "Setting permission for \"${HOME}\"/.ssh"
  chmod -R 700 "${HOME}"/.ssh
fi