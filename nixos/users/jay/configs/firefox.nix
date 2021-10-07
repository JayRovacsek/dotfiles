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
      "browser.safebrowsing.phishing.enabled" = false;
      "browser.safebrowsing.malware.enabled" = false;
      "browser.safebrowsing.downloads.enabled" = false;
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
      "media.peerconnection.ice.default_address_only" = true;
      "media.peerconnection.enabled" = false;
      "network.trr.resolvers" = ''
        "https://doh-jp.blahdns.com/dns-query",
        "https://doh.libredns.gr/dns-query",
        "https://doh.mullvad.net/dns-query"
      '';
      "network.trr.mode" = 3; # Only resolve via DoHTTPS
      "network.http.sendRefererHeader" = 0;
      "network.captive-portal-service.enabled" = false;
      "privacy.donottrackheader.enabled" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "services.sync.username" = "jay@rovacsek.com";
      "services.sync.prefs.sync.browser.startup.homepage" = true;
      "services.sync.prefs.sync.browser.startup.page" = true;
      "toolkit.telemetry.enabled" = false;
    };

    extraConfig = builtins.readFile
      (builtins.fetchGit { url = "git@github.com:JayRovacsek/user.js.git"; }
        + "/user.js");
  };
}
