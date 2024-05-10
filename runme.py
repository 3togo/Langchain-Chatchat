import startup
import warnings
from langchain import LangChainDeprecationWarning

# 忽略 LangChainDeprecationWarning 警告
warnings.filterwarnings("ignore", category=LangChainDeprecationWarning)

startup.__main__()
