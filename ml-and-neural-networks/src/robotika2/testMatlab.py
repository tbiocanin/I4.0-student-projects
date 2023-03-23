from oct2py import octave, __file__ as octave_path 
import os

_ = octave.addpath(os.path.join(os.path.dirname(octave_path), 'tests'))

out = octave.testF(2)
print(out)