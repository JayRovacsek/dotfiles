#!/bin/sh

for VARIABLE in cs docker Go java js other ps py rb rs sh tex dart
do
    mkdir -p ~/dev/work/$VARIABLE
    mkdir -p ~/dev/personal/$VARIABLE
done

mkdir -p ~/dev/config

# TODO: Add list of installed applications via package manager for reinstall
case "$(uname -s)" in
    Darwin)
        echo 'Mac OS X'
    ;;
    Linux)
        echo 'Linux'
    ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo 'MS Windows'
    ;;
    *)
        echo 'Other OS'
    ;;
esac

ln -s ~/dev/config/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev/config/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dev/config/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/dev/work/sh/scripts ~/

# add config repos
git clone git@github.com:JayRovacsek/dotfiles.git ~/dev/work/config/dotfiles
git clone git@github.com:nib-group/qualys-queries.git ~/dev/work/config/QualysQueries

# add shell script repos
git clone git@github.com:JayRovacsek/scripts.git ~/dev/work/sh/scripts
git clone git@github.com:nib-group/qualys-update-tags.git ~/dev/work/sh/qualys-update-tags

# add rust repos
git clone git@github.com:nib-group/user-audits.git ~/dev/work/rs/user-audits
# git clone git@git.nib.com.au:jrovacsek/virustotal-ioc-check.git ~/dev/work/rs/virustotal-ioc-check
# git clone git@git.nib.com.au:jrovacsek/supplier-assurance-management.git ~/dev/work/suppier-assurance-management
# git clone git@git.nib.com.au:jrovacsek/csv-to-html-table.git ~/dev/work/csv-to-html-table

# add tex repos
# git clone git@git.nib.com.au:jrovacsek/tex-notes.git ~/dev/work/tex

# add python repos
# git clone git@git.nib.com.au:jrovacsek/py-compare-user-lists.git ~/dev/work/py/compare-user-lists
# git clone git@git.nib.com.au:jrovacsek/py-lazyman.git ~/dev/work/py/lazyman
# git clone git@git.nib.com.au:jrovacsek/py-airwatch.git ~/dev/work/py/airwatch
# git clone git@git.nib.com.au:jrovacsek/ctf-preemptive-2019.git ~/dev/work/py/ctf-preemptive-2019
# git clone git@git.nib.com.au:jrovacsek/py-qualys.git ~/dev/work/py/qualys
# git clone git@git.nib.com.au:jrovacsek/py-log-parse.git ~/dev/work/py/log-parse
# git clone git@git.nib.com.au:jrovacsek/py-lazyEmail.git ~/dev/work/py/lazy-email

# add js repos
git clone git@github.com:nib-group/qualys-compliance-gatherer.git ~/dev/work/js/qualys-compliance-gatherer
# git clone git@git.nib.com.au:jrovacsek/js-commsAudit.git ~/dev/work/js/commsAudit
# git clone git@git.nib.com.au:jrovacsek/js-shokta.git ~/dev/work/js/shokta
# git clone git@git.nib.com.au:jrovacsek/js-commsAudit-spa.git ~/dev/work/js/commsAudit-spa

# add docker repos
# git clone git@git.nib.com.au:jrovacsek/noders.git ~/dev/work/docker

# add Go repos
# git clone git@git.nib.com.au:jrovacsek/go-spa.git ~/dev/work/Go/go-spa
# git clone git@git.nib.com.au:jrovacsek/go-verifytls.git ~/dev/work/Go/verifytls

# add c# repos
# git clone git@git.nib.com.au:jrovacsek/cs-accountExpiryAudit.git ~/dev/work/cs/accountExpiryAudit
# git clone git@git.nib.com.au:jrovacsek/cs-bitlockerAudit.git ~/dev/work/cs/bitlockerAudit
