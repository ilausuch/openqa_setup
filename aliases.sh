
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

function git_update_in_branch(){
  line=$(git status | head -n 1)
  branch=${line##* }

  git checkout master && \
  git fetch --all && \
  git pull && \
  git checkout $branch && \
  git rebase master
}
