source ~/.mutt/common

set imap_user = "noomorph@gmail.com"
set imap_pass = `security find-generic-password -w -a "noomorph@gmail.com" -l mutt-gmail`

set folder = "imaps://imap.gmail.com:993" # Base IMAP path.
set spoolfile = "+INBOX"
set postponed="+[Gmail]/Drafts"
unset record # Gmail's SMTP servers take care of this

set realname = "Yaroslav Serhieiev"
set from = "noomorph@gmail.com"
set smtp_url = "smtp://noomorph@gmail.com@smtp.gmail.com:587/"
set smtp_pass = `security find-generic-password -w -a "noomorph@gmail.com" -l mutt-gmail`

set header_cache = "~/.mutt/cache/gmail-headers"
set message_cachedir = "~/.mutt/cache/gmail-bodies"
