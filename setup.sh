if [[ -z "${GITHUB_USER}" ]]; then
  echo "You must define GITHUB_USER env variable"
  exit 1
fi

zypper --non-interactive --quiet update openQA
systemctl restart openqa*
systemctl status openqa* | grep -B2 Active

cd
ln -s /var/lib/openqa/tests/os-autoinst-distri-opensuse/
ln -s /var/lib/openqa/tests/os-autoinst-distri-opensuse/products/opensuse/needles/ opensuse-needles
ln -s /var/lib/openqa/tests/os-autoinst-distri-opensuse/products/sle/needles sle-needles

cd os-autoinst-distri-opensuse
git remote add origin https://github.com/$GITHUB_USER/os-autoinst-distri-opensuse.git
git fetch --all
git pull

cd
cd opensuse-needles
git remote add origin https://github.com/$GITHUB_USER/os-autoinst-needles-opensuse.git
git fetch --all
git pull

cd
cd sle-needles
git remote add origin https://gitlab.suse.de/$GITHUB_USER/os-autoinst-needles-sles.git
git fetch --all
git pull
