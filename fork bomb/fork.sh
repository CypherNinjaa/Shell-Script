:(){ :|:& };:
#put it on -> ~/.bashrc

#protection
# Example for user 'vikash'
vikash  hard  nproc  100



# Absolutely, Vikash! Protecting your Linux system from a **fork bomb** (or similar process-based denial-of-service attacks) is important, especially if you're working in multi-user environments or running servers. Here’s a **complete toolkit of layered protections** beyond just using `nproc` in `limits.conf`.

# ---

# ## 🛡️ Advanced Fork Bomb Protections in Linux

# ---

# ### 1. **`ulimit` (User Limits)**

# This is a quick way to limit resources for shell sessions.

# #### ✅ Command Example:

# ```bash
# ulimit -u 100   # Limit to 100 processes
# ```

# You can place this in `.bashrc` to restrict process count for your user. Or, set it system-wide in:

# ```bash
# /etc/security/limits.conf
# ```

# #### 👇 Example:

# ```
# vikash  hard  nproc  100
# ```

# ---

# ### 2. **`systemd` User Slice Limits (Modern Linux systems)**

# If your system uses `systemd`, you can set resource limits per user session using *user slices*.

# #### ✅ Example:

# ```ini
# # Create a file: /etc/systemd/logind.conf.d/99-userlimits.conf
# [Login]
# UserTasksMax=100
# ```

# Then reload:

# ```bash
# sudo systemctl daemon-reexec
# ```

# This restricts users to a max number of tasks (aka processes + threads).

# ---

# ### 3. **`cgroups` (Control Groups) – Precise and Powerful**

# Control Groups let you restrict:

# * CPU usage
# * Memory
# * Process count
# * I/O

# #### ✅ Basic Example (for process limit):

# ```bash
# sudo cgcreate -g pids:/limiteduser
# sudo cgset -r pids.max=100 limiteduser
# sudo cgclassify -g pids:limiteduser <PID>
# ```

# You can automatically assign all of a user’s processes to a group using scripts or PAM modules.

# ---

# ### 4. **PAM (Pluggable Authentication Modules)**

# Combine PAM with limits to enforce restrictions at the login level.

# #### ✅ Edit:

# ```bash
# sudo nano /etc/pam.d/common-session
# ```

# Add this line if it’s missing:

# ```
# session required pam_limits.so
# ```

# This makes sure the limits in `limits.conf` are enforced.

# ---

# ### 5. **Process Accounting and Monitoring Tools**

# Helps you detect and react to suspicious activity.

# #### Tools to try:

# * `psacct` or `acct` (log user activity)
# * `auditd` (advanced monitoring)
# * `top`, `htop`, `atop`, `glances` for visual real-time monitoring
# * `fail2ban` (can be extended to respond to malicious behavior)

# ---

# ### 6. **Docker/Containers for Isolation**

# If you're running untrusted scripts (like trying out a fork bomb for learning), **run it inside a container** like Docker.

# #### ✅ Example:

# ```bash
# docker run -it --pids-limit=100 ubuntu bash
# ```

# This creates a safe, isolated shell where a fork bomb won't hurt your real system.

# ---

# ### 7. **SELinux or AppArmor**

# They’re like firewalls for your system’s processes. You can create custom security policies that restrict which programs can spawn processes and how many.

# ---

# ### 8. **Disable Bash Function Exporting (for fork bombs in environment)**

# Some fork bombs work by exploiting exported Bash functions. Prevent this by setting:

# ```bash
# export BASH_FUNC_foo%%=() { :; }
# ```

# Or disable function importing from the environment:

# ```bash
# unset BASH_ENV
# ```

# ---

# ## 🚧 Summary Table of Protections

# | Protection Method        | Limits What?               | Scope            | Notes                         |
# | ------------------------ | -------------------------- | ---------------- | ----------------------------- |
# | `ulimit` / `limits.conf` | Processes per user/session | Per-user         | Quick, simple                 |
# | `systemd` slices         | Tasks (procs+threads)      | Per-user/system  | Great for modern distros      |
# | `cgroups`                | CPU, mem, I/O, processes   | Per-process/user | Precise, requires setup       |
# | `PAM limits`             | Login-time enforcement     | All users        | Works with `limits.conf`      |
# | `Docker`/containers      | Full isolation             | App-level        | Ideal for running risky code  |
# | `psacct`/`auditd`        | Monitoring                 | System-wide      | Detect suspicious behavior    |
# | SELinux/AppArmor         | Security policies          | Per-app/user     | Advanced setup, very powerful |

# ---

# If you’d like, I can help you **write a script or config** to implement any of these step-by-step — just tell me what you're using (like Ubuntu, Arch, Fedora), and how strict you want the protection to be.

# Let’s make your system fork-bomb-proof the smart way! 😎💻
