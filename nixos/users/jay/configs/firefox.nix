let
  pkgs = import <nixpkgs> { };
  nur = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
in {
  extensions = with nur.repos.rycee.firefox-addons; [
    decentraleyes
    keepassxc-browser
    multi-account-containers
    noscript
    okta-browser-plugin
    privacy-badger
    ublock-origin
    user-agent-string-switcher
  ];
  profiles.options = {
    name = "jay";
    settings = {
      "browser.aboutConfig.showWarning" = false;
      "browser.cache.disk.capacity" = 1048576;
      "browser.contentblocking.category" = "strict";
      "browser.startup.homepage" = "about:home";
      "browser.search.context.loadInBackground" = false;
      "browser.search.hiddenOneOffs" = "Bing,Wikipedia (en),Amazon.com.au,eBay";
      "browser.search.log" = false;
      "browser.search.region" = "AU";
      "browser.search.searchEnginesURL" =
        "https://addons.mozilla.org/%LOCALE%/firefox/search-engines/";
      "browser.search.isUS" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "dom.security.https_only_mode" = true;
      "network.trr.custom_uri" = "https://doh-jp.blahdns.com/dns-query";
      "network.trr.uri" = "https://doh-jp.blahdns.com/dns-query";
      "network.trr.mode" = 2;
      "privacy.donottrackheader.enabled" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "services.sync.username" = "jay@rovacsek.com";
      "services.sync.prefs.sync.browser.startup.homepage" = true;
      "services.sync.prefs.sync.browser.startup.page" = true;
    };
  };
}
