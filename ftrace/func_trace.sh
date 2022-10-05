
# 进入tracing 目录
cd /sys/kernel/debug/tracing

# 清空trace
echo > trace

# 将tracer设置为function
echo function > current_tracer

# 设置要trace的函数, 需要确保这个函数在available_filter_function中
echo __arm64_sys_clone > set_ftrace_filter

# 开始追踪
echo 1 > tracing_on

# 执行命令触发一次clone操作
ls > /dev/null

# 结束追踪
echo 0 > tracing_on

cat trace

# 清除filter
echo > set_ftrace_filter

# 清除current_tracer
echo nop > current_tracer
