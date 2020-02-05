
function run_opensuse_x11(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.opensuse.org $2 SCHEDULE="tests/boot/boot_to_desktop,tests/x11/window_system,tests/x11/$1"
}


function run_opensuse_console(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.opensuse.org $2 SCHEDULE="tests/boot/boot_to_desktop,tests/console/$1"
}


function run_sle_x11(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.suse.de $2 SCHEDULE="tests/boot/boot_to_desktop,tests/x11/window_system,tests/x11/$1"
}


function run_sle_console(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.suse.de $2 SCHEDULE="tests/boot/boot_to_desktop,tests/console/$1"
}


function run_opensuse(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.opensuse.org $1
}


function run_sle(){
    /usr/share/openqa/script/clone_job.pl --skip-chained-deps --from openqa.suse.de $1
}

function git_update(){
  line=$(git status | head -n 1)
  branch=${line##* }

  if [ "$branch" = "master" ]; then
    git fetch --all && \
    git pull
  else
    git checkout master && \
    git fetch --all && \
    git pull && \
    git checkout $branch && \
    git rebase master
  fi
}

function git_update_all(){
  pushd .
  cd /var/lib/openqa/tests/os-autoinst-distri-opensuse/
  git_update
  cd /var/lib/openqa/tests/os-autoinst-distri-opensuse/products/opensuse/needles/
  git_update
  cd /var/lib/openqa/tests/os-autoinst-distri-opensuse/products/sle/needles
  git_update
  popd
}
