Adding punctuation to specific logging lines:
```
# Pattern
logger.(info|debug)\("\/.*?[^\.](?="\)$)

# Replace
$0.

# From
self.logger.debug("/foo_request_received")

# To
self.logger.debug("/foo_request_received.")

# Explanation
logger          # Match any logger
.(info|debug)   # Match multiple logging levels
\("\/           # String starting with slash
.*?             # Match anything lazy
[^\.](?="\)$)   # String ending in ") but not .") without consuming the characters
```
