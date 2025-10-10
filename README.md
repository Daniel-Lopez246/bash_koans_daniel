# Bash Koans

So I set up to learn Bash better. Normally I try to learn by doing koans, but I could not find any, so I decided to learn by building koans for Bash.

## DISCLAIMER

I am no Bash expert. This is a project strictly for learning and fun. It's also not complete, I'm doing this when I have a moment.

If you are an expert, PLEASE contribute and make it even better!

### How to

Just clone this repo and run:

    ./meditate

### License

License is MIT. See LICENSE for details.

## Lessons Learned from Bash Koans

### 6. Return Value Koan
- **Understanding `$?`:** Every command in Bash sets an exit status stored in `$?`.  
  - `0` indicates success.  
  - Non-zero indicates failure (commonly `1`).  
- **Examples:**
  - `cd /nonexistent` → exit status `1` (failure).  
  - `ls ~/` → exit status `0` (success).  
- **Key takeaway:** Always check `$?` to determine if a command succeeded or failed, especially in scripts that depend on previous commands.

### 7. Variables Koan
- **Local vs Global Variables:**
  - `local` variables are only visible within the function they are defined in.  
  - Variables defined without `local` are global and accessible anywhere.  
- **Variable Expansion:**
  - Variables expand inside double quotes (`"foo $var"`) and with `${var}` syntax (`this_is_${var}_yay`).  
- **Unsetting Variables:**
  - `unset var` removes a variable value so it no longer exists.  
- **Exporting Variables:**
  - Only exported variables (`export VAR=value`) are visible to processes.  
  - Local or nonexported variables remain invisible to processes.  
- **Key takeaway:** Understanding scoping and exporting is crucial for writing reliable Bash scripts.