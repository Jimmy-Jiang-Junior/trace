
# 进入tracing 目录
cd /sys/kernel/debug/tracing

# 清空trace
echo > trace

# 将tracer设置为function
echo function_graph > current_tracer

# 设置要trace的函数, 需要确保这个函数在available_filter_function中
echo do_idle > set_graph_function

echo 3 > max_graph_depth

# 开始追踪
echo 1 > tracing_on

sleep 0.001

# 结束追踪
echo 0 > tracing_on

cat trace

echo 0 > max_graph_depth

echo > set_graph_function

echo nop > current_tracer
