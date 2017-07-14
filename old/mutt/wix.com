source ~/.mutt/common

set imap_user = "yaroslavs@wix.com"
set imap_pass = `security find-generic-password -w -a "yaroslavs@wix.com" -l mutt-wix`

set folder = "imaps://imap.gmail.com:993" # Base IMAP path.
set spoolfile = "+INBOX"
set postponed="+[Gmail]/Drafts"
unset record # Gmail's SMTP servers take care of this

set realname = "Yaroslav Serhieiev"
set from = "yaroslavs@wix.com"
set smtp_url = "smtp://yaroslavs@wix.com@smtp.gmail.com:587/"
set smtp_pass = `security find-generic-password -w -a "yaroslavs@wix.com" -l mutt-wix`

set header_cache = "~/.mutt/cache/wix-headers"
set message_cachedir = "~/.mutt/cache/wix-bodies"
