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
    bookmarks = {
      "Duck Duck Go" = {
        keyword = "d";
        url = "https://duckduckgo.com/?q=%s";
      };
      "Google Search" = {
        keyword = "g";
        url = "https://www.google.com/search?q=%s";
      };
      "Google AU Search" = {
        keyword = "ga";
        url = "https://www.google.com.au/search?q=%a";
      };
      "Youtube" = {
        keyword = "y";
        url = "https://www.youtube.com/results?search_query=%s";
      };
      "Github Search" = {
        keyword = "gh";
        url = "https://github.com/search?q=%s";
      };
      "Dockerhub Search" = {
        keyword = "dh";
        url = "https://hub.docker.com/search?q=%s";
      };
      "Nix Pkg Search" = {
        keyword = "np";
        url =
          "https://search.nixos.org/packages?channel=21.05&from=0&size=50&sort=relevance&query=%s";
      };
      "Nix Options Search" = {
        keyword = "no";
        url =
          "https://search.nixos.org/options?channel=21.05&from=0&size=50&sort=relevance&query=%s";
      };
      "nib Jira Search" = {
        keyword = "j";
        url =
          "https://jira.nib.com.au/issues/?jql=text~%22%s%22%20or%20description%20~%20%22%s%22%20or%20summary%20~%20%22%s%22";
      };
      "nib Confluence Search" = {
        keyword = "c";
        url =
          "https://confluence.nib.com.au/dosearchsite.action?cql=siteSearch+~+%22%s%22&queryString=%s";
      };
      "nib Github Search" = {
        keyword = "ngh";
        url = "https://github.com/nib-group?q=%s&type=&language=";
      };
      OSRSWiki = {
        keyword = "osrs";
        url =
          "https://oldschool.runescape.wiki/?search=%s&title=Special%3ASearch&fulltext=Search";
      };
    };
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
