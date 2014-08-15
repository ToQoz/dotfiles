BEGIN {
    FS = "\n";
    "whoami" | getline user
}

{
    if (system("test -d \"" $1 "/.git\"") != 0) {
        next
    }

    skip = 1
    # Give rev `HEAD` explicitly to prevent reading from stdin
    # https://github.com/git/git/blob/ad524f834a9acaaaceeb846d00ea609f79333a3d/builtin/shortlog.c#L274
    while ("git -C " $1 " --no-pager shortlog -nes HEAD" | getline repo) {
        if (tolower(repo) ~ user) {
            skip = 0
            break
        }
    }
}

!skip {
    print $1
}
