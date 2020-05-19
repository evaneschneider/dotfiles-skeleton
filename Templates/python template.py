#!/usr/bin/env python3
"""
================================================================================
 Written by Robert Caddy.  Created on %(date)s

 Description (in paragraph form)

 Dependencies:
     numpy
     timeit
     donemusic
     matplotlib

 Changelog:
     Version 1.0 - First Version
================================================================================
"""

import numpy as np
import matplotlib.pyplot as plt
from timeit import default_timer
import donemusic

plt.close('all')
start = default_timer()










print(f'\nTime to execute: {round(default_timer()-start,2)} seconds')
donemusic.nonstop() #other option available to the file? ~/')
