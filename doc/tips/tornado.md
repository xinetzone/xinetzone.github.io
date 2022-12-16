# tornado

## tornado 使用 `WindowsSelectorEventLoopPolicy()` 报错（Windows）

或者报：in add_reader raise NotImplementedError NotImplementedError

参考 [Prepare for python 3.8 on windows · Issue #2608 · tornadoweb/tornado (github.com)](https://github.com/tornadoweb/tornado/issues/2608)   

处理方法：在 `C:\Users\用户名\conda 路径\Lib\site-packages\tornado\platform\asyncio.py` 中添加如下代码：

```python
if sys.platform == 'win32':
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
```