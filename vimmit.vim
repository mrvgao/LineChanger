python << pythonEnd
import vim

class LineChanger:
  def __init__(self):
    self.lineNum = vim.current.window.cursor[0]
    self.buffer = vim.current.buffer
  
  def takeTheLineDown(self):
    try:
      if self.lineNum - 1 >= 0:
        self.buffer[self.lineNum - 1], self.buffer[self.lineNum] = self.buffer[self.lineNum], self.buffer[self.lineNum - 1]
    except Exception,e:
      print e

  def takeTheLineUp(self):
    try:
      if self.lineNum - 2 >= 0:
        self.buffer[self.lineNum - 2], self.buffer[self.lineNum - 1] = self.buffer[self.lineNum -1], self.buffer[self.lineNum -2]
    except Exception,e:
      print e

  def takeTheLineDoubleDown(self):
    try:
      self.buffer.append(self.buffer[-1])
      bufferLineNum = len(self.buffer)
      for i in range(bufferLineNum-1,self.lineNum - 1,-1):
        self.buffer[i] = self.buffer[i-1]
    except Exception,e:
      print e

  def makeMap(self):
    try:
      vim.command("nmap <C-j> :python LineChanger().takeTheLineDown()<CR><Down>")
      vim.command("imap <C-j> <Esc>:python LineChanger().takeTheLineDown()<CR><Down>i<Right>")
      vim.command("nmap <C-k> :python LineChanger().takeTheLineUp()<CR><Up>")
      vim.command("imap <C-k> <Esc>:python LineChanger().takeTheLineUp()<CR><Up>i<Right>")
      vim.command("nmap <c-u> :python LineChanger().takeTheLineDoubleDown()<CR><Down><C-e>")   
      vim.command("nmap <c-d> :python LineChanger().takeTheLineDoubleDown()<CR>")
    except Exception,e:
      print e
pythonEnd

"Change The unuseful Captial W to the lower w
 
python LineChanger().makeMap()

 
 
