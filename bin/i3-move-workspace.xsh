#!/usr/bin/env xonsh
# vim:ft=python

import json
import sys

workspaces = $(i3-msg -t get_workspaces)
workspaces = json.loads(workspaces)
outputs = $(i3-msg -t get_outputs)
outputs = json.loads(outputs)

focused_workspace = [w for w in workspaces if w['focused']][0]
focused_output = False
for output in outputs + outputs:
    if focused_output and output['active']:
        next_output = output['name']
        break
    if output['name'] == focused_workspace['output']:
        focused_output = True
else:
    sys.exit(1)

exec i3-msg @('move workspace to output ' + next_output)
