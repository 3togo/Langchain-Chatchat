import sys
import asyncio
import warnings

# 忽略 LangChainDeprecationWarning
warnings.filterwarnings("ignore",
                        category=DeprecationWarning,
                        message=r"LangChainDeprecationWarning")

# 忽略 PendingDeprecationWarning
warnings.filterwarnings("ignore", category=PendingDeprecationWarning)
for mdir in ["chatchat-server", "model-providers"]:
    sys.path.append(mdir)

# from chatchat_server.chatchat.startup import create_tables, start_main_server
import chatchat
from chatchat.startup import start_main_server
from chatchat.server.knowledge_base.migrate import create_tables

if __name__ == "__main__":
    create_tables()
    if sys.version_info < (3, 10):
        loop = asyncio.get_event_loop()
    else:
        try:
            loop = asyncio.get_running_loop()
        except RuntimeError:
            loop = asyncio.new_event_loop()

        asyncio.set_event_loop(loop)

    loop.run_until_complete(start_main_server())
