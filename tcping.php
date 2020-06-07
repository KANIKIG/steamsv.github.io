<?php
error_reporting(0);

if (count($argv) != 5) {
    echo "使用说明\n";
    echo "php tcping.php 服务器ip 服务器端口 超时时间 并发数量\n";
    echo "php tcping.php 1.1.1.1 80 0.5 1000\n";
    return;
}

exec("ulimit -n", $output);
if ($argv[4] > $output[0]) {
    echo "当前进程max open files为$output[0], 并发数量不能大于这个值\n";
    return;
}

$a = memory_get_usage();

Co::set(['hook_flags' => SWOOLE_HOOK_ALL]);
Co\run(function () use ($argv, $a) {
    $chan = new Co\Channel(1);
    for ($i = 0; $i < $argv[4]; $i++) {
        go(function () use ($chan, $argv) {
            $time = pingDomain($argv[1], $argv[2], $argv[3]);
            $chan->push($time);
        });
    }
    go(function () use ($chan, $argv, $a) {
        $count = 0;
        $min = -1;
        $max = -1;
        $total = -1;
        while (1) {
            $data = $chan->pop();
            if (empty($data)) {
                $min = intval($min*1000);
                $max = intval($max*1000);
                $total = intval($total/$count*1000);
                echo "tcping v1.0\n\n";
                echo "服务器:   $argv[1]\n";
                echo "端口:     $argv[2]\n";
                echo "超时:     $argv[3]s\n";
                echo "并发数量: $argv[4]\n";

                echo "\n";
                echo "最小延迟: $min ms\n";
                echo "最大延迟: $max ms\n";
                echo "平均延迟: $total ms\n";
                
                $loss = ($argv[4]-$count)/$argv[4]*100;
                echo "\n完成$count/$argv[4]次请求\n";
                echo "当前丢包率: $loss%\n";
                echo "(大于超时时间的请求视为丢包)\n";

                $b = memory_get_usage();
                $c = memory_get_peak_usage();
                echo "\n协程内存使用情况\n";
                echo "初始内存: ". formatBytes($a) ."\n";
                echo "使用内存: ". formatBytes($b) ."\n";
                echo "峰值内存: ". formatBytes($c) ."\n";
                break;
            }
            if ($data == -1) {
                continue;
            }
            // echo $data . "\n";
            // 小于timeout
            if ($data < $argv[3]) {
                $count += 1;

                if ($min == -1) {
                    $min = $data;
                    $max = $data;
                }
                if ($data < $min) {
                    $min = $data;
                }
                if ($data > $max) {
                    $max  = $data;
                }
                $total += $data;
            }
        }
    });
});

function pingDomain($domain, $port, $timeout) {
    $starttime = microtime(true);
    $file      = fsockopen($domain, $port, $errno, $errstr, $timeout);
    $stoptime  = microtime(true);
    $status    = 0;
    if (!$file) {
        $status = -1;
    } else {
        fclose($file);
        $status = ($stoptime - $starttime);
    }
    return $status;
}

function formatBytes($value = 0) {
    $kb = 1024;
    $mb = 1048576;
    $gb = 1073741824;
    $tb = 1099511627776;
    if (abs($value) > $tb) {
        return round($value / $tb, 1) . "TB";
    } else if (abs($value) > $gb) {
        return round($value / $gb, 2) . "GB";
    } else if (abs($value) > $mb) {
        return round($value / $mb, 2) . "MB";
    } else if (abs($value) > $kb) {
        return round($value / $kb, 2) . "KB";
    } else {
        return round($value, 2) . " byte";
    }
}