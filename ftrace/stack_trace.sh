
# 进入tracing 目录
cd /sys/kernel/debug/tracing

# 清空trace
echo > trace

# 将tracer设置为function
echo function > current_tracer

# 设置要trace的函数, 需要确保这个函数在available_filter_function中
echo default_idle_call > set_ftrace_filter
echo 1  > options/func_stack_trace # 设置调用栈选项

# 开始追踪
echo 1 > tracing_on

sleep 0.01

# 结束追踪
echo 0 > tracing_on

cat trace


echo > set_ftrace_filter

echo nop > current_tracer

echo 0 > options/func_stack_trace
