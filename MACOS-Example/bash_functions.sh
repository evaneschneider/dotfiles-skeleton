################################################################################
# This file contains all the bash functions that are specific to Janeway
################################################################################

# ==============================================================================
function message() {
    # Send a text or iMessage to one of my contacts.
    # Inputs:
    #     1: The full name of the contact I'm sending the message to
    #     2: The message to send
    invite="\"${1}\""
    text="\"${2}\""

    OSASCRIPT="$(which osascript)"
    Flags='-e'
    Preamble='tell application "Messages" to send'
    Postamble='to buddy'
    STRING="${Preamble} ${text} ${Postamble} ${invite}"

    "${OSASCRIPT}" "${Flags}" "${STRING}"
}
# ==============================================================================
