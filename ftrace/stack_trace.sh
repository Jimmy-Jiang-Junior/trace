
# 进入tracing 目录
cd /sys/kernel/debug/tracing

# 清空trace
echo > trace

# 将tracer设置为function
echo function > current_tracer

# 设置要trace的函数, 需要确保这个函数在available_filter_function中
echo default_idle_call > stack_trace_filter

# enable stack_tracer
echo 1  >  /proc/sys/kernel/stack_tracer_enabled

# 开始追踪
echo 1 > tracing_on

ls > /dev/null

# 结束追踪
echo 0 > tracing_on

cat stack_trace

# disable stack_tracer
echo 0  >  /proc/sys/kernel/stack_tracer_enabled

echo > stack_trace_filter

echo nop > current_tracer
