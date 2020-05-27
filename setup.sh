#!/bin/sh

for VARIABLE in config cs docker Go java js other ps py rb rs sh tex dart
do
    mkdir -p ~/dev/internal/$VARIABLE
    mkdir -p ~/dev/external/$VARIABLE
done

ln -s ~/dev/internal/config/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev/internal/config/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/dev/internal/config/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/dev/internal/sh/scripts ~/

# add config repos
git clone git@git.nib.com.au:jrovacsek/dotfiles.git ~/dev/internal/config/dotfiles
git clone git@git.nib.com.au:jrovacsek/QualysQueries.git ~/dev/internal/config/QualysQueries
git clone git@git.nib.com.au:jrovacsek/dotfiles.git ~/dev/internal/config/dotfiles
git clone git@git.nib.com.au:jrovacsek/buildkite-emojis.git ~/dev/internal/buildkite-emojis

# add shell script repos
git clone git@git.nib.com.au:jrovacsek/scripts.git ~/dev/internal/sh/scripts

# add rust repos
git clone git@git.nib.com.au:nib-au/user-audits.git ~/dev/internal/rs/user-audits
git clone git@git.nib.com.au:jrovacsek/virustotal-ioc-check.git ~/dev/internal/rs/virustotal-ioc-check
git clone git@git.nib.com.au:jrovacsek/supplier-assurance-management.git ~/dev/internal/suppier-assurance-management
git clone git@git.nib.com.au:jrovacsek/csv-to-html-table.git ~/dev/internal/csv-to-html-table

# add tex repos
git clone git@git.nib.com.au:jrovacsek/tex-notes.git ~/dev/internal/tex

# add python repos
git clone git@git.nib.com.au:jrovacsek/py-compare-user-lists.git ~/dev/internal/py/compare-user-lists
git clone git@git.nib.com.au:jrovacsek/py-lazyman.git ~/dev/internal/py/lazyman
git clone git@git.nib.com.au:jrovacsek/py-airwatch.git ~/dev/internal/py/airwatch
git clone git@git.nib.com.au:jrovacsek/ctf-preemptive-2019.git ~/dev/internal/py/ctf-preemptive-2019
git clone git@git.nib.com.au:jrovacsek/py-qualys.git ~/dev/internal/py/qualys
git clone git@git.nib.com.au:jrovacsek/py-log-parse.git ~/dev/internal/py/log-parse
git clone git@git.nib.com.au:jrovacsek/py-lazyEmail.git ~/dev/internal/py/lazy-email

# add js repos
git clone git@git.nib.com.au:jrovacsek/js-commsAudit.git ~/dev/internal/js/commsAudit
git clone git@git.nib.com.au:jrovacsek/js-shokta.git ~/dev/internal/js/shokta
git clone git@git.nib.com.au:jrovacsek/js-commsAudit-spa.git ~/dev/internal/js/commsAudit-spa

# add docker repos
git clone git@git.nib.com.au:jrovacsek/noders.git ~/dev/internal/docker

# add Go repos
git clone git@git.nib.com.au:jrovacsek/go-spa.git ~/dev/internal/Go/go-spa
git clone git@git.nib.com.au:jrovacsek/go-verifytls.git ~/dev/internal/Go/verifytls

# add c# repos
git clone git@git.nib.com.au:jrovacsek/cs-accountExpiryAudit.git ~/dev/internal/cs/accountExpiryAudit
git clone git@git.nib.com.au:jrovacsek/cs-bitlockerAudit.git ~/dev/internal/cs/bitlockerAudit
