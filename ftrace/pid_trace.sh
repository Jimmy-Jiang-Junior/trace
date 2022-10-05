
# 跟踪pid为0的进程调用的函数, pid为0的进程是idle进程
pid=0

# 进入tracing 目录
cd /sys/kernel/debug/tracing

# 清空trace
echo > trace

# 将tracer设置为function
echo function > current_tracer

# 设置要trace的函数, 需要确保这个函数在available_filter_function中
echo $pid > set_ftrace_pid

# 开始追踪
echo 1 > tracing_on

sleep 2

# 结束追踪
echo 0 > tracing_on

cat trace

echo > set_ftrace_pid

echo nop > current_tracer

